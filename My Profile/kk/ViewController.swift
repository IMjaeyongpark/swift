//
//  ViewController.swift
//  Intro
//
//  Created by 박재용 on 2022/12/25.
//

import UIKit
import SafariServices

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: false, completion: {
                DispatchQueue.main.async {
                    self.user_image.image = image
                }
            })
        }
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var user_image : UIImageView!
    @IBOutlet weak var git_linkimage : UIImageView!
    @IBOutlet weak var insta_linkimage : UIImageView!
    @IBOutlet weak var sol_linkimage : UIImageView!
    @IBOutlet weak var myTextView : UITextView!
    @IBOutlet weak var sView : UIView!
    @IBOutlet weak var back_image : UIImageView!
    @IBOutlet weak var user_name : UILabel!
    @IBOutlet weak var text_view : UITextView!
    @IBOutlet weak var camera : UIButton!
    
    let picker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var vc = storyBoard.instantiateViewController(withIdentifier: "Lock") as! LockViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        }
        
        
        /*
        //사진 둥글게
        user_image.layer.cornerRadius = user_image.frame.height/2
        user_image.layer.borderWidth = 1
        user_image.clipsToBounds = true
        user_image.layer.borderColor = UIColor.clear.cgColor
         */
         /*선그리기
        var lineView = UIView(frame: CGRect(x: 0, y: 343, width: self.view.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor.gray
        self.view.addSubview(lineView)
          */
        
        //그림자 효과
        sView.layer.shadowColor = UIColor.black.cgColor
        /// 현재 shadow는 view의 layer 테두리와 동일한 위치로 있는 상태이므로 offset을 통해 그림자를 이동시켜야 표출
        sView.layer.shadowOffset = CGSize(width: 0, height: 4)
        /// shadow의 투명도 (0 ~ 1)
        sView.layer.shadowOpacity = 0.4
        /// shadow의 corner radius
        sView.layer.shadowRadius = 5.0
        
        back_image.layer.opacity = 0.7
        
        //테두리
        sView.layer.borderColor = UIColor.gray.cgColor
        sView.layer.borderWidth = 0.5
        
        sol_linkimage.layer.borderColor = UIColor.black.cgColor
        sol_linkimage.layer.borderWidth = 0.1
        
        insta_linkimage.layer.borderColor = UIColor.black.cgColor
        insta_linkimage.layer.borderWidth = 0.1
        
        camera.layer.borderColor = UIColor.black.cgColor
        camera.layer.borderWidth = 0.1
        
        user_image.layer.borderColor = UIColor.black.cgColor
        user_image.layer.borderWidth = 0.3
        
        text_view.layer.borderColor = UIColor.gray.cgColor
        text_view.layer.borderWidth = 0.3
        
        
        //모서리 둥글게
        camera.layer.cornerRadius = 20
        user_image.layer.cornerRadius = 50
        myTextView.layer.cornerRadius = 10
        sol_linkimage.layer.cornerRadius = 10
        insta_linkimage.layer.cornerRadius = 10
        user_name.layer.cornerRadius = 10
        
        //사진에 터치액션
        user_image.isUserInteractionEnabled = true
        self.user_image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchImage)))
        
        back_image.isUserInteractionEnabled = true
        self.back_image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchImage2)))
        
        git_linkimage.isUserInteractionEnabled = true
        self.git_linkimage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchUpToLinkTogit)))
        
        insta_linkimage.isUserInteractionEnabled = true
        self.insta_linkimage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchUpToLinkTointsta)))
        
        sol_linkimage.isUserInteractionEnabled = true
        self.sol_linkimage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchUpToLinkTosol)))
        
        
    }
    
    @IBAction func touchCamera(_ sender: Any) {

    let alert =  UIAlertController(title: "프로필 사진 설정", message: nil, preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default){(action) in
            self.picker.delegate = self
            self.picker.sourceType = .photoLibrary
            self.picker.modalPresentationStyle = .fullScreen
            self.present(self.picker, animated: true, completion: nil)
            
        }

        let camera =  UIAlertAction(title: "카메라", style: .default){(action) in

        }


    let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

    alert.addAction(library)
    alert.addAction(camera)
    alert.addAction(cancel)
        
    present(alert, animated: true, completion: nil)
    }
    
    //사파리로 url연결
    @objc func touchUpToLinkTogit(_ sender: UIButton) {
        let githubUrl = NSURL(string: "https://github.com/IMjaeyongpark")
        let githubSafariView: SFSafariViewController = SFSafariViewController(url: githubUrl as! URL)
        self.present(githubSafariView, animated: true, completion: nil)
    }
    
    @objc func touchUpToLinkTointsta(_ sender: UIButton) {
        let instaUrl = NSURL(string: "https://instagram.com/i_m_jaeyong")
        let instaSafariView: SFSafariViewController = SFSafariViewController(url: instaUrl as! URL)
        self.present(instaSafariView, animated: true, completion: nil)
    }
    
    @objc func touchUpToLinkTosol(_ sender: UIButton) {
        let solUrl = NSURL(string: "https://solved.ac/profile/jaeyong36")
        let solSafariView: SFSafariViewController = SFSafariViewController(url: solUrl as! URL)
        self.present(solSafariView, animated: true, completion: nil)
    }
    
    //viewcontroller 생성
    @objc func touchImage(_ sender: UITapGestureRecognizer){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "BigImage") as! ImageViewController
        vc.dataReceived = user_image.image
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func touchImage2(_ sender: UITapGestureRecognizer){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "BigImage") as! ImageViewController
        vc.dataReceived = back_image.image
        self.present(vc, animated: true, completion: nil)
    }
    
}
