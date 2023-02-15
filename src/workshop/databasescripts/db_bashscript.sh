#!/bin/bash
for n in ./'01 - Tables'/*sql; do sqlcmd -i "$n"; done
for n in ./'02 - User Defined Functions'/*.sql; do sqlcmd -i "$n"; done
for n in ./'04 - Stored Procedures'/*.sql; do sqlcmd -i "$n"; done