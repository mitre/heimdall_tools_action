#!/bin/sh

set -e

if [ -n "$INPUT_FILE" ] && [ -n "$INPUT_CONVERTER" ]; then
  echo "Using $(heimdall_tools version)"
  case "$INPUT_CONVERTER" in
    "fortify_mapper" )
      heimdall_tools fortify_mapper -f "$INPUT_FILE" -o "heimdall_tools_fortify"
      ;;
    "zap_mapper" )
      heimdall_tools zap_mapper -j "$INPUT_FILE" -o "heimdall_tools_zap"
      ;;
    "burpsuite_mapper" )
      heimdall_tools burpsuite_mapper -x "$INPUT_FILE" -o "heimdall_tools_burpsuite"
      ;;
    "nessus_mapper" )
      heimdall_tools nessus_mapper -x "$INPUT_FILE" -o "heimdall_tools_nessus"
      ;;
    "snyk_mapper" )
      heimdall_tools snyk_mapper -j "$INPUT_FILE" -o "heimdall_tools_snyk"
      ;;
    "nikto_mapper" )
      heimdall_tools nikto_mapper -j "$INPUT_FILE" -o "heimdall_tools_nikto"
      ;;
    * )
      echo "$INPUT_CONVERTER is not a valid Converter";
      exit 1;
  esac
else
  echo "File and Converter arguments are required.";
  exit 1;
fi
