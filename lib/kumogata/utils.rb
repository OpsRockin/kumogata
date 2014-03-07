class Kumogata::Utils
  class << self
    def camelize(str)
      str.to_s.split(/[-_]/).map {|i|
        i[0, 1].upcase + i[1..-1].downcase
      }.join
    end

    def get_user_host
      user = `whoami`.strip rescue ''
      host = `hostname`.strip rescue ''
      user_host = [user, host].select {|i| not i.empty? }.join('-')
      user_host.empty? ? nil : user_host
    end

    def random_param_name(n)
      a_zA_Z = (('a'..'z').to_a + ('A'..'Z').to_a)
      (a_zA_Z.sample(1) + (a_zA_Z + ['-']).sample(n - 1)).join
    end
  end # of class methods
end

module Kumogata
  ENCRYPTION_PASSWORD = Kumogata::Utils.random_param_name(16)
end