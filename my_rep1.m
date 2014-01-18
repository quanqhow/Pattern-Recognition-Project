function a = my_rep1( m )
    
    % Preprocess the digits
    preproc = im_box([],0,1)*im_resize([],[(10) (13)],'bicubic')*im_box([],1,0);
    m = m*preproc;
    pr_m = prdataset(m);
    
    % Perform data scaling
    mapping = scalem(pr_m, 'c-mean');
    scaledPixels = pr_m*mapping;
    
    % Perform PCA
    [mapping, frac] = pcam(scaledPixels, 51);
    
    % Return the dataset after performing PCA
    a = scaledPixels*mapping;
    

end

