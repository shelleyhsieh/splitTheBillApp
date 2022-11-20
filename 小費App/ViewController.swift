//
//  ViewController.swift
//  小費App
//
//  Created by shelley on 2022/11/17.
//

import UIKit

class ViewController: UIViewController {
// 金額、小費、人數，textfield設定clear botton改為is always visible(永遠顯示清除鍵),keyboard type 改為number tap
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var memberTextField: UITextField!
    
    @IBOutlet weak var totalPriceLable: UILabel!
    @IBOutlet weak var totalTipsLable: UILabel!
    @IBOutlet weak var averagePriceLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//  輸入的文字大小
        priceTextField.font = UIFont.systemFont(ofSize: 24)
        tipTextField.font = .systemFont(ofSize: 24)
        memberTextField.font = .systemFont(ofSize: 24)
//  設定提示語，皆有min font size，當字數太多縮小到適當的顯示大小
        priceTextField.placeholder = "請輸入金額"
        tipTextField.placeholder = "請輸入服務費/小費比率"
        memberTextField.placeholder = "請輸入人數"
//  計算後數值設為0，並置中
        totalPriceLable.text = "0"
        totalPriceLable.textAlignment = NSTextAlignment.center
        totalTipsLable.text = "0"
        totalTipsLable.textAlignment = .center
        averagePriceLable.text = "0"
        averagePriceLable.textAlignment = .center
    }


    @IBAction func priceCaculate(_ sender: UIButton) {
//  三個輸入匡的鍵盤收起來
        
        priceTextField.resignFirstResponder()
        tipTextField.resignFirstResponder()
        memberTextField.resignFirstResponder()
         
//  對話框沒有填寫時為0
        if priceTextField.text == "" || tipTextField.text == "" || memberTextField.text == "" {
            totalPriceLable.text = "0"
            tipTextField.text = "0"
            memberTextField.text = "0"
        }else{
            let tip = Double(priceTextField.text!)! * Double(tipTextField.text!)! / 100
            let total = Double(priceTextField.text!)! + tip
            let share = total / Double(memberTextField.text!)!
            
            totalPriceLable.text = String(total)
            totalTipsLable.text = String(tip)
            averagePriceLable.text = String(share)
        }
    }
    
    @IBAction func reCaculate(_ sender: Any) {
        priceTextField.text = ""
        tipTextField.text = ""
        memberTextField.text = ""
        totalPriceLable.text = "0"
        totalTipsLable.text = "0"
        averagePriceLable.text = "0"
    }
    
}

