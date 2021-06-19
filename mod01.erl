% modu
-module(mod01).
-compile(export_all).

hello() ->
  io:format("~s~n", ["Hello world!"]).
