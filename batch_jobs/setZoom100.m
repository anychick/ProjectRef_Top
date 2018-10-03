function result = setZoom100(ModelFile)
% Copyright 2015 The MathWorks, Inc.

[~,ModelName] = fileparts(ModelFile);
if exist(ModelName,'file')==4
    try
        open_system(ModelName);
        
        set_param(ModelName, 'ZoomFactor', '100');
       
        save_system(ModelName);
        close_system(ModelName);
        
        result = 'Zoom 100%';
    catch ME
        result = sprintf('Error in setting Zoom: %s',ME.message);
    end
else
    result = 'Not model file';
end

end
