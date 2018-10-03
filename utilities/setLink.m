function setLink()

%   Copyright 2015 The MathWorks, Inc.

proj       = simulinkproject;
rootFolder = proj.RootFolder;

strWordPath = sprintf('%s\\requirements\\自動販売機の機能仕様書.docx', rootFolder);

uiopen(strWordPath, 1);
pause(1);

% COM
COM = actxGetRunningServer('Word.Application');
hDoc = COM.ActiveDocument;

strModelRoot = 'VendingMachine';
strModelID    = {'CalcReturn', 'Purchase', 'SumCoinIn'};

open_system(strModelRoot);

cellTarget = { sprintf('%s/VM/%s', strModelRoot, strModelID{1}),...
    sprintf('%s/VM/%s', strModelRoot, strModelID{2}),...
    sprintf('%s/VM/%s', strModelRoot, strModelID{3})};

for idx = 1: numel(cellTarget)
    target = cellTarget{idx};
    
    req = rmi('createempty');
    req.reqsys      = 'other';
    req.doc         = strWordPath;
    req.document    = strWordPath;
    req.keywords    = strModelID{idx};
    
    req.id = ['@', req.keywords];
    if iSearchBookmarks(hDoc, req.keywords)
        rmi('set', target, req)
    end   
end

rmiref.insertRefs(strModelRoot, 'word')

close_system(strModelRoot, true);

for idx = 1: numel(strModelID)
    target = strModelID{idx};
    open_system(target);
    
    req = rmi('createempty');
    req.reqsys      = 'other';
    req.doc         = strWordPath;
    req.document    = strWordPath;
    req.keywords    = strModelID{idx};
    
    req.id = ['@', req.keywords];
    if iSearchBookmarks(hDoc, req.keywords)
        rmi('set', target, req)
    end   
    
    rmiref.insertRefs(target, 'word')
    
    close_system(target, true);
end


COM.Quit;
COM.delete;

%%
    function bFlag = iSearchBookmarks(hDoc, strKey)
        
        if hDoc.Bookmarks.Exists(strKey)
            hDoc.Bookmarks.Item(strKey).Select;
            bFlag = true;
        else
            bFlag = false;
        end
    end

end
