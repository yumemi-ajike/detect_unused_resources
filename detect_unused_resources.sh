#!/bin/sh
# Usage:
# ```
# $ cd path/to/project_root
# $ sh path/to/detect_unused_resources.sh . project_name/Assets.xcassets imageset
# ```
# $1=The search path for .xib, .swift, .storyboard files in your project.
# $2=The path of .xcassets directory
# $3=Specify "imageset" or "colorset"

echo "Creating files from $1 ..."
files=(`find $1 -type f -name "R.generated.swift" -prune -o -type f \( -name '*.xib' -o -name '*.swift' -o -name '*.storyboard' \) -exec echo ''{}'' \;`)
echo "${#files[*]} files found."

echo "Creating $3 resources from $2 ..."
resources=(`find $2 -type d -name *.$3 -exec echo ''{}'' \;`)
number_of_resources=${#resources[*]}
echo "$number_of_resources resources found."

i=0
unused_resources=()

for resource in ${resources[*]}
do
	let "i += 1"

	name=`basename -s .$3 $resource`
	if ! grep -qhs "\b$name\b" ${files[*]}; then
		unused_resources+=( $name )
		echo "($i / $number_of_resources) $name is not referenced."
	else
		echo "($i / $number_of_resources)"
	fi
done

echo "${#unused_resources[*]} unused resources found.\n${unused_resources[*]}\n"
