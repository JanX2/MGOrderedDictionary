Pod::Spec.new do |s|
	s.name = "MGOrderedDictionary"
	s.version = "0.1"
	s.summary = "A simple ordered dictionary class."
	s.homepage = "http://github.com/gwynne/MGOrderedDictionary"
	s.license = {
		:type => 'zlib',
		:text => <<-LICENSE
				Copyright (C) 2008 Matt Gallagher. All rights reserved.
				Copyright (C) 2012 Gwynne Raskind. All rights reserved.

				This software is provided 'as-is', without any express or implied
				warranty. In no event will the authors be held liable for any damages
				arising from the use of this software. Permission is granted to anyone to
				use this software for any purpose, including commercial applications, and to
				alter it and redistribute it freely, subject to the following restrictions:

				1. The origin of this software must not be misrepresented; you must not
				   claim that you wrote the original software. If you use this software
				   in a product, an acknowledgment in the product documentation would be
				   appreciated but is not required.
				2. Altered source versions must be plainly marked as such, and must not be
				   misrepresented as being the original software.
				3. This notice may not be removed or altered from any source
				   distribution.
		LICENSE
	}
	s.authors = {
		"Matt Gallagher" => "matt@projectswithlove.com",
		"Gwynne Raskind" => "gwynne@darkrainfall.org"
	}
	s.source = { :git => "https://github.com/gwynne/MGOrderedDictionary.git", :tag => "0.1" }
	s.ios.deployment_target = '6.0'
	s.osx.deployment_target = '10.8'
	s.source_files = 'MGOrderedDictionary.{h,m}'
	s.requires_arc = true
end
