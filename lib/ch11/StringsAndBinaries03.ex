['cat'|'dog']

'''
'dog'は文字のリストであるため、リストとして認識される
['cat'|[100,111,103]]

$iex(8)> [100,111,103] = 'dog'
$'dog'
$iex(9)> [100,111,103] = 'cat'
$** (MatchError) no match of right hand side value: 'cat'


'''