module ActsLikeRails
  def render(filename)
    erb = ERB.new(
      File.read(
        File.join("./templates/#{@role}/_#{filename}.html.erb")
      )
    )

    erb.result
  end
end
