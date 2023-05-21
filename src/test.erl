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
  compare(ping_timeout),
  Jing.

%%%%%%%%%%%%%%% 第一部分 record type spec %%%%%%%%%%%%%%%



%%%%%%%%%%%%%%% 第二部分 函数递归 %%%%%%%%%%%%%%%

% 阶乘
fac(1) ->
  1;

fac(N) ->
  N*fac(N-1).

% 求和, | 符号用来切分列表
total_sum([]) ->
  0;

total_sum([First|Rest]) ->
  First+total_sum(Rest).

%%%%%%%%%%%%%%% 第二部分 函数递归 %%%%%%%%%%%%%%%



%%%%%%%%%%%%%%% 第三部分 map %%%%%%%%%%%%%%%
getmap(Username,Password) ->
  #{
    name => Username,
    pass => Password
  }.

% 使用 := 匹配map中的name对应的值，并将其赋值到User变量中
alpha(#{name := User}) ->
  io:format("Username is: ~p ~n",[User]).
%%%%%%%%%%%%%%% 第三部分 map %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% 第四部分 atom %%%%%%%%%%%%%%%
compare(Reason) ->
  if
    Reason =:= ping_timeout ->
      io:format("Reason is: ~p ~n",[Reason]);
    Reason =/= ping_timeout ->
      io:format("Reason is unknown : ~p ~n",[Reason])
  end.

%%%%%%%%%%%%%%% 第四部分 atom %%%%%%%%%%%%%%%



hello_world() ->
  Sun = #person{name = "sunxu",height = 178,sex = "man"},
  hello(Sun,18),

  io:format("Factorial result: ~p ~n",[fac(7)]),

  io:format("total sum is: ~p ~n",[total_sum([1,2,3,4,5])]),

  alpha(getmap("sunxu","sunxu")).

