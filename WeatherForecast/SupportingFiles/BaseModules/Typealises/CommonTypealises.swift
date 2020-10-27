//
//  CommonTypealises.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

// MARK: - On Dismiss Closures -
public typealias OnDismissed = (() -> Void)
public typealias OnCompletedBool = ((Bool) -> Void)

// MARK: - Void Operation Closures -
public typealias VoidOperation = (() -> Void)

// MARK: - Button Tapped Closures -
public typealias ButtonPressed = ((Bool) -> Void)

// MARK: - Camera Dragging Closures -
public typealias CameraDragObverver = ((Bool) -> Void)

// MARK: - Authentication Closures -
public typealias UserLoggedOut = (() -> Void)

// MARK: - Server Side Closures -
public typealias SocketConnection = ((Bool) -> Void)

// MARK: - Switch Button Closures -
public typealias SwitchButtonChanged  = ((Bool) -> Void)

// MARK: - TextField Closures -
public typealias TextFieldChangeCompletionHandler  = ((String) -> Void)
public typealias TextFieldFocusCompletionHandler = ((Bool) -> Void)

// MARK: - IndexPath Closures -
public typealias SelectedIndexPath = ((IndexPath) -> Void)

// MARK: - Animation Closures -
public typealias AnimationStateCompletion = ((AnimationStates) -> Void)

// MARK: - Data Loading States -
public typealias DataLoadingStateCompletion = ((DataLoadingState) -> Void)

public typealias ActivityStatesCompletion = ((ActivityStates) -> Void)
