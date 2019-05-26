import Foundation

class LandingPresenter {
  var view: LandingViewable?

  init(view: LandingViewable) {
    self.view = view
  }
}

extension LandingPresenter: LandingPresentable {
  
}
