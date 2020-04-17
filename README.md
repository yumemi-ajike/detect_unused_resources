# detect_unused_resources
Shell script for detecting unused image and color resources in xcassets.

Usage:
```
$ cd path/to/project_root
$ sh path/to/detect_unused_resources.sh . project_name/Assets.xcassets imageset
```

$1=The search path for .xib, .swift, .storyboard files in your project.
$2=The path of .xcassets directory
$3=Specify "imageset" or "colorset"
