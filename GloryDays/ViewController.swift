//
//  ViewController.swift
//  GloryDays
//
//  Created by Cristhian Parrales on 13/5/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import UIKit

import AVFoundation
import Photos
import Speech



class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askForPermissions(_ sender: UIButton) {
            self.askForPhotosPermissions()
    }
    
    func askForPhotosPermissions() {
        PHPhotoLibrary.requestAuthorization { [unowned self] (authStatus) in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.askForRecordPermissions()
                } else {
                    self.infoLabel.text = "Nos has denegado el permiso de fotos. Por favor, activalo en los Ajustes de tu dispositivo para continuar"
                }
            }
        }
    }
    
    func askForRecordPermissions() {
        AVAudioSession.sharedInstance().requestRecordPermission { [unowned self] (allow) in
            DispatchQueue.main.async {
                if allow {
                    self.askForTranscriptionPermissions()
                } else {
                    self.infoLabel.text = "Nos has denegado el permiso de grabacion de audio. Por favor, activalos en los Ajustes de tu dispositivo para continuar"
                }
            }
        }
    }
    
    func askForTranscriptionPermissions() {
        SFSpeechRecognizer.requestAuthorization { [unowned self] (authStatus) in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.authorizationCompleted()
                } else {
                    self.infoLabel.text = "Nos has denegado el permiso de trnascripcion de texto. Por favor, activalo en los Ajustes de tu dispositivo para continuar"
                }
            }
        }
    }
    
    func authorizationCompleted() {
        dismiss(animated: true, completion: nil)
    }


}










































