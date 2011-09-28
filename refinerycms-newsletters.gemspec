Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-newsletters'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Newsletters engine for Refinery CMS'
  s.date              = '2011-09-22'
  s.summary           = 'Newsletter engine for Refinery CMS allowing subscriptions/unsubscriptions/campains and limited statistics'
  s.homepage          = %q{http://mobile.web-now.de}
  s.email             = %q{juergen.helmers@gmail.com}
  s.authors           = ["Dr. Juergen Helmers"]
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
