xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0', 'xmlns:atom' => 'https://www.w3.org/2005/Atom' do
  xml << yield
end
