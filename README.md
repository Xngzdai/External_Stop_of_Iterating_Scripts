# External_Stop_of_Iterating_Scripts

# Objective: 
A user can, by his or her decision, stop and jump out iterations in a running program and more importantly, can execute the following codes. 

Inspiration:
When using Computer Vision ToolBox, video frames go through a loop that iterates as many times as the total number of frames in the video file. With some add-on algorithms and processing on the frame, such a loop can be slow and it is possible to take an unexpectedly long time to iterate throughout the loop. Therefore, sometimes there is a demand that "the video that has been processed is so-far-so-good and I don't really need to complete the iteration necessarily."
Though usually it is acceptable, the method of hitting the 'Stop' button to terminate the script fails to execute the following codes after the loop. In our case, where a video output is expected, the output video file is saved by closing an video file writer object at the end of the program. Failure to execute object closing will results in the corruption of the file without exceptions.
Therefore, the script in this page provides a solution, or generally speaking a clue, to this problem. Since the function sounds simple, we don't want to burden programmers to install any packages or functions only for one or two functions. And the application is extended to all kinds of iterating program, not only video related.

# Discussion: 
Default implementations in MATLAB are very limited in stopping an ongoing program from an external source. 
Internal function stops includes: 'break', 'pause', etc. doesn't help with our goal, that the decision of stopping the execution is subjective. 
'isOpen' condition is only applicable to a pcplayer, or vision.DeployableVideoPlayer object, not a general process.
'input' and 'keyboard' prompt for an input in every iteration so they are inefficient.
'waitforbottonpress' prompts for an input in every iteration. Although this problem can be circumvented by verifying the existence of the return variable, 'waitforbottonpress' pops out a figure window no matter if you want it or not. Also, the excited input is clicking and any keyboard press so it is too sensitive.
'uicontrol' and other ui related function are not applicable if we don't need a ui.
Walter Roberson recommended PsychToolbox. Though this is a powerful toolbox, we just need one function from the entire toolbox.

# Q&A:
Q: Why not parallel threads? 
A: Possible, but might be an overkill. Sometimes your program doesn't really need multithreads and it will increase your workload and possibility of things going wrong :-)
Q: Why not using multiple scripts or functions? Instead, you read a txt file.
A: When the program starts to run, the code are read into the memory and any changes after that will be ignored during the running time. However, a text file is available to be edited at any time.
Q: Can I make contribution if I have a creative solution, or if I find that your code accidentally replicates some past work?
A: Yes! Feel free to contribute new solutions to the Community. And learning from criticisms is one of my most favorable way to improve myself so don't be too reserved if you find anything wrong with my solution.

# Related Questions:
https://www.mathworks.com/matlabcentral/answers/265361-how-to-stop-further-execution-of-m-script-by-using-command

# Cite As
Xingze Dai (2022). Externally Stopping an Ongoing Iterating Scripting (https://github.com/Xngzdai/External_Stop_of_Iterating_Scripts/releases/tag/v1.0.3), GitHub. Retrieved February 5, 2022.

https://www.mathworks.com/matlabcentral/answers/143088-real-time-detect-keypress#answer_285124

https://www.mathworks.com/matlabcentral/answers/2081-how-to-execute-two-matlab-scripts-simultaneously
