source ~/.vimrc
nmap ,<C-T> :terminal<CR>
tnoremap <C-\> <C-\><C-N>

" Stupid nonsense trying to open current terminal line in split, I seriously cannot believe how dumb this is
tnoremap <C-J> <C-\><C-N>G?.<CR>v?^\$<CR>lly:new<CR>:setl buftype=nofile<CR>:nnoremap <buffer> <lt>C-J> ggIa<lt>Esc>vG$y:bw<lt>CR>i<lt>Esc>dd<lt>C-\><lt>C-N>pi<CR>:inoremap <buffer> <lt>C-J> <lt>Esc>ggIa<lt>Esc>vG$y:bw<lt>CR>i<lt>Esc>dd<lt>C-\><lt>C-N>pi<CR>p
