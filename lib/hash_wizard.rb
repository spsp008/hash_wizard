require "hash_wizard/version"

module HashWizard

  # method to exclude any key in entire nested hash including Array
  def self.delete_keys(hash_data, keys)
    case hash_data
    when Hash then hash_data = hash_data.each_with_object({}) { |(k, v), m| m[k] = delete_keys(v, keys) unless keys.include?(k); m }
    when Array then hash_data.map! { |e| delete_keys(e, keys) }
    end
    hash_data
  end

  # method to modify key with another in entire nested hash including Array
  # k_t_r is key to replac and k_t_w is key to replace
  def self.rename_key(hash_data, k_t_r, k_w_r)
    case hash_data
    when Hash then hash_data = hash_data.inject({}) { |m, (k, v)| rename_key_block_code(m, k, v, k_t_r, k_w_r) }
    when Array then hash_data.map! { |e| rename_key(e, k_t_r, k_w_r) }
    end
    hash_data
  end

  def self.rename_key_block_code(m, k, v, k_t_r, k_w_r)
    if k == k_t_r
      m[k_w_r] = rename_key(v, k_t_r, k_w_r)
    else
      m[k] = rename_key(v, k_t_r, k_w_r)
    end
    m
  end

  # method to set a particular value of a particuler key with another in entire nested hash including Array
  def self.set_key_value(hash_data, key, value)
    case hash_data
    when Hash then hash_data = hash_data.inject({}) { |m, (k, v)| set_key_value_block_code(m, k, v, key, value) }
    when Array then hash_data.map! { |e| set_key_value(e, key, value) }
    end
    hash_data
  end

  def self.set_key_value_block_code(m, k, v, key, value)
    m[k] = if k == key && m[k].nil?
      value
    else
      set_key_value(v, key, value)
    end
    m
  end

  class Error < StandardError; end
  # Your code goes here...
end
