require "mkmf"

if RUBY_VERSION =~ /1.9/ then
    $CPPFLAGS += " -DRUBY_19"
end

have_library 'stdc++'
dir_config 'chasen'
have_library 'chasen', 'chasen_getopt_argv' and create_makefile 'chasen'
