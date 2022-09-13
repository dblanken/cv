module ActsLikeRails
  def render(filename)
    erb = ERB.new(
      File.read(
        File.join("./templates/#{@role}/_#{filename}.#{@output_type}.erb")
      ),
      trim_mode: '-'
    )

    erb.result
  end
end
