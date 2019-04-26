setlocal tabstop=2           " How large \t characters show up
setlocal shiftwidth=2        " Indent amount for >>, << and autoindent
setlocal expandtab           " Tab keystokes become spaces

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent', '--no-port-file']
let g:neomake_javascript_enable_makers = ['eslint']
let g:javascript_plugin_flow = 1
