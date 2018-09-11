//
//  ThreeViewController.swift
//  ChartsDemo15
//
//  Created by 南鑫林 on 2018/9/10.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

class ThreeViewController: UIViewController {

    //柱状图图
    var chartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        //创建折线图组件对象
        chartView = BarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        //文字显示在柱子内部
        chartView.drawValueAboveBarEnabled = false
        self.view.addSubview(chartView)
        
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            //每个柱子由两部分数据组成
            let value1 = Double(arc4random()%100)
            let value2 = -Double(arc4random()%100)
            let entry = BarChartDataEntry(x: Double(i), yValues: [value1, value2])
            dataEntries.append(entry)
        }
        
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "每日交易")
        //堆叠柱形图每部分文字标签
        chartDataSet.stackLabels = ["收入", "支出"]
        //堆叠柱形图每部分使用的颜色
        chartDataSet.colors = [ChartColorTemplates.material()[0],
                               ChartColorTemplates.material()[1]]
        
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        //标签文字颜色为白色
        chartData.setValueTextColor(.white)
        
        //设置柱状图数据
        chartView.data = chartData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
