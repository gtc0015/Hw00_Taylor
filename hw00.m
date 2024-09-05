% Author: Taylor Crenshaw / crenshawgt@gmail.com
% Date: 2024-09-01
% Assignment Name: hw00

% The following class defines 3 functions for each problem respectively.
% Please follow the instruction inside each function. 
classdef hw00
  methods (Static)
    function am = untitled(n)
            % Check if the input m is valid
        if n < 0
            error('The term index m must be a non-negative integer.');
            % Handle base cases
        elseif n == 0
               am = 0;
        elseif n == 1
               am = 1;
        elseif n == 2
               am = 1;
 
               % Compute the terms of the sequence from a_3 to a_m
        else
               am = untitled(n-1) + untitled(n-2) + untitled(n-3);
        end
    end

      function detA = laplaceDeterminant(A)
           % Compute the determinant of matrix A using Laplace expansion
           % A = [1 2 3; 4 5 6; 7 8 9];
           [n, m] = size(A);
    
          if n ~= m
            error('Matrix must be square.');
          elseif n == 1
            % Base case: 1x1 matrix
            detA = A(1,1);
          elseif n == 2
            % Base case: 2x2 matrix
            detA = A(1,1)*A(2,2) - A(1,2)*A(2,1);
          else
            % Recursive case: n x n matrix
            detA = 0;
          end

          for j = 1:n
            % Compute the minor matrix by excluding the first row and j-th column
            smallMatrix = A(2:end, [1:j-1, j+1:end]);
            
            % Compute the cofactor
            cofactor = (-1)^(1+j) * A(1,j) * laplaceDeterminant(smallMatrix);
            
            % Add the cofactor to the determinant
            detA = detA + cofactor;

          end
      end

        function pauseForABit()
            tic;
            duration = 1.0;
            while toc < duration
            end

            elapsedTime = toc;
            fprintf('Elapsed time given by function %.2f seconds. \n', elapsedTime);
            % This function should have a run time about 1 second.
            % :return: no returns

            % Write your code here
        end
  end
end
