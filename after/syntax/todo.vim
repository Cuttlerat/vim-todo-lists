"Syntax commands ordering is important due to order of the matching
" MacOS only
let yesterday = trim(system("gdate -d'y' +%d-%m-%Y"))

syntax match vimTodoListsDone '^\s*- \[X\].*' contains=vimTodoListsStartDate,vimTodoListsEndDate,vimTodoListsYesterdayDate
syntax match vimTodoListsNormal '^\s*- \[ \]\s*.*' contains=vimTodoListsStartDate
syntax match vimTodoListsImportant '^\s*- \[ \]\s*!.*' contains=vimTodoListsStartDate
syntax match vimTodoListsStartDate '\[\d\{2\}-\d\{2\}-\d\{4\}\]' contained
syntax match vimTodoListsEndDate /\(- \)\@<=\[\d\{2\}-\d\{2\}-\d\{4\}\]$/ contained
execute 'syntax match vimTodoListsYesterdayDate /\(- \)\@<=\[' . yesterday . '\]$/ contained'

highlight link vimTodoListsDone Comment
highlight link vimTodoListsNormal Normal
highlight link vimTodoListsImportant Underlined
highlight link vimTodoListsStartDate Statement
highlight link vimTodoListsEndDate Error
highlight link vimTodoListsYesterdayDate Type
