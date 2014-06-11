Adam_Packers_Data
=================
% ImagesFolder=uigetdir;
ImagesFolder = 'C:/Users/Bisakha Ray/Desktop/Connectomics_Data/20130303_H92_Tseries-001/20130303_H92_Tseries-001';
jpegFiles = dir(strcat(ImagesFolder,'/*.tif'));
fps= 10; 
S = [jpegFiles(:).datenum]; 
[~,S] = sort(S);
jpegFilesS = jpegFiles(S);

VideoFile=strcat(ImagesFolder,'/jointVideo');
writerObj = VideoWriter(VideoFile);
writerObj.FrameRate = fps;
open(writerObj);
% First pass to find the maximum - the bit rate is not enough
maxval = 0;
for t= 1:length(jpegFilesS)
    [Frame, ~] = imread(strcat(ImagesFolder,'/',jpegFilesS (t).name));
    maxval = max([Frame(:); maxval]);
end

for t= 1:length(jpegFilesS)
    [Frame, ~] = imread(strcat(ImagesFolder,'/',jpegFilesS (t).name));
    writeVideo(writerObj,double (Frame)/double(maxval));
end
close(writerObj);

