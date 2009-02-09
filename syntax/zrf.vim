" Vim syntax file
" Language:	ZRF (Zillions Rules File for Zillions of Games)
"               see http://www.zillionsofgames.com for more info
" Maintainer:	Jochen Schoof <joscho@bigfoot.de>
" Inspired by various .vim files contained in the VIM 6.1 distribution
" Last Change:	2009 Feb 9
" Version:	1.2
" Changes:	- corrected identifier pattern (thanks to Jeff Mallett) 
" 		- (finally) updated description to match Vim 7.x
"
" This is probably far from perfect as it is my first syntax file.
" All feedback and input is appreciated.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" We need - and ? as parts of keywords and thus, include these
if version >= 600
  setlocal iskeyword=a-z,A-Z,?,-
else
  set iskeyword=a-z,A-Z,?,-
endif

" ZRF is case dependent
syntax case match

" Comments start with ; and continue to the end of line
syntax match   zrfComment /;.*/

" Identifiers are quite liberal in ZRF (thanks to Jeff Mallett for input)
syntax match   zrfIdent   /[-_?0-9]*[a-zA-Z][-_?!a-zA-Z0-9]*/

" Parameters of macros can be accessed using $1, $2 etc.
syntax match   zrfMacroVar /\$[1-9][0-9]*/

" ZRF only knows integers with and without leading sign
" ! If immediatedly followed by a character, !
" ! this is not a number but an identifier.  !
syntax match   zrfNumber  /[-+]\=[0-9]\+[^a-zA-Z]/me=e-1

" Strings may contain quoted quotation marks and cross line borders
syntax region  zrfString  start=/"/ skip=/\\"/ end=/"/

" Now a few keywords in different groups
syntax keyword zrfPreProc define include version
syntax keyword zrfCondition defended? enemy? empty? friend? flag?
syntax keyword zrfCondition in-zone? last-from? last-to? marked? neutral?
syntax keyword zrfCondition on-board? piece? position? position-flag?
syntax keyword zrfCondition not-defended? not-enemy? not-empty? not-friend?
syntax keyword zrfCondition not-flag? not-in-zone? not-last-from? not-last-to? 
syntax keyword zrfCondition not-marked? not-neutral? not-on-board?
syntax keyword zrfCondition not-piece? not-position? not-position-flag?
syntax keyword zrfGoal absolute-config any-owner captured checkmated
syntax keyword zrfGoal count-condition draw-condition loss-condition
syntax keyword zrfGoal relative-config repetition stalemated win-condition
syntax keyword zrfKeyword add add-partial add-copy add-copy-partial
syntax keyword zrfKeyword allow-flipping animate-captures animate-drops
syntax keyword zrfKeyword attribute back board board-setup capture
syntax keyword zrfKeyword capture-sound cascade change-owner change-sound
syntax keyword zrfKeyword change-type click-sound drops default description
syntax keyword zrfKeyword dimensions dummy directions drop-sound engine
syntax keyword zrfKeyword from flip game go grid history help image
syntax keyword zrfKeyword include-off-pieces kill-positions links loss-sound
syntax keyword zrfKeyword release-sound mark moves move-priorities move-type
syntax keyword zrfKeyword move-sound music name notation opposite off
syntax keyword zrfKeyword opening-sound positions players pass-turn
syntax keyword zrfKeyword pass-partial piece repeat recycle-captures
syntax keyword zrfKeyword release-sound recycle-promotions set-flag
syntax keyword zrfKeyword set-attribute set-position-flag symmetry strategy
syntax keyword zrfKeyword solution start-rectangle to turn-order translate
syntax keyword zrfKeyword title unlink variant win-sound loss-sound zone
syntax keyword zrfControl and false forced else if not or true verify while

if version >= 508 || !exists("did_zrf_syntax_inits")
  if version < 508
    let did_zrf_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink zrfComment	Comment
  HiLink zrfIdent	Identifier
  HiLink zrfMacroVar	Special
  HiLink zrfNumber	Number
  HiLink zrfString	String
  HiLink zrfPreProc	PreProc
  HiLink zrfCondition	Type
  HiLink zrfGoal	Underlined
  HiLink zrfKeyword	Statement
  HiLink zrfControl	Statement

  delcommand HiLink
endif

let b:current_syntax = "zrf"

