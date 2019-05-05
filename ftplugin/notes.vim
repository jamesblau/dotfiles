" Vim filetype plugin
" Language:    Notes
" Maintainer:  Me
" Last Change: Recently

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = 'setlocal comments< commentstring<'

" Headers
nnoremap <Leader>hm I#<Space><Esc>
nnoremap <Leader>Hm I##<Space><Esc>yypVr#
nnoremap <Leader>HM I###<Space><Esc>A<Space>###<Esc>yypVr#

setl linebreak showbreak= wrap sw=4 ts=4 sts=4 expandtab
setl iskeyword=@,48-57,_,192-255

" Would be nice to include some symbols in words:
" setl iskeyword=@,48-57,_,192-255,177,178,216,915,916,920,928,931,934,936,937,945,946,947,948,949,951,952,954,955,956,960,961,962,963,964,966,968,969,8224,8225,8592,8593,8594,8595,8704,8706,8707,8709,8710,8711,8712,8715,8719,8721,8728,8729,8730,8734,8743,8744,8745,8746,8747,8748,8750,8756,8757,8764,8773,8776,8800,8804,8805,8834,8835,8838,8839
