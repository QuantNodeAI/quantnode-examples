#!/usr/bin/env bash
exclude=""
while getopts 'e:' OPTION; do
  case "$OPTION" in
    e)
      exclude="$OPTARG"
      ;;
    ?)
      echo "script usage: $(basename \$0) [-e file_to_exclude]" >&2
      exit 1
      ;;
  esac
done

dir_count=0
file_count=0

traverse() {
  dir_count=$((dir_count + 1))
  local directory=$1
  local prefix=$2

  local children=("$directory"/*)
  local child_count=${#children[@]}

  for idx in "${!children[@]}"
  do local child="${children[$idx]}"
     child=${child##*/}
     local child_prefix="    "
     local postfix=","

     if [[ "$child" == "$exclude" ]]; then
       continue
     fi

     if [ $idx -eq $(( ${#children[@]} - 1)) ]; then
       child_prefix="    "
       postfix=""
     fi

     if [ -d "$directory/$child" ]
     then
      echo "${prefix}${child_prefix}{\"type\":\"directory\",\"name\":\"${child}\",\"contents\":["
      traverse "$directory/$child" "$prefix$child_prefix"
      echo "${prefix}${child_prefix}]}${postfix}"
    else
      echo "${prefix}${child_prefix}{\"type\":\"file\",\"name\":\"${child}\"}${postfix}"
      file_count=$((file_count + 1))
    fi

    done
}

root="."
prefix="    "
#[ "$#" -ne 0 ] && root="$1"
echo "["
echo "${prefix}{\"type\":\"directory\",\"name\":\"${root}\",\"contents\":["

traverse $root "${prefix}"
echo "${prefix}]}"
echo "]"
#echo
#echo "$((dir_count - 1)) directories, $file_count files"
