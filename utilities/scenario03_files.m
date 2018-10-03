bdclose all

proj = simulinkproject;

rootFolder = proj.RootFolder;
cd(rootFolder);
cd ..

copyfile( sprintf('%s\\99Demofile\\scenario03\\models', pwd),...
    sprintf('%s\\models', rootFolder),'f');

cd(rootFolder);
%   Copyright 2015 The MathWorks, Inc.