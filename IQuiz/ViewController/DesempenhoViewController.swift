//
//  DesempenhoViewController.swift
//  IQuiz
//
//  Created by APL20 on 12/11/23.
//

import UIKit

class DesempenhoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configurarDesempenho()
        // Do any additional setup after loading the view.
    }
    
    var pontuacao: Int?
    
    @IBOutlet weak var ResultadoLabel: UILabel!
    
    @IBOutlet weak var PercentualLabel: UILabel!
    
    @IBOutlet weak var BotaoReiniciarQuiz: UIButton!
    
    func configurarLayout(){
        navigationItem.hidesBackButton = true
        BotaoReiniciarQuiz.layer.cornerRadius = 12.0
    }
    
    func configurarDesempenho(){
        guard let pontuacao = pontuacao else {return }
        ResultadoLabel.text = "Você acertou \(pontuacao) de \(questoes.count) questões"
        
        let percentual = (pontuacao * 100) / questoes.count
        
        PercentualLabel.text = "Percentual final: \(percentual)%"
    }
    
    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
