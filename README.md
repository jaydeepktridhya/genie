# genie

The Standalone Keyboard code are in Native Platforms.
Kindly run the command given in terminal so support the local db files
Command : flutter packages pub run build_runner build


To Fix Run custom shell script '[CP] Embed Pods Frameworks' Error
Open project in Xcode. Go to Pods -> Target Support Files -> Pods-App-Frameworks and change line 44 to below (basically adding -f in existing code):

source="$(readlink -f "${source}")"
