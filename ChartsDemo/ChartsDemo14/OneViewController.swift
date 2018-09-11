//
//  OneViewController.swift
//  ChartsDemo14
//
//  Created by 南鑫林 on 2018/9/8.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

class OneViewController: UIViewController {

    //横向柱状图
    var chartView: HorizontalBarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //创建柱状图组件对象
        chartView = HorizontalBarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        //不显示图例
        chartView.legend.enabled = false
        //x轴显示在左侧
        chartView.xAxis.labelPosition = .bottom
        //y轴起始刻度为0
        chartView.leftAxis.axisMinimum = 0
        chartView.rightAxis.axisMinimum = 0
        
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "图例1")
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        //设置柱状图数据
        chartView.data = chartData
        chartView.fitScreen()
    }
}
