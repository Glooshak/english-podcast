#!/usr/bin/env bash

#This script work with cvlv audio programm

# path to a directory where episodes placed
target_directory=$ENGLISH_PODCAST_DIRECTORY
# file which holds a state of listening
state_file=$ENGLISH_STATE_FILE
# number of all episodes
final_episode=603

preceding_episode=$(cat $target_directory/$state_file)
episode_id=${preceding_episode:2:3}
if ((final_episode <= ($episode_id))); then
	echo "You have listened all the episodes"
else
	current_episode="EC$((${episode_id} + 1)).mp3"
	current_episode_path="${target_directory}/${current_episode}"
	echo ${current_episode} > $target_directory/$state_file
	echo "Started listening ${current_episode}"
	cvlc --audio-replay-gain-mode none $current_episode_path > /dev/null 2>&1
	echo "Finished liestening ${current_episode}"
fi

