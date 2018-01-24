//
//  ServerManager.swift
//  HXServer
//
//  Created by hongbaodai on 2018/1/11.
//  Copyright © 2018年 wang. All rights reserved.
//

import Cocoa

class ServerManager : NSObject {
    fileprivate lazy var serverSocket :TCPServer = TCPServer(addr: "0.0.0.0", port: 7878)
    fileprivate var isServerRunning : Bool = false
    
    fileprivate lazy var clientMrgs : [ClientManager]  = [ClientManager]()
    
    
    
}

extension ServerManager {
    func startRunning() {
        
        serverSocket.listen()
        isServerRunning = true
        
        // 开始接受客户端
        DispatchQueue.global().async {
            while self.isServerRunning {
                if let client = self.serverSocket.accept() {
                    print("接受到  一个客户端连接")
                    DispatchQueue.global().async {
                        self.handlerClient(client)
                    }
                }
                
            }
        }
        
    }
    
    func stopRunning() {
        isServerRunning = false
    }
}

extension ServerManager {
    fileprivate func handlerClient(_ client : TCPClient) {
       
        // 1.用一个ClientManager管理TCPClient
        let mgr = ClientManager(tcpClient: client)
        mgr.delegate = self
        // 2.保存客户端
        clientMrgs.append(mgr)
        // 3.用client开始接受消息
        mgr.startReadMsg()
//        mgr.statrtreadmsg()
    }
}

extension ServerManager : ClientManagerDelegate {
    func sendMsgToClient(_ data: Data) {
        for mgr in clientMrgs {
            mgr.tcpClient.send(data: data)
        }
    }
    func removeClient(_ client: ClientManager) {
        guard let index = clientMrgs.index(of: client) else {return}
        clientMrgs.remove(at: index)
    }
}

