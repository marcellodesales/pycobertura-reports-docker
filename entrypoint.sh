#!/bin/sh

if [ ! -z ${REPORT_FILE} ]; then
  if [ -f ${REPORT_FILE} ]; then
    echo "WARN: replacing the existing report file at '${REPORT_FILE}'"
  fi
  echo "INFO: Generating the report at ${REPORT_FILE}"
  pycobertura $@ > ${REPORT_FILE}
 
else
  echo "INFO: Coverage report from xml"
  pycobertura $@
fi
