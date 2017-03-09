require 'asana'

class Client
  def initialize(auth, *auth_args)
    @client = Asana::Client.new do |c|
      c.authentication auth, *auth_args
    end
  end

  def method_missing(meth, *args, &block)
    if @client.respond_to? meth
      @client.send(meth, *args, &block)
    else
      super
    end
  end

  def respond_to?(meth, include_private = false)
    @client.respond_to?(meth, include_private) || super
  end
end
