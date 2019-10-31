
%% �������ڵ�����ֲ���[-4000m, 4000m]��[-4000m, 4000m]�ľ��������ڣ��ڵ��ͨ�Ű뾶����Ϊ$R=1600$;
function [E,posSensor,SenNode] = getConnectivitySparse(Nc)
    
    % ����ͨ������
    while 1

        % ÿ�����������ɽڵ�λ�ã�������ѭ�����棬������Ҫ����������ڽڵ�λ��û�з����ı䣬
        % ��Զ������Ҫ�󣬴Ӷ����ѭ�������ѭ�����޷��õ���Ҫ�Ľ����
        E = zeros(Nc);
        posSensor = -4000 + 8000 * rand(2,Nc);

        for i = 1:Nc-1
            for j = i+1:Nc
                d = norm(posSensor(:,j) - posSensor(:,i));
                if  d < 3400
                    E(i,j) = 1;
                end
            end
        end
        E = E + E';

        if any(sum(E) == 0) % ������ڶ����ڵ㣬�����粻��ͨ���������������磻
            continue;
        else
            break;
        end
    end

    % ��ʾ�������ڵ㼰�˴�֮���ͨ�Ź�ϵ��
    SenNode = randperm(Nc,4); % ���ѡ��10���ڵ���Ϊ��֪�ڵ㣻
%     posSenNode = posSensor(:,SenNode); % ��֪�ڵ��λ�ã�
%     
%     posComNode = posSensor;
%     posComNode(:,SenNode) = [];  % ȥ����֪�ڵ��λ��,ʣ��ͨ�Žڵ��λ�ã�
%     
%     
%     figure
%     hold on;    
%     for i = 1:Nc-1
%         for j = i+1:Nc
%             if E(i,j)
%                 plot(posSensor(1,[i,j]),posSensor(2,[i,j]),'b-');
%             end
%         end
%     end
%     
%     plot(posSenNode(1,:),posSenNode(2,:),'^','MarkerFaceColor',[1,0,0],'MarkerEdgeColor',[0,0,0]);
%     plot(posComNode(1,:),posComNode(2,:),'sk');
end



