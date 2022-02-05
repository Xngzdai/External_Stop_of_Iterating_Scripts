% ======================================================================= %
% Solution (or Inspiration) of Externally Stopping an Iterating Script
% ----------------------------------------------------------------------- %
%  Programer: Xingze Dai
%     E-mail: xngzdai@umich.edu
% ======================================================================= %


% ======================================================================= %
% Initialization
%
% The n-th ongoing iteration  
counter = 0;
% The final iteration number
end_time = 1000;
% Condition of quitting an iteration
nonstop_condition = true;
% Your loop condition based on your own program design
your_loop_condition = true;


% ======================================================================= %
% ------x------ Code Block 1 (Your other codes go here.) -------x-------- %
% ======================================================================= %


% ======================================================================= %
% Iterations
%
while your_loop_condition && nonstop_condition
    % =================================================================== %
    % -----x------ Code Block 2 (Your other codes go here.) -----x------- %
    % =================================================================== %

    [counter, nonstop_condition] = toStop(counter,check_point,end_time);

    % =================================================================== %
    % -----x------ Code Block 3 (Your other codes go here.) -----x------- %
    % =================================================================== %
end

% ======================================================================= %
% ------x------ Code Block 4 (Your other codes go here.) -------x-------- %
% ======================================================================= %


% ======================================================================= %
% Realization of the external stop
%
function [new_num, cond] = toStop(num,freq,limiter)
%   TOSTOP [new_num, cond] = toStop(num,freq,limiter)
%   Summary:
%   Interrupt the iteration by reading and evaluating a stopping condition
%   from an external file.
%   Parameter:
%   <int> num: the num-th iteration of the program.
%   <int> freq: the frequency of condition check, i.e. how fast should the
%   iteration condition to be checked. Minimum is 1.
%   <int> limiter: the maximum times of iteration that will pop out.
%   (Optional)
%   Return:
%   <int> new_num: the next iteration that will be executed afterwards.
%   <boolean> cond: the stopping condition.
%
    % Iteration progression
    new_num = num + 1;
    cond = true;
    
    % Checkpoint 1: 
    % Whether the program reaches its preset maximum times of iteration.
    if nargin == 3
        if new_num > limiter
            cond = false;
            return
        end
    end

    % Checkpoint 2:
    % Whether the program meets the user-input maximum times of iteration.
    if rem(new_num,freq) == 0
        cond = logical(importdata("stop_sign.txt"));
        return
    end
end