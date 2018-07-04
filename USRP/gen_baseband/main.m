clc;
clear;
close all;
%% basic setting
select_command = [1, 0, 1, 0];
select_target = [0, 0, 0];
select_action = [0, 0, 0];
select_truncate = 0;
query_command = [1, 0, 0, 0];
query_dr = 0;
query_m = [0, 0];
query_trext = 0;
query_target = 0;
query_current_sel = [0, 0];
query_current_session = [0, 0];
query_current_q = [0, 0, 0, 0];
%% read json file
send = [];
query = [query_command,...
        query_dr,...
        query_m,...
        query_trext,...
        query_current_sel,...
        query_current_session,...
        query_target,...
        query_current_q];
send = gen_baseband(query, 1);
%% repeat
times = 1;
to_usrp = [];
for i = 1:1:times
    to_usrp = [to_usrp, send];
end
%power-up
to_usrp = [ones(1,10000),to_usrp];
%%
plot(to_usrp);
axis([1 length(to_usrp) -0.1 1.1]);
write_file(to_usrp);
