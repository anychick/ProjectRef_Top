function removeLink()
%   Copyright 2015 The MathWorks, Inc.

proj       = simulinkproject;
rootFolder = proj.RootFolder;

strWordPath = sprintf('%s\\requirements\\自動販売機の機能仕様書.docx', rootFolder);

uiopen(strWordPath, 1);
pause(1);

strModelRoot = 'VendingMachine';
strModelID    = {'CalcReturn', 'Purchase', 'SumCoinIn'};

open_system(strModelRoot);

cellTarget = { sprintf('%s/VM/%s', strModelRoot, strModelID{1}),...
    sprintf('%s/VM/%s', strModelRoot, strModelID{2}),...
    sprintf('%s/VM/%s', strModelRoot, strModelID{3})};

for idx = 1: numel(cellTarget)
    target = cellTarget{idx};
    rmi('clearAll', target, 'deep', 'noprompt');
end

rmiref.removeRefs('word');

close_system(strModelRoot, true);

for idx = 1: numel(strModelID)
    target = strModelID{idx};
    open_system(target);
   
    rmiref.removeRefs('word');
    
    close_system(target, true);
end

end