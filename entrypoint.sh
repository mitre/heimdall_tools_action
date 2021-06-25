#!/bin/sh

set -e

if [ -n "$INPUT_FILE" ] && [ -n "$INPUT_CONVERTER" ]; then
  echo "Using $(heimdall_tools version)"
  case "$INPUT_CONVERTER" in
    "fortify_mapper" )
      heimdall_tools fortify_mapper -f "$INPUT_FILE" -o "heimdall_tools_fortify.json"
      ;;
    "zap_mapper" )
      heimdall_tools zap_mapper -j "$INPUT_FILE" -o "heimdall_tools_zap.json"
      ;;
    "burpsuite_mapper" )
      heimdall_tools burpsuite_mapper -x "$INPUT_FILE" -o "heimdall_tools_burpsuite.json"
      ;;
    "nessus_mapper" )
      heimdall_tools nessus_mapper -x "$INPUT_FILE" -o "heimdall_tools_nessus.json"
      ;;
    "snyk_mapper" )
      heimdall_tools snyk_mapper -j "$INPUT_FILE" -o "heimdall_tools_snyk.json"
      ;;
    "nikto_mapper" )
      heimdall_tools nikto_mapper -j "$INPUT_FILE" -o "heimdall_tools_nikto.json"
      ;;
    "xccdf_results_mapper")
      heimdall_tools xccdf_results_mapper -x "$INPUT_FILE" -o "heimdall_tools_xccdf_results.json"
      ;;
    "jfrog_xray_mapper")
      heimdall_tools jfrog_xray_mapper -j "$INPUT_FILE" -o "heimdall_tools_jfrog_xray.json"
      ;;
    "dbprotect_mapper")
      heimdall_tools dbprotect_mapper -x "$INPUT_FILE" -o "heimdall_tools_dbprotect.json"
      ;;
    "netsparker_mapper")
      heimdall_tools netsparker_mapper -x "$INPUT_FILE" -o "heimdall_tools_netsparker.json"
      ;;
    "sarif_mapper")
      heimdall_tools sarif_mapper -j "$INPUT_FILE" -o "heimdall_tools_sarif.json"
      ;;
    "scoutsuite_mapper")
      heimdall_tools scoutsuite_mapper -j "$INPUT_FILE" -o "heimdall_tools_scoutsuite.json"
      ;;
    * )
      echo "$INPUT_CONVERTER is not a valid Converter";
      exit 1;
  esac
else
  echo "File and Converter arguments are required.";
  exit 1;
fi
