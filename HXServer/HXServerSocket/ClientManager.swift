//
//  ClientManager.swift
//  HXServer
//
//  Created by hongbaodai on 2018/1/11.
//  Copyright © 2018年 wang. All rights reserved.
//

import Cocoa

protocol ClientManagerDelegate : class {
    func sendMsgToClient(_ data : Data)
    func removeClient(_ client : ClientManager)
}

class ClientManager: NSObject {
    var tcpClient : TCPClient
    
    weak var delegate : ClientManagerDelegate?
    
    fileprivate var isClientConnected : Bool = false
    fileprivate var heartTimeCount : Int = 0
    
    init(tcpClient : TCPClient) {
        self.tcpClient = tcpClient
    }
}

extension ClientManager {
    
    func startReadMsg() {
        isClientConnected = true
        let timer = Timer(fireAt: Date(), interval: 1, target: self, selector: #selector(checkHeartBeat), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .commonModes)
        timer.fire()
        
        while isClientConnected {
            if let lMsg = tcpClient.read(4) {
                // 1：读取整个data 长度 的data
                let headData = Data(bytes: lMsg, count: 4)
                var length : Int = 0
                (headData as NSData).getBytes(&length, length: 4)
                
                // 2：读取类型
                guard let typeMsg = tcpClient.read(2) else {
                    return
                }
                let typeData = Data(bytes: typeMsg, count: 2)
                var type : Int = 0
                (typeData as NSData).getBytes(&type, length: 2)
                
                // 根据长度 读取真实的消息
                guard let message = tcpClient.read(length) else {
                    return
                }
                let data = Data(bytes: message, count: length)
                let msgStirng = String(data: data, encoding: .utf8)
                print(msgStirng ?? "123")
                
                if type == 1 {
                    tcpClient.close()
                    delegate?.removeClient(self)
                } else if type == 100 {
                    heartTimeCount = 0
                    continue
                }
                
                let totalData = headData + typeData + data
//                let totalData = headData + data
                delegate?.sendMsgToClient(totalData)
                
            } else {
                self.removeClient()
               
            }
        }
    }
    
    @objc fileprivate func checkHeartBeat() {
        heartTimeCount += 1
        if heartTimeCount >= 10 {
            self.removeClient()
        }
    }
    
    private func removeClient() {
        delegate?.removeClient(self)
        isClientConnected = false
        print("客户端断开了连接")
        tcpClient.close()
    }
}
