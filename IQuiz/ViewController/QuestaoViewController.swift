//
//  QuestaoViewController.swift
//  IQuiz
//
//  Created by APL20 on 12/11/23.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var TituloQuestaoLabel: UILabel!
    @IBOutlet var BotoesResposta: [UIButton]!
    
    @IBAction func RespostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertou = questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertou {
            pontuacao += 1
            sender.backgroundColor = UIColor.corDeFundoVerde
        }else{
            sender.backgroundColor = UIColor.corDeFundoVermelho
        }

        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            
            Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
           
        }else{
            navegaParaTelaDesempenho()
        }
       
    }
    
    func navegaParaTelaDesempenho(){
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout(){
        navigationItem.hidesBackButton  = true
        TituloQuestaoLabel.numberOfLines = 0
        TituloQuestaoLabel.textAlignment = .center
        for botoes in BotoesResposta {
            botoes.layer.cornerRadius = 12.0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else { return }
                desempenhoVC.pontuacao = pontuacao
    }
    
    @objc func configurarQuestao() {
        TituloQuestaoLabel.text = questoes[numeroQuestao].titulo

        for botao in BotoesResposta {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao,for: .normal)
            botao.backgroundColor = UIColor.cordeDeFuncdoRoxo
        }
    }
}
