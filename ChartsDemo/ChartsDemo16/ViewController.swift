//
//  ViewController.swift
//  ChartsDemo16
//
//  Created by 南鑫林 on 2018/9/11.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts
//Swift - 第三方图表库Charts使用详解17（散点图）
class ViewController: UIViewController {

    //散点图
    var chartView : ScatterChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建散点图组件对象
        chartView = ScatterChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,height: 260)
        self.view.addSubview(chartView)
        
        //第一组散点图的10条随机数据
        let dataEntries1 = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(100) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let chartDataSet1 = ScatterChartDataSet(values: dataEntries1, label: "图例1")
        //修改散点的大小
//        chartDataSet1.scatterShapeSize = 5
        //设置散点中心部分的颜色和大小
        chartDataSet1.scatterShapeHoleColor = .orange
        chartDataSet1.scatterShapeHoleRadius = 2.5
        //散点的样式
        chartDataSet1.setScatterShape(.circle) //使用圆形散点
        
        //第二组散点图的10条随机数据
        let dataEntries2 = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(100) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let chartDataSet2 = ScatterChartDataSet(values: dataEntries2, label: "图例2")
        chartDataSet2.setColor(.orange) //第二组数据使用橙色
        
        //目前散点图包括2组数据
        let chartData = ScatterChartData(dataSets: [chartDataSet1, chartDataSet2])
        
        //设置散点图数据
        chartView.data = chartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

