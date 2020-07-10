class PumlMetaData

  def initialize
    @filename = 'example.plantuml'
    convert_to_png
  end

  def convert_to_png
    setup
    output_steps
    convert
  end

  private

  def setup
    Dir.mkdir assets_directory_path unless File.exists? assets_directory_path
  end

  def output_steps
    str = "File #{@filename} has been deleted"
    str << "\nConverting #{@filename} to #{png}"
    str << "\n----------"
    puts str
  end

  def convert
    `cat #{@filename} | docker run --rm -i think/plantuml -tpng > #{png}`
  end

  def assets_directory_path
    File.dirname(@filename) + "/assets"
  end

  def png
    assets_directory_path + "/" + File.basename(@filename, ".puml") + ".png"
  end
end

PumlMetaData.new
