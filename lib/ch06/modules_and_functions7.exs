## 浮動点少数を2つの十進数からなる文字列に変換する

:io.format(" this is  ~4.2f~n ", [3.1415926535])

# iex(5)> :io.format(" this is  ~3.1f~n ", [678785.768])
#  this is  ***
#  :ok
# iex(6)> :io.format(" this is  ~3.1f~n ", [65.768])
#  this is  ***
#  :ok
# iex(7)> :io.format(" this is  ~3.1f~n ", [65.7])
#  this is  ***
#  :ok
# iex(8)> :io.format(" this is  ~3.1f~n ", [5.7])
#  this is  5.7
#  :ok
# iex(9)> :io.format(" this is  ~3.1f~n ", [5.7899])
#  this is  5.8


## オペレーティング・システムの環境変数を取り出す
System.get_env()
#iex(11)> System.get_env()
# %{"PATHEXT" => ".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW",
#   "configsetroot" => "C:\\WINDOWS\\ConfigSetRoot",
#   "allPars" => "+iex --erl \"-user Elixir.IEx.CLI\" --no-halt",
#   "FPS_BROWSER_USER_PROFILE_STRING" => "Default",
#   "ext_libs" => " -pa \"D:\\Program Files (x86)\\Elixir\\lib\\eex\\ebin\" -pa \"D:\\Program Files (x86)\\Elixir\\lib\\elixir\\ebin\" -pa \"D:\\Program Files (x86)\\Elixir\\lib\\ex_unit\\ebin\" -pa \"D:\\Program Files (x86)\\Elixir\\lib\\iex\\ebin\" -pa \"D:\\Program Files (x86)\\Elixir\\lib\\logger\\ebin\" -pa \"D:\\Program Files (x86)\\Elixir\\lib\\mix\\ebin\"",
#   "USERPROFILE" => "C:\\Users\\takum", "COMPUTERNAME" => "MSI",
#   "runMode" => "\"iex\"", "USERDOMAIN_ROAMINGPROFILE" => "MSI",
#   "USERNAME" => "takum", "SystemDrive" => "C:", "PROMPT" => "$P$G",
#   "LOGONSERVER" => "\\\\MSI",
#   "FPS_BROWSER_APP_PROFILE_STRING" => "Internet Explorer", "OS" => "Windows_NT",
#   "windir" => "C:\\WINDOWS",


## ファイル名の拡張子を取り出す
Path.extname("README.md")

# iex(16)> Path.extname("dave/test.md")
# ".md"


## プロセスのカレントワーキングディレクトリを返す
System.cwd()
# iex(17)> System.cwd()
# "d:/SourceCode/AOSN/elixir"


## JSON 文字列をElixirのデータ構造に変換する
# Poison というのがある
# URL https://github.com/devinus/poison
# 使用例
# Poison.encode!(%Person{name: "Devin Torres", age: 27})
#=> "{\"name\":\"Devin Torres\",\"age\":27}"

## OS上でシェルコマンドを実行する

System.cmd("whoami", [])

# iex(6)> System.cmd("whoami", [])
# {"msi\\takum\r\n", 0}
# 参考　http://stackoverflow.com/questions/22594988/run-shell-commands-in-elixir