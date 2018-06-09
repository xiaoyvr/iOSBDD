import Quick
import Nimble

@testable import iOSBDD

//class MockLoginPresenter: LoginPresenterProtocol {
//
//    var shouldShowNextPage: Bool = false
//    var result: ValidatorResult = .success
//
//    func showError(validationResult: ValidatorResult) {
//        result = validationResult
//    }
//
//    func showNextPage() {
//        shouldShowNextPage = true
//    }
//}
//
//class MockLoginViewController1: LoginView {
//
//    var errorMsg: String = ""
//    var didShowNextPage: Bool = false
//
//    func showError(_ error: String) {
//        errorMsg = error
//    }
//
//    func showNextPage() {
//        didShowNextPage = true
//    }
//}

class LoginController {
    private let view: LoginView

    init(view: LoginView) {
        self.view = view
    }

    func login(userName: String, password: String) {
        let userNameResult = validateUserName(userName)
        if userNameResult.state != .success {
            view.showError(userNameResult.message)
            return
        }
        let passwordResult = validatePassword(password)
        if passwordResult.state != .success {
            view.showError(passwordResult.message)
            return
        }

        view.showNextPage()
    }

    private func validateUserName(_ userName: String) -> ValidationResult {
        return ValidationResult(state: ValidatorResult.success, message: "")
    }
    private func validatePassword(_ password: String) -> ValidationResult {
        return ValidationResult(state: ValidatorResult.success, message: "")
    }
}

struct ValidationResult{
    let state: ValidatorResult
    let message: String
}


class LoginControllerSpec: QuickSpec {
    override func spec() {

        var viewController: MockLoginViewController!

        beforeEach {
            viewController = MockLoginViewController()
        }

        it("should show next page when user name and password are both valid") {
            let controller = LoginController(view: viewController)

            controller.login(userName: "John X", password: "1234")

            expect(viewController.didShowNextPage).to(beTrue())
        }

        it("should show user name error") {
            let controller = LoginController(view: viewController)

            controller.login(userName: "Jo", password: "1234")

            expect(viewController.errorMsg).to(equal("User Name Error"))
            expect(viewController.didShowNextPage).to(beFalse())
        }
    }
}
