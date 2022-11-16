% Q1
% Q1_t();

% % Q2
% Q2_nct(6, 0);
% for df = [3, 6]
%     for mu = [-3, -2, -1, 0]
%         Q2_nct(df, mu);
%     end
% end


% % Q3
% Q3_symmetric_stable(1.6);
for alpha_dist = [1.6, 1.8]
    Q3_symmetric_stable(alpha_dist)
end


% Q4
% Q4_nct(3, -3);
% for df = [3, 6]
%     for mu = [-3, -2, -1, 0]
%         Q4_nct(df, mu);
%     end
% end