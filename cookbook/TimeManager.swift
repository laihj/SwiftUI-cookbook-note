//
//  TimeManager.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import Foundation

class TimerManager: ObservableObject {
  @Published var timerCount = 0
  private var timer = Timer()

  func start() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      self.timerCount += 1
    }
  }

  func stop() {
    timer.invalidate()
  }
}
