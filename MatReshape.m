function y = MatReshape(x)
% x��һ����ά����ת��Ϊ��ά����
ndim = size(x);
y = reshape(x,ndim(1),ndim(2)*ndim(3));
