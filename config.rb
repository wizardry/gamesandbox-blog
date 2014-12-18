#! ruby -Ku
require 'kconv'

###
# Blog settings
###

Time.zone = "Tokyo"

activate :blog do |blog_pc|
  # This will add a prefix to all links, template references and source paths
  blog_pc.name = ""
  blog_pc.prefix = "blog"
  blog_pc.permalink = "{category}/{year}/{month}/{day}/{title}.html"
  blog_pc.taglink = "tags/{tag}.html"
  blog_pc.sources = "{year}-{month}-{day}-{title}.html"
  blog_pc.layout = "blog-layout"
  blog_pc.summary_separator = /(READMORE)/
  blog_pc.summary_length = 250
  # blog_pc.month_link = "{year}/{month}.html"
  # blog_pc.day_link = "{year}/{month}/{day}.html"
  # blog_pc.default_extension = ".mb"
  blog_pc.year_link = "{year}.html"
  blog_pc.default_extension = ".markdown"
  blog_pc.default_extension = ".haml"
  blog_pc.default_extension = ".slim"

  blog_pc.tag_template = "tag.html"
  # blog_pc.categorylink = "categories/{category}.html"
  # blog_pc.category_template = "category.html"
  blog_pc.calendar_template = "calendar.html"

  # Enable pagination
  blog_pc.paginate = true
  blog_pc.per_page = 5
  blog_pc.page_link = "page/{num}"
end

# category page gen
# ready do
#   sitemap.resources.group_by{|p| p.data["category"] }.each do | category , pages |
#     proxy "categories/#{category}.html","category.html",
#       :locals => { :category => category, :pages => pages}
#   end
# end

page "/feed.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
activate :livereload, :host => 'localhost:4567'.chomp

set :haml, { ugly:true, format: :html5 }
set :slim, { :pretty => true, format: :html5 }

set :css_dir, 'css'
set :js_dir, 'script'
set :images_dir, 'img'

set :relative_links, true

# Build-specific configuration
activate :directory_indexes
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end
