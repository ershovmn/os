#!/bin/bash
touch errors.log
grep -E -h -r "^ACPI" /var/log > ./errors.log
grep -E -h "[:alnum:][.][:alnum:]" ./errors.log