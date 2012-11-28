:cover.start

beam = File.expand_path("../../ebin", __FILE__) /> to_char_list
:cover.compile_beam_directory(beam)

System.at_exit fn(_) ->
  IO.puts "Generating cover results..."

  cover_dir = File.expand_path("../../cover", __FILE__)
  File.mkdir_p!(cover_dir)

  Enum.each :cover.modules, fn(mod) ->
    :cover.analyse_to_file(mod, '#{cover_dir}/#{mod}.html', [:html]) /> IO.inspect
  end
end

ExUnit.start []