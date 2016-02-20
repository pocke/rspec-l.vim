let s:save_cpo = &cpo
set cpo&vim

let g:rspec_l#rspec_cmd = get(g:, 'rspec_cmd', 'bin/rspec')



function! rspec_l#do() abort
  let fname = expand('%')
  let line  = line('.')
  let arg   = fname . ':' . line

  let handle = ch_open("127.0.0.1:8888", {"mode": "json"})
  let cmd = g:rspec_l#rspec_cmd . " " . arg
  echom string(cmd)
  call ch_sendexpr(handle, cmd)
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
