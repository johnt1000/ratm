require_relative 'ratm/string'

class Ratm
    def version
        return 'Rage Against The Machine'.bold.concat(' (ratm)'.green)
                    .concat(' - ').concat('0.0.1'.yellow)
    end
end