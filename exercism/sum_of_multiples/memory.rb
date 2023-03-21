class Memory
  attr_accessor :last_memoried_range

  def initialize
    @configs = {}
  end

  def add_config(config, ranges_hash)
    @configs[config] = ranges_hash
  end

  def []=(config, ranges)
    @configs[config.value] = ranges
  end

  def [](config)
    @configs[config.value]
  end
end
