function cmp=deeppurple(vargin);
  
  if nargin<1
    len=length(colormap);
  else
    len=vargin(1);
  end;
  
old=[1	1	1
0.83926	0.85262	0.921
0.7747	0.84057	0.92708
0.71014	0.82852	0.93315
0.64558	0.81648	0.93923
0.58103	0.80443	0.94531
0.51647	0.79238	0.95138
0.45191	0.78034	0.95746
0.38735	0.76829	0.96354
0.32279	0.75624	0.96962
0.25823	0.7442	0.97569
0.19368	0.73215	0.98177
0.12912	0.7201	0.98785
0.064558	0.70806	0.99392
0	0.69601	1
0	0.67254	0.99929
0	0.64906	0.99857
0	0.62559	0.99786
0	0.60211	0.99715
0	0.57864	0.99644
0	0.55517	0.99572
0	0.53169	0.99501
0	0.50822	0.9943
0	0.48474	0.99358
0	0.46127	0.99287
0	0.43779	0.99216
0	0.41432	0.99145
0	0.39085	0.99073
0	0.36737	0.99002
0	0.3439	0.98931
0	0.32042	0.98859
0	0.29695	0.98788
0	0.27348	0.98717
0	0.25	0.98645
0	0.22653	0.98574
0	0.20305	0.98503
0	0.17958	0.98432
0.0088919	0.16836	0.96667
0.017784	0.15713	0.94903
0.026676	0.14591	0.93138
0.035567	0.13468	0.91374
0.044459	0.12346	0.89609
0.053351	0.11224	0.87845
0.062243	0.10101	0.8608
0.071135	0.08979	0.84316
0.080027	0.078566	0.82551
0.088919	0.067342	0.80787
0.09781	0.056119	0.79022
0.1067	0.044895	0.77258
0.11559	0.033671	0.75493
0.12449	0.022447	0.73729
0.13338	0.011224	0.71964
0.14227	0	0.702
0.156	0	0.66557
0.16974	0	0.62914
0.18347	0	0.59271
0.1972	0	0.55629
0.21093	0	0.51986
0.22467	0	0.48343
0.2384	0	0.447
0.21718	0	0.412
0.19595	0	0.377
0.17472	0	0.342
0.1535	0	0.307];
  
  
  xold=(1:size(old,1))./size(old,1);
dx = 1/(size(old,1)-1);
xold=0:dx:1;
dx = 1/(len-1);
xnew = 0:dx:1;
cmp=interp1(xold,old,xnew);