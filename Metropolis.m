% Metropolis Ȩ��
function W = Metropolis(E)

% ���룺������ڽӾ���
% ����� MetropolisȨ�ؾ���

Ns = size(E,1); % ����������
W = zeros(Ns);
d = sum(E,2);   % �ڵ��

for i = 1:Ns
    for j = 1:Ns
        if E(i,j)
            W(i,j) = 1/(1 + max(d([i,j])));
        end
    end
    W(i,i) = 1 - sum(W(i,:));
end
