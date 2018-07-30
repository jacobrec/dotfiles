function LightsSwitch(inp)
    if a:inp
        execute "silent !sudo capslight on"
    else   
        execute "silent !sudo capslight off"
    endif
endfunction

"autocmd InsertLeave * :execute "call LightsSwitch(0)"
"autocmd InsertEnter * :execute "call LightsSwitch(1)"
"autocmd VimLeave * :execute "call LightsSwitch(0)"

