# Image-staganography using bit plane slicing
Staganography refers to the practice of concealing a file, message, image, or video within another file, message, image, or video. Here I have used a text file content to embed in an image without the image being distorted. 
The algo outkine is mentioned below:
We know that an RGB image has three planes(Red, Green and Blue) each again having 8 bit planes. And each chracter when converted to ASCII and then to binary, occupies 7 bits. So this 7 bits can be embedded in 7 bit planes of the image, corresponding to each pixel of a plane(R or G or B). The 8th bit plane of the image is kept intact because it contains the highest details. 
1. Seperate the three planes of the RGB image
1. Perform bit plane slicing on any plane.
2. Go through every pixel in the 1st plane and perform xor operation between the pixel value and the 1st bit of the 1st character of the text.
3. Keep on performing the same operation till all the characters in the text are embedded in the plane.
4. Then join all the planes to reconstruct the image again.

Calculations:
A 512 x 512 image will contain 3 planes, each plane having 262144 pixels. 
Since each pixel can embed 1 character, so 1 plane can embed 262144 characters.
So 3 planes can embed 3 X 262144 = 786432 chracters.

