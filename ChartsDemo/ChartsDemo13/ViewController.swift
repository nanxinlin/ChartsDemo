//
//  ViewController.swift
//  ChartsDemo13
//
//  Created by 南鑫林 on 2018/9/7.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController {

    var chartView : BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建柱状图组件对象
        chartView = BarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width, height: 260)
        //开启阴背景阴影绘制
        chartView.drawBarShadowEnabled = true
        //立柱数值文字显示在内部
        chartView.drawValueAboveBarEnabled = false
        self.view.addSubview(chartView)
        
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            var entry : BarChartDataEntry
            //只要值超过80都会带有一个小图标
            if y > 80 {
                entry = BarChartDataEntry(x: Double(i), y: Double(y),
                                          icon: UIImage(named: "icon"))
            } else {
                entry = BarChartDataEntry(x: Double(i), y: Double(y))
            }
            dataEntries.append(entry)
        }
        //这20条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "图例1")
        //全部使用橙色
        chartDataSet.colors = [.orange]
        //三种颜色交替使用
        chartDataSet.colors = [.yellow, .orange, .red]
        chartDataSet.barBorderWidth = 1
        chartDataSet.barBorderColor = .orange
        
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        //设置柱子宽度为刻度区域的一半
        chartData.barWidth = 0.5
        //设置柱状图数据
        chartView.data = chartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

