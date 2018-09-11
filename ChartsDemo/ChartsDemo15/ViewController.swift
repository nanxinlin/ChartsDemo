//
//  ViewController.swift
//  ChartsDemo15
//
//  Created by 南鑫林 on 2018/9/10.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts


/// 第三方图表库Charts使用详解16（柱状图3：多组数据的显示）
class ViewController: UIViewController {

//    1，多组数据相互覆盖
//    （1）效果图
//    下面是一个包含有两组数据的柱状图。
//    各组中 x 坐标一样的柱子会重叠在一起（后面覆盖前面的）。
//
    
    var chartView : BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建柱状图组件对象
        chartView = BarChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                  height: 260)
        self.view.addSubview(chartView)
        
        //第一组数据
        
        var dataEntries1 = [BarChartDataEntry]()
        
        for i in 0..<10 {
            let y = arc4random()%100 + 50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "图例1")
        
        //第二组数据
        var dataEntries2 = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        let chartDataSet2 = BarChartDataSet(values: dataEntries2, label: "图例2")
        chartDataSet2.colors = [.orange]
        
        //目前柱状图包括2组立柱
        let chartData = BarChartData(dataSets: [chartDataSet1, chartDataSet2])
        
        //设置柱状图数据
        chartView.data = chartData
        
    }
    @IBAction func OneAction(_ sender: UIButton) {
        self.present(OneViewController(), animated: true, completion: nil)
    }
    @IBAction func TwoAction(_ sender: UIButton, forEvent event: UIEvent) {
        self.present(TwoViewController(), animated: true, completion: nil)

    }
    
    @IBAction func three(_ sender: UIButton, forEvent event: UIEvent) {
        self.present(ThreeViewController(), animated: true, completion: nil)

    }
    @IBAction func fourAction(_ sender: UIButton, forEvent event: UIEvent) {
        self.present(FourViewController(), animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

