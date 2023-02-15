"use strict";(self.webpackChunk_dms_app_shell=self.webpackChunk_dms_app_shell||[]).push([[745],{8745:(e,t,n)=>{n.r(t),n.d(t,{Admin:()=>B,bootstrap:()=>U,mount:()=>R,unmount:()=>Y});var a=n(2784),r=n(8316),l=n(3382),c=n(1031),s=n(6164),o=(0,s.oM)({name:"homepageslice",initialState:{suggested_words:[],selected_text:""},reducers:{setText:function(e,t){e.selected_text=t.payload},setSuggestedWords:function(e,t){e.suggested_words=t.payload}}}),i=o.actions,m=i.setText,d=(i.setSuggestedWords,function(e){return e.homepage.selected_text});const u=o.reducer;var f=n(9431),p=n(5560),v=(0,s.oM)({name:"searchpanelslice",initialState:{textAndWordDetailsArray:[],searchedText:""},reducers:{settextAndWordDetailsArray:function(e,t){e.textAndWordDetailsArray=t.payload},setSearchedText:function(e,t){e.searchedText=t.payload}}}),h=v.actions,E=h.settextAndWordDetailsArray,g=h.setSearchedText,y=function(){return function(e,t){var n;e(E([])),(n=(0,f.cv)(t().searchpanel.searchedText),(0,p.ZP)({method:"post",headers:{"Content-Type":"text/plain"},url:"https://func-ms-cognitive-search.azurewebsites.net/api/v2/process-cognitive-search?code=wspBmUz4p45VswVZ3asPxAmsN-8TC9ZTwDy-tMxzYsz0AzFuum9rsQ==",data:n})).then((function(t){0!==t.data.tasks.items.length&&0!==t.data.tasks.items[0].results.documents.length&&0!==t.data.tasks.items[0].results.documents[0].categories.length?e(E(t.data.tasks.items[0].results.documents[0].categories)):e(E(["notfound"]))})).catch((function(e){}))}},N=function(e){return e.searchpanel.textAndWordDetailsArray},b=function(e){return e.searchpanel.searchedText};const x=v.reducer;const w=function(){var e=(0,c.v9)(d),t=(0,l.k6)(),n=(0,c.I0)(),r=function(a){var r;e.trim().length>0?(n(g(e)),r="/admin/search",t.push(r)):alert("enter something.")};return a.createElement("div",{className:"container py-4"},a.createElement("div",{className:"p-5 mb-4 bg-light rounded-3"},a.createElement("div",{className:"container-fluid py-5"},a.createElement("h1",{className:"display-5 fw-bold"},"Power of AI to next level!"),a.createElement("p",{className:"col-md-8 fs-4"},"Here you can search tons of documents those include pdf, image, non-relational documents."),a.createElement("div",{className:"row"},a.createElement("div",{className:"col-md-12"},a.createElement("textarea",{type:"text",className:" form-control maintextarea",placeholder:"Input Text",value:e,onChange:function(e){return t=e.target.value,void n(m(t));var t}}),a.createElement("button",{className:"btn btn-primary mt-2",onClick:function(e){r()}},"Analyze"))))))};var A=n(9725),S=n(7370);function k(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==n)return;var a,r,l=[],c=!0,s=!1;try{for(n=n.call(e);!(c=(a=n.next()).done)&&(l.push(a.value),!t||l.length!==t);c=!0);}catch(e){s=!0,r=e}finally{try{c||null==n.return||n.return()}finally{if(s)throw r}}return l}(e,t)||function(e,t){if(!e)return;if("string"==typeof e)return C(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);"Object"===n&&e.constructor&&(n=e.constructor.name);if("Map"===n||"Set"===n)return Array.from(e);if("Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))return C(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function C(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,a=new Array(t);n<t;n++)a[n]=e[n];return a}const T=function(e){var t=k((0,a.useState)(!1),2),n=t[0],r=t[1],l=k((0,a.useState)("#"+Math.floor(16777215*Math.random()).toString(16)),2),c=l[0];l[1];return a.createElement(a.Fragment,null,a.createElement("div",{className:"card m-1 row",style:{"border-left":"0.4em solid"+c}},a.createElement("div",{className:"card-header custom-card-header col-md-12",onClick:function(){r(!n)}},a.createElement("div",{className:"row"},a.createElement("div",{className:"col-md-6 align-self-center"},a.createElement("p",{className:"mb-0 customheader"},e.header)),a.createElement("div",{className:"col-md-5 align-self-center"},e.headerContent),a.createElement("div",{className:"col-md-1 align-self-center"},a.createElement("div",{className:"float-right iconblock"}," ",n?a.createElement(S.G,{icon:A.eW2}):a.createElement(S.G,{icon:A.I4f}))))),n&&a.createElement("div",{className:"card-content col-md-12"},e.content)))};function I(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==n)return;var a,r,l=[],c=!0,s=!1;try{for(n=n.call(e);!(c=(a=n.next()).done)&&(l.push(a.value),!t||l.length!==t);c=!0);}catch(e){s=!0,r=e}finally{try{c||null==n.return||n.return()}finally{if(s)throw r}}return l}(e,t)||function(e,t){if(!e)return;if("string"==typeof e)return _(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);"Object"===n&&e.constructor&&(n=e.constructor.name);if("Map"===n||"Set"===n)return Array.from(e);if("Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))return _(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function _(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,a=new Array(t);n<t;n++)a[n]=e[n];return a}const z=function(e){var t=I((0,a.useState)(""),2),n=t[0],r=t[1];return(0,a.useEffect)((function(){if(e.text.length>60){var t=e.text.slice(0,60)+"......";r(t)}else r(e.text)}),[e.text]),a.createElement(a.Fragment,null,a.createElement("span",null,n))};const W=function(e){return a.createElement(a.Fragment,null,a.createElement("div",{className:"small-card m-2"},a.createElement("div",{className:"row p-2 card-wrap"},a.createElement("div",{className:"col-md-12 p-0 border-top-of-small-card"},a.createElement("p",{className:"mb-0 mt-1 text-wrap text-break text-truncate"},a.createElement("b",null,"Entity Value:")," ",a.createElement(z,{text:e.details.text})),a.createElement("p",{className:"mb-0 text-wrap text-break"},a.createElement("b",null,"Confidence:")," ",(100*e.details.confidenceScore).toFixed(2)," %")))))};const D=function(){var e=(0,c.v9)(N),t=(0,c.v9)(b),n=(0,c.I0)(),r=(0,l.k6)();(0,a.useEffect)((function(){n(y())}),[]);return a.createElement("div",{className:"p-2 m-3"},a.createElement("div",{className:"row"},a.createElement("div",{className:"col-md-12"},a.createElement("div",null,a.createElement("button",{className:"btn p-0 mb-2 backBtn",onClick:function(){var e;e="/admin",r.push(e)}},a.createElement(S.G,{icon:A.DYF})," Back")))),e.includes("notfound")?a.createElement("div",{className:"row"},a.createElement("div",{className:"col-md-12"},a.createElement("p",{className:"paraForNotFound"},"No SDG's found, Please try again with different text, click on back button to enter the text again."," "))):a.createElement("div",{className:"row"},a.createElement("div",{className:"col-md-6 "},a.createElement("textarea",{readOnly:!0,className:"textAreaSt card-shadow",value:t})),a.createElement("div",{className:"col-md-6 card-shadow"},a.createElement("div",{className:"row scrollblock mt-1 mb-1"},e.map((function(e,t){return a.createElement("div",{className:"col-md-12",key:t.toString()},a.createElement(T,{header:e.categoryName,headerContent:a.createElement("div",{className:"row"},a.createElement("div",{className:"col-md-12"},a.createElement("div",{className:"float-right"},a.createElement("p",{className:"mb-0 customParagraph"},"Total : ",e.categoryItems.length)))),content:a.createElement("div",{className:"row mb-2"},e.categoryItems.map((function(e,t){return a.createElement("div",{className:"col-md-3 p-0",key:t.toString()},a.createElement(W,{details:e}))})))}))}))))))};var F=(0,s.oM)({name:"fullscreenloader",initialState:{loading:!1},reducers:{setLoading:function(e,t){e.loading=t.payload}}}),M=F.actions.setLoading,P=function(e){return e.fullscreenloader.loading};const j=F.reducer;const L=function(e){var t=(0,c.v9)(P);return a.createElement(a.Fragment,null,t&&a.createElement("div",{className:"overlay"},a.createElement("div",{className:"text-center middleloader"},a.createElement("div",{className:"spinner-border spinner-border-sm spinner-size-alter me-1",role:"status"},a.createElement("span",{className:"visually-hidden"},"Loading...")),a.createElement("div",{className:"spinner-grow spinner-grow-sm spinner-size-alter me-1",role:"status"},a.createElement("span",{className:"visually-hidden"},"Loading...")),a.createElement("div",{className:"spinner-border spinner-border-sm spinner-size-alter me-1",role:"status"},a.createElement("span",{className:"visually-hidden"},"Loading...")),a.createElement("div",{className:"spinner-grow spinner-grow-sm spinner-size-alter me-1",role:"status"},a.createElement("span",{className:"visually-hidden"},"Loading...")))))};var O=(0,s.xC)({reducer:{homepage:u,searchpanel:x,fullscreenloader:j}}),Z="/admin",G="/error";const B=function(e){return a.createElement("div",null,a.createElement(l.VK,null,a.createElement(c.zt,{store:O},a.createElement(l.rs,null,a.createElement(l.AW,{exact:!0,path:Z},a.createElement(w,null)),a.createElement(l.AW,{path:"/admin/search"},a.createElement(D,null)),a.createElement(l.AW,null,a.createElement(l.l_,{to:G}))),a.createElement(L,null))))};!function(e){var t=e.dispatch;p.ZP.interceptors.request.use((function(e){return t(M(!0)),e}),(function(e){return t(M(!1)),Promise.reject(e)})),p.ZP.interceptors.response.use((function(e){return t(M(!1)),e}),(function(e){return t(M(!1)),Promise.reject(e)}))}(O);var V=(0,n(6630).Z)({React:a,ReactDOM:r,rootComponent:B,domElementGetter:function(){var e="admin",t=document.getElementById(e);return t||((t=document.createElement("div")).id=e,document.body.appendChild(t)),t}}),U=[V.bootstrap],R=[V.mount],Y=[V.unmount]}}]);