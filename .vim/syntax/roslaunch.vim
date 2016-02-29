
if exists("b:current_syntax")
  finish
endif
 
runtime syntax/xml.vim
 
let s:current_syntax=b:current_syntax
unlet b:current_syntax
 
syntax include @YAML syntax/yaml.vim
syntax region ymlSnipInline matchgroup=rosparamTag start="\m<.\{-}rosparam.\{-}>" end="\m</.\{-}rosparam.\{-}>" contains=@YAML containedin=xmlEntity
hi link rosparamTag ModeMsg
 
let b:current_syntax=s:current_syntax
