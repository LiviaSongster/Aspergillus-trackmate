outputDir = "G:/Secondary_Metabolites/Iron_copper_MM_motility/february_new_iron_movies/Long/TrackMate/"

title=getTitle();
name = substring(title, 0, lengthOf(title)-4);
run("Split Channels");
//close("C2-"+title);
selectWindow("C2-"+title);
//run("Enhance Contrast", "saturated=0.35");
//resetMinAndMax();
//run("Grays");
//run("Median...", "radius=1 stack");
//run("Subtract Background...", "rolling=50 stack");
//run("Invert LUT");
//selectWindow("C1-"+title);
//run("In [+]");
//run("In [+]");
//run("In [+]");
//selectWindow("C2-"+title);
//selectWindow("C3-"+title);
run("In [+]");
//run("In [+]");
//run("In [+]");
//run("Enhance Contrast", "saturated=0.35");
run("Grays");
run("Median...", "radius=1 stack");
//run("Subtract Background...", "rolling=50 stack");
run("Invert LUT");
//resetMinAndMax();
setMinAndMax(95,400);
waitForUser("Rotate image if needed, then press OK");
//selectWindow("C3-"+title);
selectWindow("C2-"+title);

// save image into results folder
saveAs("Tiff", outputDir+title);


run("Set Measurements...", "mean centroid redirect=None decimal=3");
setTool("polyline");

waitForUser("Trace length of cell, press t to save ROI, then press OK");

selectWindow(title); // selects your movie
roiManager("Select", 0);
profile = getProfile();
for (i=0; i<profile.length; i++)
	setResult("Value", i, profile[i]);
updateResults();
saveAs("Measurements", outputDir+name+"_lineresults.csv");
run("Close"); //close Results
roiManager("Save", outputDir+name+"_line.roi"); // saves the roiset   		
close("ROI Manager");
close("C1-"+title);
close("C2-"+title);
// now run trackmate and save results!

