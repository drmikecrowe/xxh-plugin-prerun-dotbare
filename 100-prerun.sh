if [[ $XDG_CACHE_HOME ]]; then
  done_file=$XDG_CACHE_HOME/xxh-plugin-prerun-dotbare-done
else
  done_file=$XXH_HOME/.xxh-plugin-prerun-dotbare-done
fi

if [[ ! -f $done_file ]]; then
  if [[ ! -z $DOTBARE_REPO ]]; then
    export DOTBARE_DIR="$XXH_HOME/.dotbarefiles"
    if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
        echo "xxh-plugin-prerun-dotbare: installing $DOTBARE_REPO"
    fi
    wget https://github.com/kazhala/dotbare/archive/refs/heads/master.tar.gz -qO- | tar -xz && mv dotbare-master $XXH_HOME/.dotbare && \
        source $XXH_HOME/.dotbare/dotbare.plugin.bash && \
        dotbare finit -u https://github.com/$DOTBARE_REPO
    mkdir -p `dirname $done_file`
    echo 'done' > $done_file
  fi
fi

cd $XXH_HOME
