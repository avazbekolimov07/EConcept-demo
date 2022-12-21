//
//  Alert.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//
import UIKit
import AudioToolbox
let screenSize = UIScreen.main.bounds


class Alert {

    static let screenSize = UIScreen.main.bounds

    enum AlertType {
        case warning
        case unknown
        case success
        case error
    }


    static var timer : Timer? = nil


    class func showAlert(state: AlertType, message: String, duration: TimeInterval = 3, serInteration: Bool = true) {

        let view = UIView(frame: CGRect(x: 0, y: screenSize.height+100, width: screenSize.width-28, height: 50))
        view.center = CGPoint(x: screenSize.width/2, y: screenSize.height+100)


        view.layer.cornerRadius = 12
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.2

        let icon = UIImageView()
        icon.image = UIImage(named: "info")
        icon.tintColor = .white

        view.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        icon.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        icon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        icon.heightAnchor.constraint(equalTo: icon.widthAnchor, multiplier: 1.0).isActive = true

        let titleLbl = UILabel(frame: view.frame)

        titleLbl.textColor = .white
        titleLbl.minimumScaleFactor = 0.7
        titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.textAlignment = .center

        titleLbl.numberOfLines = 2
        titleLbl.font = UIFont(name: "SFProText-Medium", size: 14)
        view.addSubview(titleLbl)

        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        titleLbl.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 15).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true

        view.tag = 1999

        view.backgroundColor = .black


        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(1999) {
                timer?.invalidate()
                vi.removeFromSuperview()
            }
            window.addSubview(view)
        }

        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            view.transform = CGAffineTransform(translationX: 0, y: -200)
        })


        let closeBtn = UIButton()
        closeBtn.backgroundColor = .clear
        closeBtn.setImage(UIImage(named: "close"), for: .normal)
        closeBtn.tintColor = .white
        closeBtn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        closeBtn.layer.cornerRadius = 15
        closeBtn.layer.borderWidth = 1
        closeBtn.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        view.addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)

        titleLbl.text = message

        switch state {
        case .warning:
            view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.6980392157, blue: 0, alpha: 1)
            icon.image = UIImage(named: "warning_icon")
        case .error:
            view.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.4235294118, blue: 0.4, alpha: 1)
            icon.image = UIImage(named: "error_icon")
        case .success:
            view.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.6980392157, blue: 0.5529411765, alpha: 1)
            icon.image = UIImage(named: "success_icon")
        case .unknown:
            icon.image = UIImage(named: "unknown_icon")
            view.backgroundColor = #colorLiteral(red: 0, green: 0.5333333333, blue: 0.8, alpha: 1)
        }

        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(Alert.closeBtnPressed), userInfo: nil, repeats: false)



    }

    @objc class func closeBtnPressed() {
        if let window = UIApplication.shared.keyWindow, let view = window.viewWithTag(1999) {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
                view.transform = CGAffineTransform(translationX: 0, y: -view.frame.height)
            }) { (_) in
                view.removeFromSuperview()
            }
        }
    }

}
