 " Colorscheme
try
if has("gui_running")
    set background=dark
    colorscheme solarized
else
    colorscheme desert
    let g:colors_name="desert"
endif
catch
endtry

set nu
