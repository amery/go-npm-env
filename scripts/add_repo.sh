#!/bin/sh

set -eux

add_repo() {
	local repo="$1" path="src/$1" url= dom=
	shift

	case "$repo" in
	github.com/*)
		dom=${repo%%/*}

		case "${repo#$dom/}" in
		$USER/*|justprintit/*)
			url="ssh://git@$repo.git"
			;;
		*)
			url="https://$repo"
			;;
		esac
		;;
	*)
		url="https://$repo"
		;;
	esac

	git submodule add "$@" "$url" "$path"
}

add_repo "$@"
