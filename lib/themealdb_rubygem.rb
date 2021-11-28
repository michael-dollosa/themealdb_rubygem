require "themealdb_rubygem/version"

module ThemealdbRubygem
  autoload :Client, "themealdb_rubygem/client"
  class Error < StandardError; end
end
