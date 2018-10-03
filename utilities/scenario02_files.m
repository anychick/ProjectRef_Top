bdclose all

proj = simulinkproject;

rootFolder = proj.RootFolder;
cd(rootFolder);
cd ..

copyfile( sprintf('%s\\99Demofile\\scenario02\\models', pwd),...
    sprintf('%s\\models', rootFolder),'f');
copyfile( sprintf('%s\\99Demofile\\scenario02\\requirements', pwd),...
    sprintf('%s\\requirements', rootFolder),'f');
copyfile( sprintf('%s\\99Demofile\\scenario02\\data', pwd),...
    sprintf('%s\\data', rootFolder),'f');

cd(rootFolder);
%   Copyright 2015 The MathWorks, Inc.