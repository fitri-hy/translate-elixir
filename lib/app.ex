defmodule App do
  def start do
    loop()
  end

  defp loop do
    IO.puts "Kata Yang Ingin Di Terjemahakan:"
    question = IO.gets("")

    IO.puts "Pilih Bahasa (contoh: en):"
    print_language_table()

    target_lang = IO.gets("") |> String.trim()

    case App.Translator.ask(question, target_lang) do
      {:ok, body} ->
        IO.puts "Terjemahan: #{body["translation"]}"
      {:error, _error} ->
        IO.puts "Terjadi kesalahan saat mengirim permintaan."
    end

    loop()
  end

  defp print_language_table do
    langs = [
      {"[en]", "English"},
      {"[id]", "Indonesian"},
      {"[fr]", "French"},
	  {"[es]", "Spanish"},
      {"[zh]", "Chinese"},
      {"[ar]", "Arabic"},
      {"[de]", "German"},
      {"[ja]", "Japanese"},
      {"[pt]", "Portuguese"},
      {"[ru]", "Russian"},
      {"[hi]", "Hindi"},
      {"[it]", "Italian"},
      {"[ko]", "Korean"},
      {"[tr]", "Turkish"},
      {"[nl]", "Dutch"},
      {"[sv]", "Swedish"},
      {"[pl]", "Polish"},
      {"[fa]", "Persian"},
      {"[uk]", "Ukrainian"},
      {"[vi]", "Vietnamese"},
      {"[ro]", "Romanian"},
      {"[hu]", "Hungarian"},
      {"[cs]", "Czech"},
      {"etc", "..."},
    ]

    IO.puts "Pilihan Bahasa:"
    Enum.each(langs, fn {code, name} ->
      IO.puts "#{code}: #{name}"
    end)
  end
end
