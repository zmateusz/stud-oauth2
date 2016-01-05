describe 'Page' do
  it 'show login link' do
    visit '/'
    expect(page).to have_content 'Login'
  end
end
