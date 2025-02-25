/* FACTS */

book(illiad, homer, study, 500).
book(c, richie, study, 150).
book(ntbible, sams, reference, 480).
book(ntfordummies, bob, reference, 450).
book(montypython, cleese, comedy, 300).
book(funnybones, john, comedy, 500).
book(masacre, dillenger, crime, 180).
book(crimescene, black, crime, 450).
book(lilacbus, binchey, fiction, 200).
book(phantomworld, johnson, fiction, 410).
book(shakespeare, bill, drama, 190).
book(hamlet, shakespeare, drama, 500).

buildLibrary(Lib) :- findall(book(Title, Author, Genre, Size),
                             book(Title, Author, Genre, Size),
                             Lib).

/* NOT FACTS */

is_holiday(book(_, _, G, S)) :- S < 400, G \== study, G \== reference.
holiday(B, [B | _]) :- is_holiday(B).
holiday(B, [_ | T]) :- holiday(B, T).

is_revision(book(_, _, G, S)) :- S > 300, (G == study; G == reference).
revision(B, [B | _]) :- is_revision(B).
revision(B, [_ | T]) :- revision(B, T).

is_literary(book(_, _, G, _)) :- G == drama.
literary(B, [B | _]) :- is_literary(B).
literary(B, [_ | T]) :- literary(B, T).

is_leisure(book(_, _, G, _)) :- (G == comedy; G == fiction).
leisure(B, [B | _]) :- is_leisure(B).
leisure(B, [_ | T]) :- leisure(B, T).

