function cufftPlan2d
fftType = cufftType;
I = sqrt(-1);
A = GPUsingle(rand(128,128)+I*rand(128,128));
plan = 0;
% Vectors stored in column major format (FORTRAN)
s = size(A);
[status, plan] = cufftPlan2d(plan, s(2), s(1), fftType.CUFFT_C2C);
cufftCheckStatus(status, 'Error in cufftPlan2D');

[status] = cufftDestroy(plan);
cufftCheckStatus(status, 'Error in cuffDestroyPlan');


end
