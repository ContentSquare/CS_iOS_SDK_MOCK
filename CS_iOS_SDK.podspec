Pod::Spec.new do |s|
s.name = 'CS_iOS_SDK'
s.version = '4.43.0'
s.summary = 'Contentsquare UX SDK for iOS'
s.homepage = 'https://docs.contentsquare.com/ios'
s.author = { 'Romain Bouic' => 'romain.bouic@contentsquare.com' }
s.license = { :type => 'COMMERCIAL', :text => <<-LICENSE
                The Content Square iOS SDK License 1.0
                    (c) Content Square SAS 2023

By downloading, installing, implementing or otherwise using the Content Square SAS iOS SDK (“the Contentsquare iOS SDK”) you agree to the terms and conditions of this License Agreement.

Contentsquare grants you a limited, royalty-free, non-exclusive, non-transferrable, non-sublicensable, revocable copyright license to use and reproduce, without modification, the Contentsquare iOS SDK solely to enable the use of Contentsquare with or in your iOS platform applications, subject to the following conditions:

Other than as permitted in this agreement, you may not distribute, display, copy, execute publicly, make available to the public, reduce to human readable form, lease, resale, disassemble, decompile, adapt, sublicense, host as a service, make other commercial use of, sell, rent, lend, process, compile, reverse engineer, combine with other software, translate, modify, or create derivative works of the Contentsquare iOS SDK.

Contentsquare has no obligation to enable you or any of your applications to access, interact with, or retrieve or publish content to any Contentsquare platform or service. However, Contentsquare may provide you with such platform services on additional terms.

Contentsquare further has no obligation to provide support, maintenance, upgrades, modifications, or new releases of the Contentsquare iOS SDK, unless otherwise agreed in writing.

All other rights are reserved.

TO THE FULLEST EXTENT PERMITTED BY LAW, CONTENTSQUARE MAKES NO, AND HEREBY DISCLAIMS ANY AND ALL, REPRESENTATIONS WARRANTIES, CONDITIONS AND ALL OTHER TERMS OF ANY KIND WHATSOEVER WITH RESPECT TO THE CONTENTSQUARE iOS SDK AND RELATED DOCUMENTATION, OR ADDITIONAL SERVICES, WHETHER EXPRESS OR IMPLIED, ORAL OR WRITTEN, INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OF ACCURACY, QUALITY, PERFORMANCE, MERCHANTABILITY, NONINFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE. FOR THE AVOIDANCE OF DOUBT, CONTENTSQUARE DOES NOT WARRANT THAT THE CONTENTSQUARE iOS SDK SHALL MEET YOUR NEEDS OR BE ERROR FREE. IN NO EVENT SHALL CONTENTSQUARE BE LIABLE FOR ANY TYPE OF DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THE CONTENTSQUARE iOS SDK, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. YOU ASSUME SOLE RESPONSIBILITY FOR RESULTS OBTAINED FROM THE USE OF THE CONTENTSQUARE iOS SDK BY YOU. THE CONTENTSQUARE iOS SDK, SCRIPTS, OR ADDITIONAL SERVICES ARE PROVIDED TO YOU ON AN “AS IS” BASIS.
LICENSE
}
s.platform = :ios
s.swift_version = '5.1'
s.ios.deployment_target = '12.0'
s.ios.vendored_frameworks = 'ContentsquareModule.xcframework'
s.source = { :http => 'https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.43.0/ContentsquareModulePodDynamic.xcframework.zip' }
s.dependency 'CSSwiftProtobuf', '1.28.2'
s.dependency 'CSCrashReporter', '1.0.1'
end