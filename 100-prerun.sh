CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
plugin_name="$(basename $(dirname $(dirname ${BASH_SOURCE[0]})))"
BASH_IT="$CURR_DIR/.bash_it"
LOGFILE=/tmp/$plugin_name.log

if [[ $XDG_CACHE_HOME ]]; then
  done_file=$XDG_CACHE_HOME/${plugin_name}-done
else
  done_file=$XXH_HOME/.${plugin_name}-done
fi

if [[ ! -f $done_file ]]; then
  if [[ ! -z $DOTBARE_REPO ]]; then
    export DOTBARE_DIR="$XXH_HOME/.dotbarefiles"
    if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
        echo "${plugin_name}: installing $DOTBARE_REPO"
    fi
    wget https://github.com/kazhala/dotbare/archive/refs/heads/master.tar.gz -qO- | tar -xz && mv dotbare-master $XXH_HOME/.dotbare >> $LOGFILE 2>&1 && \
        source $XXH_HOME/.dotbare/dotbare.plugin.bash && \
        dotbare finit -u https://github.com/$DOTBARE_REPO >> $LOGFILE 2>&1
    mkdir -p `dirname $done_file`
    echo 'done' > $done_file
  fi
fi

cd $XXH_HOME
