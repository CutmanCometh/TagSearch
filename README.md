# TagSearch
This Objecive C Framework searches for files by tag.

Since Mavericks (10.9) OS X has offered users the ability to tag files and directories with arbitrary strings using Finder.
Then, you can search for files/folders by tag.

But, what if you, the developer, need to search for files by tag programatically. I can't find anywhere in the API that allows this search programatically. So, I built one myself.

At present, it seems to be pretty inneficient. It takes a couple minutes to search a directory (and all subdirectories) that contain ~ 80,000 items, where it takes the OS less than a second to perform the same search (although, the OS is probably doing some sort of caching).

It's functionality is pretty basic so far: specify a starting directory and a string, and it searches all files and folders inside the starting directory (but not including the directory), then returns an NSArray of the files and folders that are tagged with the string.

On the todo list are the following additions:
-Case-insensitive search (currently all searches are case-sensitive)
-Boolean searching. For example, 1) give my all files that are tagged both "2013" and "Disneyland" or 2) give me files that are tagged with either "bicycle" or "bike".
-Specify to return only files or only folders. Currently, you get EVERYTHING. So if a folder is tagged "favorite" and some (or all) of the files it contains are also tagged "favorite", and the search algorithm runs across the folder looking for "favorite", the search results NSArray will contain the folder AND each item inside it that is tagged.

Please feel free to fork it and add funtionality and/or optimize it for performance.
