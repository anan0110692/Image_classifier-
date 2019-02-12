function resulting_(resutloc,testloc,netTransfer)
Testimages=imageDatastore(testloc);                            %import the testing data and save it in Testimages.
images_names_struct=dir(fullfile(testloc,'*.jpg'));
for i=1:length(images_names_struct)
    if i==1
        images_names_mat=string(images_names_struct(i).name);
    else
        images_names_mat=[ images_names_mat;string(images_names_struct(i).name)];
    end
end

OUT=classify(netTransfer,Testimages);                        % Classify the test images and put the output inside OUT.
fileID = fopen(fullfile(resutloc,'RESULT.txt'),'w');         %open the txt file in the writing mode
fprintf(fileID,'%s \t %s\r\n',[images_names_mat';string(OUT)']);            % Writing the result to RESULT.txt
