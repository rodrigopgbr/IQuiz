//
//  ViewController.swift
//  IQuiz
//
//  Created by APL20 on 08/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Botao: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configuraLayout()
    }

    @IBAction func BotaoPressionado(_ sender: Any) {
        print("Botão pressionado")
    }
    
    func configuraLayout(){
        navigationItem.hidesBackButton = true
        Botao.layer.cornerRadius = 12.0
        
    }
    
    
}

