function dist=euc_dist(a,b,X_mean, U,L,n)

    proj_a=W(a,X_mean,U,L,n);
    proj_b=W(b,X_mean,U,L,n);
    dist=sqrt(sum((proj_a-proj_b).^2));

end