RSpec.describe HashWizard do
  it "has a version number" do
    expect(HashWizard::VERSION).not_to be nil
  end

  it "does delete a key" do
    data = {}
    data[:id] = 5
    data[:name] = 'shiv'
    expect(data[:id]).to eq(5)
    expect(data[:name]).to eq('shiv')
    modified_data = HashWizard.delete_keys(data, [:id, :name])
    expect(modified_data[:id]).to be nil
    expect(modified_data[:name]).to be nil
  end

  it "does rename key" do
    data = {}
    data[:id] = 5
    expect(data[:num]).to be nil
    expect(data[:id]).to eq(5)
    modified_data = HashWizard.rename_key(data, :id, :num)
    expect(modified_data[:id]).to be nil
    expect(modified_data[:num]).to eq(5)
  end

  it "does set value of a key" do
    data = {}
    data[:name] = 'shiv'
    expect(data[:name]).to eq('shiv')
    modified_data = HashWizard.set_key_value(data, :name, 'spsp')
    expect(modified_data[:name]).to eq('spsp')
  end
end
