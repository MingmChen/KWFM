function  [E_Img]  =  Patch2Im( ImPat, WPat, PatSize, ImageH, ImageW, Depth )
    TempR        =   ImageH-PatSize+1;
    TempC        =   ImageW-PatSize+1;
    TempOffsetR  =   [1:TempR];
    TempOffsetC  =   [1:TempC];    

    E_Img  	=  zeros(ImageH,ImageW, Depth);
    W_Img 	=  zeros(ImageH,ImageW, Depth);
    k        =   0;
    for i  = 1:PatSize
        for j  = 1:PatSize
            k    =  k+1;
            E_Img(TempOffsetR-1+i,TempOffsetC-1+j,:)  =  E_Img(TempOffsetR-1+i,TempOffsetC-1+j,:) + reshape( squeeze(ImPat(k,:,:)), [TempR, TempC, Depth]);
            W_Img(TempOffsetR-1+i,TempOffsetC-1+j,:)  =  W_Img(TempOffsetR-1+i,TempOffsetC-1+j,:) + reshape( squeeze(WPat(k,:,:)),  [TempR, TempC, Depth]);
        end
    end
     E_Img  =  E_Img./(W_Img+eps);

