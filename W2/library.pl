/* FACTS */
book(illiad, homer, study, 500).
book(c, richie, study, 150).

book(nt_bible, sams, reference, 480).
book(ntfordummies, bob, reference, 450).

book(monty_python, cleese, comedy, 300).
book(funnybones, john, comedy, 500).

book(masacre, dillenger, crime, 180).
book(crimescene, black, crime, 450).

book(lilacbus, binchey, fiction, 200).
book(phantomworld, johnson, fiction, 410).

book(shakespeare, bill, drama, 190).
book(hamlet, shakespeare, drama, 500).

buildLibrary(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author,
Genre, Size), Lib).

/* RELATIONSHIPS */
holiday(book(HT, HA, _, _)) :-
    book(HT, HA, Genre, Size),
    Size < 400,
    Genre \== drama,
    Genre \== reference.

revision(book(HT, HA, _, _)) :-
    book(HT, HA, Genre, Size),
    Size > 300,
    (Genre == study; Genre == reference).

literary(book(HT, HA, _, _)) :-
    book(HT, HA, Genre, Size),
    Genre == drama,
    Size \== 0.

leisure(book(HT, HA, _, HS)) :-
    book(HT, HA, Genre, HS),
    (Genre == comedy; Genre == fiction).































































