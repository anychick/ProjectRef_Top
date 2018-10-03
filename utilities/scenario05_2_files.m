bdclose all

proj = simulinkproject;

rootFolder = proj.RootFolder;
cd(rootFolder);
cd ..

copyfile( sprintf('%s\\99Demofile\\scenario05_2\\data', pwd),...
    sprintf('%s\\data', rootFolder),'f');

cd(rootFolder);
%   Copyright 2015 The MathWorks, Inc.