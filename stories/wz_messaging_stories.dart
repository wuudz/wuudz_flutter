import 'package:flutter/material.dart';
import 'package:wuudz/wuudz.dart';

import 'theme.dart';

Widget stack() => WZTheme(
  data: wzTheme,
  child: Scaffold(
    backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: WZMessageStack(
        sender: 1,
        groups: [
          WZMessageGroup(
            messages: [
              WZMessage(
                data: "Test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Declan", 
                  ref: 1,
                ),
              ),
              WZMessage(
                data: "Longer message test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Declan", 
                  ref: 1,
                ),
              ),
            ],
          ),
          WZMessageGroup(
            messages: [
              WZMessage(
                data: "Test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Hayden", 
                  ref: 2,
                ),
              ),
              WZMessage(
                data: "Longer message test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Hayden", 
                  ref: 2,
                ),
              ),
            ],
          ),
          WZMessageGroup(
            messages: [
              WZMessage(
                data: "Test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Declan", 
                  ref: 1,
                ),
              ),
              WZMessage(
                data: "Longer message test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Declan", 
                  ref: 1,
                ),
              ),
            ],
          ),
          WZMessageGroup(
            messages: [
              WZMessage(
                data: "Test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Josh", 
                  ref: 2,
                ),
              ),
              WZMessage(
                data: "Longer message test", 
                type: WZMessageType.text, 
                sentAt: DateTime.now(),
                sender: const WZMessageSender(
                  name: "Josh", 
                  ref: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);