# logotypes
api for logotypes.dev open-source API that provides a vast collection of logos for various projects. Users can access random logos or search for specific logos with customizable parameters.
# Example
```nim
import asyncdispatch, logotypes, json, strutils
let data = waitFor all_logos()
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
