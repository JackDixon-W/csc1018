/*
Tests built by AI using the following github repository as a template:
https://github.com/DuarteMartinho/CA208/blob/master/assignment/tests.pl
*/

:- consult('avlTree.pl').

% ===== Member Tests =====
% Check if the AVL tree is valid 
member_test_1 :- bt(avl(10, avl(5, avl(2, empty, empty), avl(7, empty, empty)), avl(15, empty, empty))).
member_test_2 :- bt(avl(20, avl(10, avl(5, empty, empty), avl(15, empty, empty)), avl(30, avl(25, empty, empty), avl(35, empty, empty)))).
member_test_3 :- bt(avl(50, avl(30, avl(20, avl(10, empty, empty), avl(25, empty, empty)), avl(40, empty, empty)), avl(70, avl(60, empty, empty), avl(80, empty, empty)))).

% ===== Height Tests =====
% Check the height of various AVL trees
height_test_1 :- height(empty, 0).
height_test_2 :- height(avl(2, empty, empty), 1).
height_test_3 :- height(avl(5, avl(2, empty, empty), empty), 2).
height_test_4 :- height(avl(5, avl(2, avl(1, empty, empty), empty), avl(6, empty, empty)), 3).
height_test_5 :- height(avl(3, avl(1, empty, empty), avl(5, empty, empty)), 2).

% ===== Add Tests =====
% Insert values into the AVL tree and check the resulting structure
add_test_1 :- insert(1, avl(3, empty, empty), avl(3, avl(1, empty, empty), empty)).
add_test_2 :- insert(9, avl(3, avl(1, empty, empty), empty), avl(3, avl(1, empty, empty), avl(9, empty, empty))).
add_test_3 :- insert(5, avl(3, avl(1, empty, empty), avl(9, empty, empty)), avl(3, avl(1, empty, empty), avl(9, avl(5, empty, empty), empty))).
add_test_4 :- insert(11, avl(3, avl(1, empty, empty), avl(9, empty, empty)), avl(3, avl(1, empty, empty), avl(9, empty, avl(11, empty, empty)))).

% ===== Display Tests =====
% Display the AVL tree (always true)
display_test_1 :- displayTree(avl(3, avl(1, empty, empty), avl(5, empty, empty))).
display_test_2 :- displayTree(avl(5, avl(1, empty, empty), avl(7, avl(5, empty, empty), avl(8, empty, empty)))).
display_test_3 :- displayTree(avl(4, avl(2, avl(1, empty, empty), avl(3, empty, empty)), avl(6, avl(5, empty, empty), avl(9, empty, empty)))).

% ===== Run All Tests =====
run_tests :-
    (   member_test_1 -> write('Passed: member_test_1'), nl
    ;   write('Failed: member_test_1'), nl
    ),
    (   member_test_2 -> write('Passed: member_test_2'), nl
    ;   write('Failed: member_test_2'), nl
    ),
    (   member_test_3 -> write('Passed: member_test_3'), nl
    ;   write('Failed: member_test_3'), nl
    ),
    (   height_test_1 -> write('Passed: height_test_1'), nl
    ;   write('Failed: height_test_1'), nl
    ),
    (   height_test_2 -> write('Passed: height_test_2'), nl
    ;   write('Failed: height_test_2'), nl
    ),
    (   height_test_3 -> write('Passed: height_test_3'), nl
    ;   write('Failed: height_test_3'), nl
    ),
    (   height_test_4 -> write('Passed: height_test_4'), nl
    ;   write('Failed: height_test_4'), nl
    ),
    (   height_test_5 -> write('Passed: height_test_5'), nl
    ;   write('Failed: height_test_5'), nl
    ),
    (   add_test_1 -> write('Passed: add_test_1'), nl
    ;   write('Failed: add_test_1'), nl
    ),
    (   add_test_2 -> write('Passed: add_test_2'), nl
    ;   write('Failed: add_test_2'), nl
    ),
    (   add_test_3 -> write('Passed: add_test_3'), nl
    ;   write('Failed: add_test_3'), nl
    ),
    (   add_test_4 -> write('Passed: add_test_4'), nl
    ;   write('Failed: add_test_4'), nl
    ),
    (   display_test_1 -> write('Passed: display_test_1'), nl
    ;   write('Failed: display_test_1'), nl
    ),
    (   display_test_2 -> write('Passed: display_test_2'), nl
    ;   write('Failed: display_test_2'), nl
    ),
    (   display_test_3 -> write('Passed: display_test_3'), nl
    ;   write('Failed: display_test_3'), nl
    ).