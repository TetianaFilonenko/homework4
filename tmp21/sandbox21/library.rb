::Dir[::File.join(__dir__, 'library', '*.rb')].sort_by{ |f| f }.each{ |f| require f }
module Library
end
