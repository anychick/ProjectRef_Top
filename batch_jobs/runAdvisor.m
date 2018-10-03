function result = runAdvisor(ModelFile)
%newBatchJob - A Simulink Project batch job function.
%
% To create your own batch job 
%  1) Edit this function to perform the desired action on each file.
%  2) Save this file on to your MATLAB path.
%
% Input arguments:
%  file - string - The absolute path to a file included in the batch job.
%  When you run the batch job, the Simulink Project Tool provides the file 
%  input for each selected file. 
%
% Output arguments:
%  result - user-specified type - The result output argument of your batch function.
%  The Simulink Project Tool displays the result in the Batch Job Results column.


[~,ModelName] = fileparts(ModelFile);
if exist(ModelName,'file')==4
    try
        proj       = simulinkproject;
        rootFolder = proj.RootFolder;

        load_system(ModelName);
        
        SysResultObjArray = ModelAdvisor.run(ModelName, 'Configuration', 'phase1.mat', 'Force', 'On');
        %         viewReport(SysResultObjArray{1});
        
        ma = Simulink.ModelAdvisor.getModelAdvisor(ModelName);
        if ma.reportExists(ModelName)
            ma.exportReport( sprintf('%s\\report', rootFolder) );
            movefile( sprintf('%s\\report\\report.html', rootFolder),...
                sprintf('%s\\report\\%s.html', rootFolder, ModelName));
        end
        ma.closeReport;
        
        close_system(ModelName);
        result = 'Run Advisor';
    catch ME
        result = sprintf('Error in Advisor: %s',ME.message);
    end
else
    result = 'Not model file';
end

end



