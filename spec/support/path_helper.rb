def stylesheets_path
  @stylesheet_path ||= Pathname.new("stylesheets")
end

def root_file
  stylesheets_path.join('toppings.css.sass')
end

def test_config_path
  Pathname.new(Toppings.gem_root).join('spec/fixtures/config')
end