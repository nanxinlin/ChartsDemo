//
//  ViewController.swift
//  ChartsDemo12
//
//  Created by 南鑫林 on 2018/9/6.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    var chartView : LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //创建折线图组件对象
        chartView = LineChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 250)
        self.view.addSubview(chartView)
        
        //生成20条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<20 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这50条数据作为1根折线里的所有数据
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "图例1")
        //使用绿色作为折线线条颜色
        chartDataSet.colors = [ChartColorTemplates.colorful()[3]]
        //1）ChartColorTemplates.liberty()
        //2）ChartColorTemplates.joyful()
        //3）ChartColorTemplates.pastel()
        //4）ChartColorTemplates.colorful()
        //5）ChartColorTemplates.material()
        chartDataSet.colors = ChartColorTemplates.pastel() + ChartColorTemplates.material()
        //1，使用 # 开头的十六进制颜色
        let color = ChartColorTemplates.colorFromString("#FF0000")
        chartDataSet.colors = [color]
        //2，使用 RGB 格式的颜色
        let color1 = ChartColorTemplates.colorFromString("rgb(245,252,120)")
        chartDataSet.colors = [color1]
        //3，使用 RGBA 格式的颜色
        let color2 = ChartColorTemplates.colorFromString("rgba(100,252,50,0.5)")
        chartDataSet.colors = [color2]
        //4，使用 ARGB 格式的颜色
        let color3 = ChartColorTemplates.colorFromString("argb(0.5,100,252,50)")
        chartDataSet.colors = [color3]
        //目前折线图只包括1根折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        //设置折现图数据
        chartView.data = chartData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

