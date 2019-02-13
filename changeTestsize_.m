function changeTestsize_(testloc)

Testfolder=fullfile('C:\Users\Abo_Alon\Desktop\New folder (3)'); %Location of the testing image folder.

Testsetofimages=dir(fullfile(Testfolder,'*.jpg')); %Getting the names of all the images inside Testfolder  and save it in Testsetofimages struct-type array

for m=1:size(Testsetofimages,1)                    %looping through the test images

x=imread(fullfile(Testfolder,Testsetofimages(m).name)); %loading the image in the m row of Testsetofimages and save it to dummy variable x

imwrite(imresize(x,[227 227]),fullfile(Testfolder,Testsetofimages(m).name)); %change the the size of the image and write it to the same file that it has been loaded from.

end %end of the foor loop.
