//
//  ViewController.swift
//  ChartsDemo14
//
//  Created by 南鑫林 on 2018/9/8.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    //柱状图图
    var chartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建折线图组件对象
        chartView = BarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = Double(arc4random() % 100) - 50
            let entry = BarChartDataEntry(x: Double(i), y: y)
            dataEntries.append(entry)
        }
        
        //根据正负值生成每个立柱使用的颜色
        let red = UIColor(red: 211/255, green: 74/255, blue: 88/255, alpha: 1)
        let green = UIColor(red: 110/255, green: 190/255, blue: 102/255, alpha: 1)
        let colors = dataEntries.map { (entry) -> NSUIColor in
            return entry.y > 0 ? green : red
        }
        
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "图例1")
        //设置颜色
        chartDataSet.colors = colors
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        //设置柱状图数据
        chartView.data = chartData
        // Do any additional setup after loading the view, typically from a nib.
    }

    /// 横向条形图
    ///
    /// - Parameter sender: button
    @IBAction func oneAction(_ sender: Any) {
        self.present(OneViewController(), animated: true, completion: nil)
    }
    @IBAction func twoAction(_ sender: Any) {
        self.present(TwoViewController(), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

