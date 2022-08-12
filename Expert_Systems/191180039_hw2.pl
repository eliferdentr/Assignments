%191180039 - elif erden
:- style_check(-singleton).

song('bear hug',album,'grey suit').
song('bear hug',release_year,2022).

song('morning star',album,'grey suit').
song('morning star',release_year,2022).

song('hurdle',album,'grey suit').
song('hurdle',release_year,2022).

song('decanting',album,'grey suit').
song('decanting',release_year,2022).

song('moment',album,'grey suit').
song('moment',release_year,2022).

song('o2',album,'self portrait').
song('o2',release_year,2020).

song('let\'s love',album,'self portrait').
song('let\'s love',release_year,2020).

song('made in you',album,'self portrait').
song('made in you',release_year,2020).

song('starry night',album,'self portrait').
song('starry night',release_year,2020).


song('for you now',album,'self portrait').
song('for you now',release_year,2020).

groupname(exo).
g_member('sehun').
g_member('kai').
g_member('baekhyun').
g_member('chanyeol').
g_member('lay').
g_member('suho').
g_member('xiumin').
g_member('do').

ask([which, album, is, X , in, ?]) :- (   song(X, album, Y) ->
                                  write(X), write(" is in "),  write(Y), nl;
                                  write(X), write(" is  not my song "), nl).

ask([is, X, your , song, ?]) :- (   song(X, album, _) ->
                                  write(X), write(" is my song "),nl;
                                  write(X), write(" is  not my song "),nl).

ask([what,are,your,songs,that,released,before,Z, ?]) :- forall(song(X,release_year,Y), ((Y<Z -> writeln(X) ; write("")))), writeln("").
ask([what,are,your,songs,that,released,after,Z, ?]) :- forall(song(X,release_year,Y), ((Y>Z -> writeln(X) ; write("")))),writeln("").
ask([what,are,your,songs,that,released,in,Z, ?]) :- forall(song(X,release_year,Y), ((Y=Z -> writeln(X) ; write("")))),writeln("").
    
ask([who,are,your,groupmates, ?]) :-  forall(g_member(X), writeln(X)).

ask([is, X, a, member, of, exo, ?]) :- (   g_member(X) ->
                                  writeln("yes, he is"),nl;
                                  write(X), write("no, he is not"),nl).
ask([why | X]) :- write("Who knows?"),nl.

ask([_ | T]) :- write("Sorry, couldn't catch that. Can you ask me another one?"),nl.
ask([who,are,you,?]) :- write("I am Suho!").



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

me_you(me,you).
me_you(i,you).
me_you(my,your).
me_you(am,are).
me_you(myself,yourself).

swap_word(X,Y) :- me_you(X,Y).
swap_word(X,Y) :- me_you(Y,X).
swap_word(W,W).

swap_person([], []).
swap_person([X|Xs], [Y|Ys]) :-
   swap_word(X,Y),
   !, swap_person(Xs,Ys).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

form_response(Input,Response) :-
   username(InputPattern, ResponsePatterns),
   match(InputPattern, Input),
   random_elem(ResponsePatterns, ResponsePattern),
   flatten(ResponsePattern, Response).

random_elem([], []).
random_elem(List, Elt) :-
        length(List, Length),
        random(0, Length, Index),
        nth0(Index, List, Elt).


match([], []).
match([Xs], IWs) :-
   var(Xs),
   !,
   Xs = IWs.
match([Xs,W|PWs], IWs) :-
   var(Xs),
   !,
   fill_var(Xs, W, IWs, IWsLeft),
   match([W|PWs], IWsLeft).
match([W|PWs], [W|IWs]) :-
   !,
   match(PWs, IWs).

fill_var([], W, [W|IWs], [W|IWs]) :-
   !.
fill_var([X|Xs], W, [X|IWs], IWsLeft) :-
   fill_var(Xs, W, IWs, IWsLeft).



respond(InputWordList, ResponseWordList) :-
   swap_person(InputWordList, SwappedWordList),
   form_response(SwappedWordList, ResponseWordList),
    
   !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
username( [your,name,is,X],
  [ [hi,X,how,can,i,help,you,?],
    [hello,X,you,can,ask,me,anything,.] ]).

username( [you,are,X],
  [ [hi,X,how,can,i,help,you,?],
    [hello,X,you,ask,me,anything,.] ]).

username( [X],
  [ [hi,X,how,can,i,help,you,?],
    [hello,X,you,ask,me,anything,.] ]).



 main :-
   write('Hi, I am Suho. What is your name?'), nl,
   repeat,
   write('> '), read(InputWordList),
   respond(InputWordList, ResponseWordList),
   write(ResponseWordList), nl,
     display_menu.

display_menu :-
    writeln("Enter 1 to ask me a question"),
    writeln("Enter 2 to exit. \n"),
    catch(
        (
            read(Menu_input),
            (
                valid_menu_option(Menu_input)
                -> (
                switch(Menu_input, [
                        1 : (
                            write('What do you want to ask?'), nl,
                                read(Input),
                             %%%%%%%%%%%%%%   
                                
                            %%%%%%%%%%%%
                                ask(Input),                            
                            display_menu
                        ),
                        2 : (
                            sleep(0.2),
                            writeln("Bye!"),
                            sleep(0.5)
                        )
                    ])
                )
                ; (
                    sleep(0.5),
                    writeln("Sorry, I couldn't catch it. Can you try typing something else?"),
                    sleep(1),
                    display_menu
                )
            )
        ),
        _,
        (
            writeln("Looks like you wrote something weird...let\'s try again..."),
            sleep(0.5),
            display_menu
        )
    ).




switch(X, [Val:Goal|Cases]) :-
    ( X=Val ->
        call(Goal)
    ;
        switch(X, Cases)
    ).

valid_menu_option(1).
valid_menu_option(2).
	




