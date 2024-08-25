set -gx PATH ~/.local/bin $PATH
set -gx PATH $PATH:/usr/lib/llvm16/bin
set -gx PATH ~/clones/bun/build $PATH

if status is-interactive
    # Commands to run in interactive sessions can go here
    function zbr
        if test -n "$argv"
            zig build run $argv
        else
            zig build run
        end
    end
    function zed
        if test -n "$argv"
            ~/.local/bin/zed $argv
        else
            ~/.local/bin/zed .
        end
    end
    function op
        if test -n "$argv"
            ~/.local/bin/zed $argv
        else
            ~/.local/bin/zed .
        end
    end
    function o
        if test -n "$argv"
            code $argv
        else
            code .
        end
    end
    function py
        if test -n "$argv"
            python3 $argv
        else
            python3 .
        end
    end
    function templ
	    if test -n "$argv"
	        /home/carter/clones/templ/cmd/templ/templ $argv
	    else
	        /home/carter/clones/templ/cmd/templ/templ
	    end
   end
    function p3
        if test -n "$argv"
            python3 $argv
        else
            python3
        end
    end
    function gb
        if test -n "$argv"
            go build $argv
        else
            go build .
        end
    end
    function gr
        if test -n "$argv"
            go run $argv
        else
            go run .
        end
    end
    function gmi
        if test -n "$argv"
            go mod init $argv
        else
            go mod init tmp
        end
    end
    function reactify
        if test -n "$argv"
            ~/.local/bin/reactify $argv
        else
            ~/.local/bin/reactify -h
        end
    end
    function paint
        ~/.local/bin/paint
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
