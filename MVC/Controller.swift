//
//  MainViewController.swift
//  ArchitectureExamples
//
//  Created by Николай Циминтия on 18.08.2022.
//

import UIKit

class Controller: UIViewController {
    
    // Наше View
    let rootView = View()
    // Наша Model
    let model = Model()
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Добавляем таргет кнопке
        rootView.button.addTarget(self, action: #selector(buttonTaped(sender:)), for: .touchUpInside)
    }
    
    // Получаем уведомление от View о пользовательском взаимодействии
    @objc func buttonTaped(sender: UIButton) {
        // Получаем данные из View
        guard let inputText = rootView.textField.text else {return}
        // Отправляем данные на обработку в Model
        let hashedText = model.hash(inputText)
        // Получаем обработанные данные и изменяем View
        rootView.label.text = hashedText
    }
    

}
