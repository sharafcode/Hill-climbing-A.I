n= input('Enter the number of nodes >');
A=[];
disp('Enter the matrix elements>>');
for i=1:n
    disp('Row::');
    for j=1:n
        A(i,j)=input('Enter element >');
    end
end
B=triu(A);
disp(B(1,1));
for i=2:n                                         %Change greedy graph to uniform graph.
    for j=2:n
        if i==j
            for m=1:n
                if B(m,j)==1
                    if B(i,j)==0
                        B(i,j)=-1;
                        B(m,j)=B(i,j);
                        B(i,j)=0;
                    else
                        B(m,j)=B(i,j);
                        B(i,j)=0;
                    end
                end
            end
        end
    end
end                                                 %Displaying the graph after changing to a uniform graph
disp(B);
goal=input('Enter the node number of the goal >');
l=0;
while l~=goal
hill = rem(floor(rand(1)*10),n) %Start at random node
if hill==0
    hill=hill+1;
end
climbing=[];
climbing(1)=hill; %Random node of the tree
disp(climbing(1));
for i=hill:n
    min=inf; %Initializing the biggest number of minimum
    for j=1:n
        if (i~=j)&&(B(i,j)~=0)
            if min > B(i,j);
                min=B(i,j);
                l=j;
            end
        end
    end
        disp(l);
    if l==goal;
        break;  %The program halts at this condition
    end
end
end