class KeyServerEntity
  attr_reader :all_keys
  attr_reader :free_keys
  attr_reader :life_time
  attr_reader :timeout

  def initialize
    @all_keys = Hash.new
    @free_keys = Hash.new
  end

  def generate_bunch(num_keys, life_time=300, timeout=30)
    @life_time = life_time
    @timeout = timeout
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    while @all_keys.length < num_keys do
      string = (0...50).map { o[rand(o.length)] }.join
      @all_keys[string] = { :created_at => Time.now.to_i,
                            :updated_at => nil }   # updated_at is the timestamp when the key is assigned
      @free_keys[string] = true
    end
    @all_keys.keys
  end

  def get
    key_ret = nil
    return key_ret if @free_keys.length == 0
    @free_keys.keys.each do |key|
      created_at = @all_keys[key][:created_at]
      if Time.now.to_i - created_at < @life_time
        @all_keys[key][:updated_at] = Time.now.to_i
        @free_keys.delete(key)
        key_ret = key
        break
      else
        delete @free_keys.delete(key)
      end
    end
    key_ret
  end

  def release(key)
    if @all_keys[key].nil?
      return false
    end

    @all_keys[key][:updated_at] = Time.now.to_i
    @free_keys[key] = true

  end

  def refresh(key)
    if @all_keys[key].nil?
      return false
    end
    if Time.now.to_i - @all_keys[key][:created_at] < @life_time
      @all_keys[key][:created_at] = Time.now.to_i
      true
    else  # The key has expired, should be deleted
      @all_keys.delete(key)
      false
    end
  end

  def delete(key)
    if @all_keys[key].nil?
      return false
    end
    @all_keys.delete(key)
    @free_keys.delete(key)
    true
  end

  def clean_job
    @all_keys.keys.each do |key|
      if Time.now.to_i - @all_keys[key][:created_at] >= @life_time
        @all_keys.delete(key)
      elsif @all_keys[key][:updated_at].nil?
        next
      elsif Time.now.to_i - @all_keys[key][:updated_at] >= @timeout
        release(key)
      end
    end
  end
end
