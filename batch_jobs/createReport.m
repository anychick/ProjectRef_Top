function result = createReport(ModelFile)
%   Copyright 2015 The MathWorks, Inc.

[~,ModelName] = fileparts(ModelFile);
if exist(ModelName,'file')==4
    try
        currentDir = pwd;
        
        proj       = simulinkproject;
        rootFolder = proj.RootFolder;
        
        cd( sprintf('%s\\report', rootFolder) );
        
        import mlreportgen.dom.*;
        doctype = 'docx';
        
        % Create a document.
        doc = Document(ModelName, doctype);
        
        load_system(ModelName);
        
        h = Heading(2, ModelName);
        
        b = Border();
        b.BottomStyle = 'single';
        b.BottomColor = 'LightGray';
        b.BottomWidth = '1pt';
        
        h.Style = [h.Style {Color('DarkOrange'), b}];
        
        append(doc, h);
        
        imgtype = ['-s', ModelName];
        imgname = [ModelName, '.emf'];
        
        % Convert figure to the specified image type.
        print(imgtype, '-dmeta', imgname);
        
        % Set image height and width.
        img = Image(imgname);
        img.Width  = '6.5in';
        img.Height = '4in';
        
        % Append image to document.
        append(doc, Paragraph(img));
        
        delete(img);
    
        append(doc, ExternalLink( sprintf('%s.html', ModelName), 'モデルチェック結果') );
        
        close(doc);
        
        rptview(ModelName, doctype);
        
        cd(currentDir);
        
        result = 'Generate report';
    catch ME
        result = sprintf('Error in generating report: %s',ME.message);
    end
else
    result = 'Not model file';
end

end
