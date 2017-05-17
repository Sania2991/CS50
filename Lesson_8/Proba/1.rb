class Foo
  attr_accessor :options

  # ok
  def initialize(options)
    self.options = options
    # both options and self.options are equivalent here
  end

  # good
  def do_something(params = {})
    unless params[:when] == :later
      puts(options[:message])
    end
  end
end

f = Foo.new({message: "123"})
p f.do_something(when: :later1)