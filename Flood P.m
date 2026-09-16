
filename = 'flood_data.xlsx';

if isfile(filename)
    try
        data = readtable(filename);
        disp('Successfully loaded input data:');
        disp(data);
    catch ME
        fprintf('Error loading %s: %s\n', filename, ME.message);
        error('Failed to load flood data. Check file format/sheet name.');
    end
else
   
    warning('%s not found in %s. Generating complete sample data instead.', filename, pwd);

    Region = {'Coastal Zone A'; 'River Basin B'; 'Urban District C'; 'Rural Sub-Division D'; 'Valley Sector E'};
    PopulationDensity_x = [38000; 42000; 74000; 58000; 8000];
    EvacuationRoutes_y  = [87; 65; 54; 70; 55];
    RescuedCount        = [15000; 30000; 50000; 43000; 35000];
    EvacuationTime_hrs  = [48; 35; 72; 57; 64];

    data = table(Region, PopulationDensity_x, EvacuationRoutes_y, RescuedCount, EvacuationTime_hrs);

    writetable(data, filename);
    fprintf('Sample file "%s" created in %s\n', filename, pwd);
    disp('Generated input data:');
    disp(data);
end


syms x y


U = (x^2)/y + 3*(x/y);


dU_dx_sym = diff(U, x);


dU_dy_sym = diff(U, y);


fprintf('\nModel Function U(x,y) = %s\n', char(U));
fprintf('dU/dx = %s\n', char(dU_dx_sym));
fprintf('dU/dy = %s\n', char(dU_dy_sym));


dU_dx_func = matlabFunction(dU_dx_sym, 'Vars', [x, y]);
dU_dy_func = matlabFunction(dU_dy_sym, 'Vars', [x, y]);


x_vals = data.PopulationDensity_x;
y_vals = data.EvacuationRoutes_y;


data.dU_dx = dU_dx_func(x_vals, y_vals);
data.dU_dy = dU_dy_func(x_vals, y_vals);


disp(' ');
disp('Calculated Partial Derivative Results:');
disp(data);

writetable(data, 'flood_analysis_output.xlsx');
disp('Successfully exported calculations to flood_analysis_output.xlsx');