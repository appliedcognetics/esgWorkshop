from azure.cognitiveservices.vision.customvision.training import CustomVisionTrainingClient
from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient
from azure.cognitiveservices.vision.customvision.training.models import ImageFileCreateBatch, ImageFileCreateEntry, Region
from msrest.authentication import ApiKeyCredentials
import os, time, uuid

# Set the environment variables before running the code
# export CV_TRAININGENDPOINT = Get endpoint from Cognitive Services Resource See Documentation
# export CV_TRAININGKEY  = Key from the Cognitive Services
# export CV_RESOURCEID = Resource ID from the "Properties of Cognitive Services"
# ENDPOINT = os.environ.get('CV_TRAININGENDPOINT') 
# training_key = os.environ.get('CV_TRAININGKEY') 
# prediction_key = os.environ.get('CV_PREDICTIONKEY') 
# prediction_resource_id = os.environ.get('CV_RESOURCEID') 

publish_iteration_name = "classifyModel"

ENDPOINT = "https://eastus.api.cognitive.microsoft.com/" #PASTE_YOUR_CUSTOM_VISION_TRAINING_ENDPOINT_HERE
training_key = "cd5beab3f70045a28e0374114503e5fb" #os.environ.get('CV_TRAININGKEY') 
prediction_resource_id ="/subscriptions/b89fd61c-968d-49b8-bf2d-75265bc24301/resourceGroups/t3cogserve/providers/Microsoft.CognitiveServices/accounts/nasdaqvision"
prediction_key = os.environ.get('CV_PREDICTIONKEY') 


credentials = ApiKeyCredentials(in_headers={"Training-key": training_key})
trainer = CustomVisionTrainingClient(ENDPOINT, credentials)
project_name = uuid.uuid4()
project = trainer.create_project(project_name)

print(os.environ.get('ENV1'))
print(os.path.dirname(__file__))

#print([{os.path.isdir(item):item} for item in os.listdir(".")])
tag_dict ={}

for item in os.listdir("."):
    if os.path.isdir(item):
        #add to the classification
        tag_dict.update({item : len(item)})  # replace len(item) with  trainer.create_tag(project.id, item)

print(tag_dict)

base_image_location = os.path.join (os.path.dirname(__file__), "images")

print(base_image_location)
print("Adding images...")
hemlock_tag = trainer.create_tag(project.id, "Hemlock")
#cherry_tag = trainer.create_tag(project.id, "Japanese Cherry")

image_list = []

for image_num in range(1, 20):
    file_name = "hemlock_{}.jpg".format(image_num)
    with open(os.path.join (base_image_location, "hemlock", file_name), "rb") as image_contents:
        image_list.append(ImageFileCreateEntry(name=file_name, contents=image_contents.read(), tag_ids=[hemlock_tag.id]))

print(len(image_list))

upload_result = trainer.create_images_from_files(project.id, ImageFileCreateBatch(images=image_list))


print ("Training...")
iteration = trainer.train_project(project.id)
while (iteration.status != "Completed"):
    iteration = trainer.get_iteration(project.id, iteration.id)
    print ("Training status: " + iteration.status)
    print ("Waiting 10 seconds...")
    time.sleep(10)


# The iteration is now trained. Publish it to the project endpoint
trainer.publish_iteration(project.id, iteration.id, publish_iteration_name, prediction_resource_id)
print ("Done!")


# trainer = CustomVisionTrainingClient(ENDPOINT, credentials)
# prediction_credentials = ApiKeyCredentials(in_headers={"Prediction-key": prediction_key})
# predictor = CustomVisionPredictionClient(ENDPOINT, prediction_credentials)

# # Create a new Custom Vision Project 

# publish_iteration_name = "classifyModel"

# # Create a new project
# print ("Creating project...")
# project_name = uuid.uuid4()
# project = trainer.create_project(project_name)

# # Make two tags in the new project
# # Interate through the directory structure to get the tags as the directory names
# hemlock_tag = trainer.create_tag(project.id, "Hemlock")
# cherry_tag = trainer.create_tag(project.id, "Japanese Cherry")


# # Upload and Tag Images

# base_image_location = os.path.join (os.path.dirname(__file__), "Images")

# print("Adding images...")

# image_list = []

# for image_num in range(1, 11):
#     file_name = "hemlock_{}.jpg".format(image_num)
#     with open(os.path.join (base_image_location, "Hemlock", file_name), "rb") as image_contents:
#         image_list.append(ImageFileCreateEntry(name=file_name, contents=image_contents.read(), tag_ids=[hemlock_tag.id]))

# for image_num in range(1, 11):
#     file_name = "japanese_cherry_{}.jpg".format(image_num)
#     with open(os.path.join (base_image_location, "Japanese_Cherry", file_name), "rb") as image_contents:
#         image_list.append(ImageFileCreateEntry(name=file_name, contents=image_contents.read(), tag_ids=[cherry_tag.id]))

# upload_result = trainer.create_images_from_files(project.id, ImageFileCreateBatch(images=image_list))
# if not upload_result.is_batch_successful:
#     print("Image batch upload failed.")
#     for image in upload_result.images:
#         print("Image status: ", image.status)
#     exit(-1)

# # Train the Project
# print ("Training...")
# iteration = trainer.train_project(project.id)
# while (iteration.status != "Completed"):
#     iteration = trainer.get_iteration(project.id, iteration.id)
#     print ("Training status: " + iteration.status)
#     print ("Waiting 10 seconds...")
#     time.sleep(10)

# #  Publish it to the project endpoint
# trainer.publish_iteration(project.id, iteration.id, publish_iteration_name, prediction_resource_id)
# print ("Done!")


# # Testing the Endpoint
# prediction_credentials = ApiKeyCredentials(in_headers={"Prediction-key": prediction_key})
# predictor = CustomVisionPredictionClient(ENDPOINT, prediction_credentials)

# with open(os.path.join (base_image_location, "Test/test_image.jpg"), "rb") as image_contents:
#     results = predictor.classify_image(
#         project.id, publish_iteration_name, image_contents.read())

#     # Display the results.
#     for prediction in results.predictions:
#         print("\t" + prediction.tag_name +
#               ": {0:.2f}%".format(prediction.probability * 100))