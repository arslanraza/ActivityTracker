platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'ActivityTracker' do
  
  # Pods for ActivityTracker
  pod 'SDWebImage', '~> 4.0'
  
  target 'ActivityTrackerTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
  
  target 'ATNetworkTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
  
end



