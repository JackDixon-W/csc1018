/*
AVL Tree Implementation in Prolog
Author: Jack Dixon
Date: 13-04-2025
Description: This code implements an AVL tree in Prolog
It includes functions for inserting nodes, checking balance, restoring balance through rotations, and displaying the tree.
*/

% ===== Tree Validation =====
% Wrapper function to call the traversal function
bt(N, LT, RT) :- traverseInorder(avl(N, LT, RT)).

% Cuts at bottom of traverse
traverseInorder(empty) :- !.
% Traverses down tree on both sides
traverseInorder(avl(N, Left, Right)) :-
    checkLeftSubtree(N, Left),
    height(Left, DL),
    traverseInorder(Left),
    checkRightSubtree(N, Right),
    height(Right, DR),
    traverseInorder(Right),
    abs(DL - DR) =< 1.

checkLeftSubtree(_, empty).
% Check if left node is less than root
checkLeftSubtree(N, avl(LN, _, _)) :-
    LN < N.

checkRightSubtree(_, empty).
% Check if right node is right than root
checkRightSubtree(N, avl(RN, _, _)) :-
    RN > N.

% ===== INSERT ===== %
/* 
Building blocks of this was taken from slide #27
Before being built upon to include balancing functions
*/
insert(I, empty, avl(I, empty, empty)).

/* 
Both functions work by inserting the new node into the left or right subtree
Then calling the balance function to check if the tree is balanced
*/
insert(I, avl(N, L, R), OutputTree) :-
    I =< N, !,
    insert(I, L, NewLeft),
    TmpTree = avl(N, NewLeft, R),
    (balanceCheck(TmpTree) ->
        % If tree is balanced, return it
        OutputTree = TmpTree
    ;
        % If tree is unbalanced, balance it
        balanceFunc(TmpTree, OutputTree)
    ).

insert(I, avl(N, L, R), OutputTree) :-
    I > N, !,
    insert(I, R, NewRight),
    TmpTree = avl(N, L, NewRight),
    (balanceCheck(TmpTree) ->
        % If tree is balanced, return it
        OutputTree = TmpTree
    ;
        % If tree is unbalanced, balance it
        balanceFunc(TmpTree, OutputTree)
    ).

% ====== Height ===== %
height(empty, 0).
height(avl( _, L, R), H) :-
  height(L,HL),
  height(R,HR),
  H is 1 + max(HL,HR).

% ====== Balance ===== %
% Util function to check if the tree is balanced
balanceCheck(avl(_, L, R)) :-
    height(L, DL),
    height(R, DR),
    abs(DL - DR) =< 1.

% Util function to return balance
balanceReturn(avl(N, L, R), B) :-
    height(L, DL),
    height(R, DR),
    B is DL - DR.

% Perform the balancing
balanceFunc(avl(N, L, R), BalancedTree) :-
    balanceReturn(avl(N, L, R), B),
    (B > 1 ->
        % If Left-heavy, check left subtree
        balanceReturn(L, LB),
        (LB >= 0 -> 
            rotateRight(avl(N, L, R), BalancedTree)
        ;   
            rotateLeftRight(avl(N, L, R), BalancedTree)
        )
    ;B < -1 ->
        % If Right-heavy, check right subtree
        balanceReturn(R, RB),
        (RB =< 0 -> 
            rotateLeft(avl(N, L, R), BalancedTree)
        ;   
            rotateRightLeft(avl(N, L, R), BalancedTree)
        )
        % Already balanced
    ;BalancedTree = avl(N, L, R) 
    ).

% ====== Rotations ===== %
% Used for right-right rotation
rotateLeft(avl(X, L, avl(Y, RL, RR)), 
            avl(Y, avl(X, L, RL), RR)).

% Used for left-left rotation
rotateRight(avl(Y, avl(X, LL, LR), R), 
            avl(X, LL, avl(Y, LR, R))).

% Used for left-right rotation
rotateLeftRight(avl(Z, avl(X, L, avl(Y, RL, RR)), R), OutputTree) :-
    rotateLeft(avl(X, L, avl(Y, RL, RR)), TmpTree),
    rotateRight(avl(Z, TmpTree, R), OutputTree).

% Used for right-left rotation
rotateRightLeft(avl(Z, L, avl(X, avl(Y, LL, LR), R)), OutputTree) :-
    rotateRight(avl(X, avl(Y, LL, LR), R), TmpTree),
    rotateLeft(avl(Z, L, TmpTree), OutputTree).

% ====== Display ===== %
/*
Source: 'https://users.utcluj.ro/%7Ecameliav/lp/lab8.pdf'
*/

/*
This is where I encountered issues with the display function
When importing display/1, it was overwritten by the system predicate of the same name
To resolve this, I had to rename the display function to displayTree/1
*/
%display(Tree) :- displayTree(Tree).

% Starter func to call /2 function
displayTree(empty) :- !.
displayTree(avl(N, L, R)) :-
    displayTree(avl(N, L, R), 0).

displayTree(empty, _).
displayTree(avl(N,L,R), D):-
    D1 is D+1, 
    displayTree(L, D1), 
    formatNode(N, D),
    displayTree(R, D1).

% Prints node at depth D and indents based on depth
formatNode(N, D):-
    D>0, !, 
    D1 is D-1, 
    write('\t'), 
    formatNode(N, D1).
formatNode(N, _):-
    write(N), nl.
