%%Baseline corrected files from Jordi Soriano
%%Author: Bisakha Ray
myFolder = 'C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\_Details';
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.dat');
datFiles = dir(filePattern);
H115_z150_dfofOut_corrected = [];
for k = 1:length(datFiles)
  baseFileName = datFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  time_series = csvread(fullFileName,0,3);
  H115_z150_dfofOut_corrected = [H115_z150_dfofOut_corrected time_series];
end
dlmwrite('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\H115_z150_dfofOut_corrected.txt', H115_z150_dfofOut_corrected, ',');
