/* N is Root, T1 is Left Subtree, T2 is Right Subtree
Left = Less
Right = More
bt(N, T1, T2) */

% Cuts at bottom of traverse
traverseInorder(empty) :- !.
% Traverses down tree on both sides
traverseInorder(bt(N, Left, Right)) :-
    checkLeftSubtree(N, Left),
    traverseInorder(Left),
    checkRightSubtree(N, Right),
    traverseInorder(Right).

% Base case
checkLeftSubtree(_, empty).
% Check if left node is less than root
checkLeftSubtree(N, bt(LN, _, _)) :-
    LN < N.

% Base case
checkRightSubtree(_, empty).
% Check if right node is right than root
checkRightSubtree(N, bt(RN, _, _)) :-
    RN > N.

% Much of this was taken from prolog notes, slide 27
insert(I, empty, bt(empty, X, empty)).
insert(I, bt(N, L, R), bt(N, L1, R)) :-
    I =< N, 
    insert(I, L, L1).
insert(I, bt(N, L, R), bt(N, L, R1)) :-
    I > N, % This line was added, unsure if necessary
    insert(I, R, R1).

/*
% his version does X, I, T2
% insert I into X resulting in T2
insert(I, bt(N, L, R), T2) :- 
    ( I < L -> func1; % If, call Func1
      I > R -> func2;
      func3). % Else Else, Func3 */

bt(N, LT, RT) :- traverseInorder(bt(N, LT, RT)).