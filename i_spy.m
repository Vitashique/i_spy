function [r,c] = i_spy ( object_im, big_im, x )

%keys = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Annual'};

%values = {327.2, 368.2, 197.6, 178.4, 100.0,  69.9, 32.3,  37.3,  19.0,  37.0,  73.2, 110.9, 1551.0};

%rainfallMap = containers.Map(keys, values);

% bIm=imread('data/set1_big_im.png');
% imshow(bIm);

%smIm=imread('data/set1_object_im_1.png');

%disp(rainfallMap('hi'));
%disp(rainfallMap('Feb'));


%myCrazyThang = 'Section';
%i = 1;

%varThang = b_im(r,c+2)

%while (i <= 50)

   %newThang = strcat(myCrazyThang, num2str(i));
   %i = i + 1;
%end

bigImg=big_im;
% bigImg2=imread('data/set2_big_im.png');
% bigImg3=imread('data/set3_big_im.png');


% disp('Choose the big image you're using');
% [FileName, PathName]=uigetfile;
% userImg=fullfile(PathName, FileName);
% bigImg=imread(userImg);

% imshow(bigImg);

smImg=object_im;

% disp('Please select your small image');
% [FileName, PathName]=uigetfile;
% userImg=fullfile(PathName, FileName);
% smImg=imread(userImg);

%imshow(smImg);

c = normxcorr2(smImg(:,:,1),bigImg(:,:,1));
[cPeak, iPeak] = max(abs(c(:))); %this is the peak in the cross-correlation
[y, x] = ind2sub(size(c),iPeak(1)); %ind2sub shows the position. Store positions
corr = [abs(gather(x-size(smImg,2))) abs(gather(y-size(smImg,1)))];
r= corr(2);
c= corr(1);
