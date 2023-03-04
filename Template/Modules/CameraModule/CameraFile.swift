//
//  File.swift
//  Template
//
//  Created by Максим Япринцев on 04.03.2023.
//

import Foundation
import UIKit
import AVFoundation

class BarcodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем сессию захвата
        captureSession = AVCaptureSession()
        // Устанавливаем устройство захвата
                guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
                let videoInput: AVCaptureDeviceInput
                
                do {
                    videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
                } catch {
                    return
                }
                
                if (captureSession.canAddInput(videoInput)) {
                    captureSession.addInput(videoInput)
                } else {
                    return
                }
                
                // Создаем объект вывода метаданных
                let metadataOutput = AVCaptureMetadataOutput()
                
                if (captureSession.canAddOutput(metadataOutput)) {
                    captureSession.addOutput(metadataOutput)
                    
                    // Устанавливаем делегат
                    metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                    
                    // Устанавливаем тип распознавания (штрих-коды)
                    metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
                } else {
                    return
                }
                
                // Создаем слой предпросмотра
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.layer.bounds
                previewLayer.videoGravity = .resizeAspectFill
                view.layer.addSublayer(previewLayer)
                
                // Начинаем захват
                captureSession.startRunning()
            }
            
            // Обработка результата сканирования
            func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
                captureSession.stopRunning()
                
                if let metadataObject = metadataObjects.first {
                    guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                    guard let stringValue = readableObject.stringValue else { return }
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    print(stringValue)
                }
                
                dismiss(animated: true)
    }
}
