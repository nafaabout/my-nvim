vim.cmd([[
augroup myvimrc
  autocmd!
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd BufEnter .babelrc   set ft=json
  autocmd BufEnter *.slim     set ft=slim
  autocmd BufWritePost *.vue,*.js,*.json set nomodified
  autocmd BufWritePost vimrc.lua source $MYVIMRC
  autocmd BufRead,BufNewFile *.vue set ft=vue.html
  autocmd BufWritePre Gemfile let b:changed = &modified
  autocmd BufWritePost Gemfile if b:changed then | call jobstart("bundle install", { 'detach':1 }) | endif
  autocmd BufWritePost **/p1tsa/*.* !docker exec -d p1tsa_p1tsa_1 make rsync_sources
  " autocmd BufWritePost **/p1tsa/*.* silent !docker exec -d pta-dist_p1tsa make rsync_sources
augroup END
]])

