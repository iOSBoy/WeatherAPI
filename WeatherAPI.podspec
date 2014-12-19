Pod::Spec.new do |s|
	s.name = "WeatherAPI"
	s.version = "2014.12.19"
	download_url = "http://github.com/looping/" + s.name + ".git"
	
	s.source = { :git => download_url.to_s.downcase, :tag => s.version.to_s }
	s.source_files = s.name + "/src/**/*.{h,m}"
	s.resources = s.name + "/src/**/*.{png,jpg,jpeg,wav,xib,strings}"
	s.requires_arc = true

	s.ios.deployment_target = '6.0'
	
	s.dependency 'AFNetworking'
end
