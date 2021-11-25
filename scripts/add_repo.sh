#!/bin/sh

set -eu

add_repo() {
	local repo="$1" path="src/$1"
	local url="https://$repo"
	local dom=${repo%%/*}
	local prj=${repo#$dom/}
	shift

	case "$dom" in
	github.com)
		case "$prj" in
		$USER/*)
			url="ssh://git@$repo.git"
			;;
		esac
		;;
	esac

	git submodule add "$@" "$url" "$path"
}

add_repo "$@"
