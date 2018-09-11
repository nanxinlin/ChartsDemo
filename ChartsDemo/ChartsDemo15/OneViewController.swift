//
//  OneViewController.swift
//  ChartsDemo15
//
//  Created by 南鑫林 on 2018/9/10.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts


class OneViewController: UIViewController {
    //柱状图图
    var chartView: BarChartView!
    
    //每个分组之间的间隔
    let groupSpace = 0.31
    
    //同一分组内柱子间隔
    let barSpace = 0.03
    
    //柱子宽度（ (0.2 + 0.03) * 3 + 0.31 = 1.00 -> interval per "group"）
    let barWidth = 0.2
    
    //每组数据条数
    let groupCount = 5
    
    //x轴标签文字
    let years = ["2001", "2002", "2003", "2004", "2005"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //创建折线图组件对象
        chartView = BarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        //第一组数据
        var dataEntries1 = [BarChartDataEntry]()
        for i in 0..<groupCount {
            let y = arc4random()%100 + 50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "图例1")
        
        //第二组数据
        var dataEntries2 = [BarChartDataEntry]()
        for i in 0..<groupCount {
            let y = arc4random()%50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        let chartDataSet2 = BarChartDataSet(values: dataEntries2, label: "图例2")
        chartDataSet2.colors = [.orange]
        
        //第三组数据
        var dataEntries3 = [BarChartDataEntry]()
        for i in 0..<groupCount {
            let y = arc4random()%50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries3.append(entry)
        }
        let chartDataSet3 = BarChartDataSet(values: dataEntries3, label: "图例3")
        chartDataSet3.colors = [.green]
        
        //目前柱状图包括2组立柱
        let chartData = BarChartData(dataSets: [chartDataSet1, chartDataSet2,
                                                chartDataSet3])
        
        //设置柱子宽度
        chartData.barWidth = barWidth
        
        //对数据进行分组（不重叠显示）
        chartData.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)
        
        //设置X轴范围
        chartView.xAxis.axisMinimum = Double(0)
        chartView.xAxis.axisMaximum = Double(0) + chartData
            .groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
        chartView.xAxis.centerAxisLabelsEnabled = true  //文字标签居中
        chartView.xAxis.granularity = 1
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:self.years)
        
        //设置y轴范围
        chartView.leftAxis.axisMinimum = 0
        chartView.rightAxis.axisMinimum = 0
        
        //设置柱状图数据
        chartView.data = chartData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
