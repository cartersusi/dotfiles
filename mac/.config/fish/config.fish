if status is-interactive
    function chat
        if test -n "$argv"
            source ~/RAG/venv/bin/activate.fish
            python3 ~/chat.py $argv
            deactivate
        else
            echo "Usage: chat <message>"
        end
    end
    function extract_audio
        if test (count $argv) -ne 2
            echo "Usage: extract_audio input_video output_audio"
            return 1
        else
            ffmpeg -i $argv[1] -q:a 0 -map a $argv[2]
        end
    end
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
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx PATH ~/.local/bin $PATH
set -gx PATH /Users/cartersusi/.bstore/bin $PATH

