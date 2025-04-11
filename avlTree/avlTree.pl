/*
AVL Tree Implementation in Prolog
Author: Jack Dixon
Date: 13-04-2025
Description: This Prolog code implements an AVL tree, which is a self-balancing binary search tree. The code includes functions for inserting elements, checking the balance of the tree, and calculating the height of the tree.
*/

% ===== Tree Validation =====
% Cuts at bottom of traverse
traverseInorder(empty) :- !.
% Traverses down tree on both sides
traverseInorder(bt(N, Left, Right)) :-
    checkLeftSubtree(N, Left),
    height(Left, DL),
    traverseInorder(Left),
    checkRightSubtree(N, Right),
    height(Right, DR),
    traverseInorder(Right),
    abs(DL - DR) =< 1.

checkLeftSubtree(_, empty).
% Check if left node is less than root
checkLeftSubtree(N, bt(LN, _, _)) :-
    LN < N.

checkRightSubtree(_, empty).
% Check if right node is right than root
checkRightSubtree(N, bt(RN, _, _)) :-
    RN > N.

% ===== INSERT ===== %
/* 
Building blocks of this was taken from slide #27
Before being built upon to include balancing functions
*/
insert(I, empty, bt(I, empty, empty)).

/* 
Both functions work by inserting the new node into the left or right subtree
Then calling the balance function to check if the tree is balanced
*/
insert(I, bt(N, L, R), OutputTree) :-
    I =< N,
    insert(I, L, NewLeft),
    TmpTree = bt(N, NewLeft, R),
    balanceFunc(TmpTree, OutputTree).

insert(I, bt(N, L, R), OutputTree) :-
    I > N,
    insert(I, R, NewRight),
    TmpTree = bt(N, L, NewRight),
    balanceFunc(TmpTree, OutputTree).

% ====== Height ===== %
height(empty, 0 ).
height(bt( _, L, R), D) :-
  height(L,L1),
  height(R,R1),
  D is 1 + max(L1,R1).

% ====== Balance ===== %
% Util function to check balance
balanceCheck(bt(N, L, R), B) :-
    height(L, DL),
    height(R, DR),
    B is DL - DR.

% Perform the balancing
balanceFunc(bt(N, L, R), BalancedTree) :-
    balanceCheck(bt(N, L, R), B),
    (   B > 1 ->
        % If Left-heavy, check left subtree
        balanceCheck(L, LB),
        (   LB >= 0 -> rotateRight(bt(N, L, R), BalancedTree)
        ;   rotateLeftRight(bt(N, L, R), BalancedTree)
        )
    ;   B < -1 ->
        % If Right-heavy, check right subtree
        balanceCheck(R, RB),
        (   RB =< 0 -> rotateLeft(bt(N, L, R), BalancedTree)
        ;   rotateRightLeft(bt(N, L, R), BalancedTree)
        )
    ;   BalancedTree = bt(N, L, R)  % Already balanced
    ).

% ====== Rotations ===== %
rotateLeft(bt(X, L, bt(Y, RL, RR)), bt(Y, bt(X, L, RL), RR)).

rotateRight(bt(Y, bt(X, LL, LR), R), bt(X, LL, bt(Y, LR, R))).

rotateLeftRight(bt(Z, bt(X, L, bt(Y, RL, RR)), R), OutputTree) :-
    rotateLeft(bt(X, L, bt(Y, RL, RR)), TmpTree),
    rotateRight(bt(Z, TmpTree, R), OutputTree).

rotateRightLeft(bt(Z, L, bt(X, bt(Y, LL, LR), R)), OutputTree) :-
    rotateRight(bt(X, bt(Y, LL, LR), R), TmpTree),
    rotateLeft(bt(Z, L, TmpTree), OutputTree).

% ====== Main ===== %
bt(N, LT, RT) :- traverseInorder(bt(N, LT, RT)).