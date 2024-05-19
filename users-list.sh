#!/bin/bash

##########################
# About: listing the collaboraters of github
# Pre-requisites: need to export username and personal access token of git
# Author: vijay narada
##########################

# GITHUB API URL

API_URL="https://api.github.com"

# GITHUB USERNAME AND TOKEN

USERNAME=$username
TOKEN=$token

#GITHUB USERNAME AND REPOSITORY

REPO_OWNER=$1
REPO_NAME=$2

# Function to get Github API

function github_api_get {
	local endpoint="$1"
	local url="${API_URL}/${endpoint}"

	# send a get request to Git API with authentication
	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

function list_users_with_read_access {
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	collaborators="$(github_api_get "$endpoint":)"

	# display the list of collaborators to repo

	if [[ -z "$collaborators" ]]; then
		echo "No users with read access found for "${REPO_OWNER}/${REPO_NAME}."

	else 
	        echo "users with read access to "${REPO_OWNER}/${REPO_NAME}:"
	        echo "$collaborators"
	fi
}


# main script

 echo "listing users to read access to ${REPO_OWNER}/${REPO_NAME}.."
 list_users_with_read_access



