#!/bin/sh

set -eu

add_repo() {
	local repo="$1" path="src/$1" url=
	local dom=${repo%%/*}
	local prj=${repo#$dom/}
	shift

	# go-import translations
	case "$dom" in
	go.sancus.dev)
		dom="github.com"
		prj="sancus-project/go-$prj"
		repo="$dom/$prj"
		;;
	esac

	url="https://$repo"

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
