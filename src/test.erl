%%%-------------------------------------------------------------------
%%% @author sunxu
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 2月 2023 22:16
%%%-------------------------------------------------------------------
-module(test).
-author("sunxu").

%% API 设置导出的函数
-export([hello_world/0]).


%%%%%%%%%%%%%%% 第一部分 record type spec %%%%%%%%%%%%%%%
% 结构体 person
-record(person, {
  name = <<>> :: string(),
  age = 18 :: pos_integer(),
  sex = <<>> :: string(),
  height :: pos_integer()
}).

% 定义类型
-type person() :: #person{}.

% 设置函数hello入参和返回类型
-spec hello(person(),integer()) -> person().

% Height变量用来提取Sun中的height字段的值
hello(#person{height = Height} = Sun,Age)->
  Jing = Sun#person{name = "jing", age = Age, height = Height-13, sex = "woman"},
  Sex = Sun#person.sex,
  io:format("Person  is : ~p ~n", [ Sex ]),
  io:format("Person  is : ~p ~n", [ Sun ]),
  io:format("Person  is : ~p ~n", [ Jing ]),
  Jing.

%%%%%%%%%%%%%%% 第一部分 record type spec %%%%%%%%%%%%%%%



%%%%%%%%%%%%%%% 第二部分 函数递归 %%%%%%%%%%%%%%%
fac(1) ->
  1;

fac(N) ->
  N*fac(N-1).

%%%%%%%%%%%%%%% 第二部分 函数递归 %%%%%%%%%%%%%%%



hello_world() ->
  Sun = #person{name = "sunxu",height = 178,sex = "man"},
  hello(Sun,18),
  io:format("Factorial result: ~p ~n",[fac(7)]).
