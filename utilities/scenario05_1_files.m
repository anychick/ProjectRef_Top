bdclose all

proj = simulinkproject;

rootFolder = proj.RootFolder;
cd(rootFolder);
cd ..

copyfile( sprintf('%s\\99Demofile\\scenario05_1\\models', pwd),...
    sprintf('%s\\models', rootFolder),'f');
copyfile( sprintf('%s\\99Demofile\\scenario05_1\\batch_jobs', pwd),...
    sprintf('%s\\batch_jobs', rootFolder),'f');


cd(rootFolder);
%   Copyright 2015 The MathWorks, Inc.