#!/bin/bash

LIST_WEBSITES=("youtube.com" "twitter.com" "reddit.com" "news.ycombinator.com")
MARKER="#FOCUS🤔"
REDIRECT="127.0.0.1"
OUTPUT="/etc/hosts"

generate_output() {
  for WEBSITE in "${LIST_WEBSITES[@]}"
  do
    printf "${REDIRECT}     ${WEBSITE} ${MARKER}\n" 
    printf "${REDIRECT}     www.${WEBSITE} ${MARKER}\n" 
  done
}

INPUT=$1

if [[ $INPUT == "start" ]]; then
    generate_output >> $OUTPUT
elif [ $INPUT == "stop" ]; then
    sed -i -e "/${MARKER}/ d" $OUTPUT
else
    echo "Must use start or stop"
fi
