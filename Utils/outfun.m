function stop = outfun(x,optimValues,state)
         stop = false;
         global history;
         global stopping;

         switch state
             case 'init'
                 hold on
             case 'iter'
             % Concatenate current point and objective function
             % value with history. x must be a row vector.
               history.fval = [history.fval; optimValues.fval];
               history.x = [history.x; x];
               stopping.fval = optimValues.fval;
               stopping.x = x;

             case 'done'
                 hold off
             otherwise
         end