#!/bin/env python
###########################################################################################
#    Main Description:  This script used as lib file for API testing
###########################################################################################

import datetime
import re
import sys
from time import time

def validate_email(email):
    pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
    match = re.match(pattern,email)
    if match:
        return True
    else:
        return False
