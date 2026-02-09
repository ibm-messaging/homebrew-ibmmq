=begin
Copyright 2024, 2026 IBM Corp.

Licensed under the Apache License, Version 2.0 (the 'License');
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end


cask "mqdevtoolkit" do
  version "9.4.5.0"
  sha256 "1ebdb991ceeefa10ba17a86b8a339bf522655294410b1804ec555888b66df36c"

  url "https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/messaging/mqdev/mactoolkit/#{version}-IBM-MQ-DevToolkit-MacOS.pkg",
     verified: "https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/messaging/mqdev/"
  name "mqdevtoolkit"
  desc "IBM MQ Advanced Toolkit for MacOS"
  homepage "https://github.ibm.com/ibm-messaging/homebrew-ibmmq"

  pkg "#{version}-IBM-MQ-DevToolkit-MacOS.pkg"

  uninstall pkgutil: "com.ibm.cloud.mqclient"

  caveats do
    license "https://ibm.biz/mqdevmacclient"
    path_environment_variable "/opt/mqm/bin"
  end

  postflight do
    def bold (unmodString); "\e[1m#{unmodString}\e[22m" end
    def underline (unmodString); "\e[4m#{unmodString}\e[24m" end
    def italic (unmodString); "\e[3m#{unmodString}\e[23m" end

    def showUsage(licenseLocation)
      puts " "
      puts underline(bold("PLEASE READ"))
      puts "Full usage license information can be found in the directory #{licenseLocation}"
      puts "If you don't accept these license terms please unistall by running"
      puts italic("brew uninstall ibm-messaging/ibmmq/mqdevtoolkit")
      puts 
    end

    def showPostSteps
      puts
      puts bold("Post Install") 
      puts "Add locations of the bin directories /opt/mqm/bin and /opt/mqm/samp/bin" 
      puts "to the PATH by editing /etc/paths"
      puts "Set the DYLD_LIBRARY_PATH by entering the following on the command line:" 
      puts italic("export DYLD_LIBRARY_PATH=/opt/mqm/lib64")
      puts
    end

    def get_language 
      localInfo = `locale`
      localArray = localInfo.split

      dict = {}
  
      localArray.each {
          |s| 
          pairs = s.scan /^(.+?)=\"(.+?)\"$/ 
          pairs.each {
              |p|
              dict[p[0]] = p[1]
          }
      }
      
      dictEntry = nil
  
      if (! dict["LANG"].nil?) && (! dict["LANG"].empty?)
        dictEntry = dict["LANG"]  
      elsif (! dict["LC_ALL"].nil?) && (! dict["LC_ALL"].empty?)
        dictEntry = dict["LC_ALL"]
      else
        return nill
      end

      langsplit = dictEntry.scan /^(.+?)_(.+?)$/ 
      language = ""
      langsplit.each {
          |l|
          language = l[0]
      }

      return language
    end    

    def valid_language?(language)
      validLanguages = ["cs","de","el","en","es","fr",
                          "in", "it", "ja", "ko", "lt",
                          "pl","pt","ru","sl","tr",
                          "zh"]
      return validLanguages.include? language
    end

    def determine_language
      language = get_language
      if language.nil?
          puts "Unable to determine language"
          puts "Defaulting to English"
          language = "en"
      end
  
      unless valid_language?(language) 
          puts "invalid language found"
          language = "en"
      end

      return language
    end    

    def build_lic_filename
      language = determine_language
      licFile = "LA_" + language    
      return licFile
    end    

    def show_license(licenseLocation)
      licFile = build_lic_filename
  
      cmd = "head -7 #{licenseLocation}#{licFile}"
      system cmd  
  
      if "LA_zh" == licFile
          licFile = "LA_zh_TW"
          cmd = "head #{licenseLocation}#{licFile}"
          system(cmd)  
      end
      puts " "
      puts " ...... "
      puts " "
    end

    def checkOSArch
      if "arm64" != `uname -m`.strip
        puts
        puts bold("NOTE: This release contains only ARM64 binaries.")
        puts  
      end
    end  

    licenseLocation = "/opt/mqm/licenses/"

    show_license(licenseLocation)
    showUsage(licenseLocation)
    showPostSteps
    checkOSArch
  end

end
