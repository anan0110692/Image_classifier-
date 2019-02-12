# Image_classifier-CNN
This code is able to implement an image classifier using the concept of the transfer learning.In transfer learning we extract and transfer a number of layers form a pre-trained convolutional neural network called AlexNet-which has been trained on enormous amount of data. Then, we combine these transferred layers with new classifier ,that is related to user problem.
## Requierments:
1. MATLAB (2017 or newer).
2. Deep learning toolbox.
3. Alexnet CNN. 
## How to run the code:
1. Clone this repo and make it MATLAB current dir.

2. Prepare the training set of images by dowing the following:
   
   1. Put each catagory of images in subfolder , and name this subfolder with catagory name.For example I have a set of car images, then I have to put it in subfolder and call it "car".
   
   2. Put all subfolders in big folder which will be used in the following steps.

3. Prepare the testing set by simply putting all the testing images in one folder.(NO SUBFOLDER NEEDED ).

4. Call the function "Train_(TrainingDataLoc,TestingDataLoc,Outloc").The describition of these arguments are givn as follows:
   
   - TrainingDataLoc: is folder location of the training set.Ex:'C:\Users\anan\Desktop\trainingFolder'.
   
   - TestingDataLoc:  is folder location of the testing set.Ex:'C:\Users\anan\Desktop\testingFolder'.
   
   - Outloc: is folder location of the output txt file.Ex:'C:\Users\anan\Desktop\outFolder'.
   
   ## References :
   https://uk.mathworks.com/help/nnet/examples/transfer-learning-using-alexnet.html
   
