import UIKit
import SnapKit
class ViewController: UIViewController {
    var progressBar = CustomProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
    let changebtn: UIButton = {
        let button = UIButton()
        button.setTitle("Fill", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(change), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScene()
    }
}
private extension ViewController {
    @objc func change() {
        if progressBar.progress == 1 {
            progressBar.progress = 0
        } else {
            progressBar.progress = 1
        }
    }
    func setupScene() {
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(10)
        }
        view.addSubview(changebtn)
        changebtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(progressBar.snp.bottom).offset(20)
        }
        progressBar.progressColor = .blue
        progressBar.backgroundColor = .lightGray
    }
}
