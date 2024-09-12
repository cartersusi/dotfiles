if status is-interactive
    function ga
        if test -n "$argv"
            git add $argv
        else
            git add .
        end
    end
    function gpl
        if test -n "$argv"
            git pull $argv
        else
            git pull
        end
    end
    function gps
        if test -n "$argv"
            git push $argv
        else 
            git push
        end
    end
    function gpr
        if test -n "$argv"
            git pull --rebase $argv
        else
            git pull --rebase
        end
    end
    function gc
        if test -n "$argv"
            git commit -m $argv
        else
            git commit -m "update"
        end
    end
    function py
        if test -n "$argv"
            python3 $argv
        else
            python3 .
        end
    end
    function o
        if test -n "$argv"
            code $argv
        else
            code .
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
            go mod init packg
        end
    end
    function zb
        if test -n "$argv"
            zig build $argv
        else
            zig build
        end
    end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<


