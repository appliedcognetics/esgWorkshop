#!/bin/bash
for n in ~/clouddrive/'01 - Tables'/*sql; do sqlcmd -i "$n"; done
for n in ~/clouddrive/'02 - User Defined Functions'/*.sql; do sqlcmd -i "$n"; done
for n in ~/clouddrive/'04 - Stored Procedures'/*.sql; do sqlcmd -i "$n"; done