//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Maryam on 2023-10-29.
//

import UIKit
import AVFoundation


enum CameraError {
    case invalidDeviceInput
    case invalidScannedValue
}





protocol ScannerVCDelegate: class {
    func didFind(barcode: String)
    func didSurrface(error: CameraError)
}

final class ScannerVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate : ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let previewLayer = previewLayer  else {
            scannerDelegate?.didSurrface(error: .invalidDeviceInput)
            return
        }
        previewLayer.frame = view.layer.bounds
    }
    
    
    
    private func setupCaptureSession(){
        // 1- create device - Do we have a device that capturres video??
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else  {
            scannerDelegate?.didSurrface(error: CameraError.invalidDeviceInput)
            return
        } // error handling
        
        // 2- video input
        let videoInput: AVCaptureDeviceInput
        
        // 3- check if we have the input otherwise through an error
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        }catch {
            scannerDelegate?.didSurrface(error: CameraError.invalidDeviceInput)
            return // error handling
        }
        
        // 4- check if the session can get input from the device that we got
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        }else {
            scannerDelegate?.didSurrface(error: CameraError.invalidDeviceInput)
            return  // error handling
        }
        
        // 5- get the data that we captured
        let metaDataOutput = AVCaptureMetadataOutput()
        
        
        // 6- check if the session can get output that we got from scanning
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        }else  {
            scannerDelegate?.didSurrface(error: CameraError.invalidDeviceInput)
            return // error handling
        }
        
        // 7- afterr all the checks to make sure that we can show the preview layer for the camera -->
        // finally show the camera  (preview layer)
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        //add the preview to the view
        view.layer.addSublayer(previewLayer!)
        
        // 8- the last step is to start running the session
        captureSession.startRunning()
        
    }
}


extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // check if we  get the output barcode then get the first one  in the array
        guard let object  = metadataObjects.first else{
            scannerDelegate?.didSurrface(error: .invalidScannedValue)
            return // error handling
        }
        
        // check if the output we get is machine readable
        guard let machineReadableObject  = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurrface(error: .invalidScannedValue)
            return  // error handling
        }
        
        // get the string attached to the barcode
        guard let barcode = machineReadableObject.stringValue else {
            scannerDelegate?.didSurrface(error: .invalidScannedValue)
            return // errror handling
        }
        
        // stop running the capture session if we want to do something with the barcode
        //captureSession.stopRunning()
        // send the barrcode through the delegate method
        scannerDelegate?.didFind(barcode: barcode)
        
    }
}
