function adjustsize(testloc)
BigFolder=testloc;    %Location of the training image folder.
namesoffolder=dir(BigFolder);                   %getting the names of all subfolders inside BigFolder and save it in namesoffolder.
namesoffolder=namesoffolder(3:size(namesoffolder,1));  % omit the first three results from output of dir function ,because they are not subfolders.
%------------------------------------------------------------------------------------------------------------------------------------------------------------------------
for k=1:length(namesoffolder)                                                   % for loop to loop through each subfolder.
    currentfolder=fullfile(BigFolder,namesoffolder(k).name); %getting the name of the k- subfolder
    setofimages=dir(fullfile(currentfolder,'*.jpg'));        % getting the names of all the images inside k subfolder and save it in  setofimages struct-type array
    for m=1:size(setofimages,1)                              % for loop to loop through all the images inside k-subfolder
        x=imread(fullfile(currentfolder,setofimages(m).name)); % Read the image in the m row in the setofimages  matrix and save it to dummy variable x.
%        x=cat(3,x,x,x);                                       %Represent the the gray scale as RGB image with 3 same layers.
   imwrite(imresize(x,[227 227]),fullfile(currentfolder,setofimages(m).name)); % change the the size of the image and write it to the same file that it has been loaded from.
    end                                                       % end of inner foor loop.
end               