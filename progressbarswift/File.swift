import UIKit
class CustomProgressBar: UIView {
    private var progressBarLayer: CALayer!
    var progress: CGFloat = 0 {
        didSet {
            updateProgressBar()
        }
    }
    var progressColor: UIColor = .blue {
        didSet {
            progressBarLayer.backgroundColor = progressColor.cgColor
        }
    }
    override var backgroundColor: UIColor? {
        didSet {
            self.layer.backgroundColor = backgroundColor?.cgColor
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressBar()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProgressBar()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        progressBarLayer.frame = CGRect(x: 0, y: 0, width: bounds.width * progress, height: bounds.height)
        progressBarLayer.cornerRadius = bounds.height / 2
    }
    private func setupProgressBar() {
        progressBarLayer = CALayer()
        layer.addSublayer(progressBarLayer)
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
    private func updateProgressBar() {
        progressBarLayer.frame = CGRect(x: 0, y: 0, width: bounds.width * progress, height: bounds.height)
    }
}
