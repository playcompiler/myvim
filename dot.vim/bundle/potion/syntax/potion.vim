" syntax highlight for potion files
"
if exists("b:current_syntax")
    finish
endif

"echom "begin to auto exec potion syntax highlight..."

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
syntax keyword potionFunction print join string 

syntax match potionComment  "\v#.*$" 
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link potionKeyword  Keyword
highlight link potionFunction Keyword
highlight link potionComment  Comment
highlight link potionOperator Operator
highlight link potionString   String

let b:current_syntax = "potion"

