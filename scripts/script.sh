#!/bin/sh
systemctl daemon-reload
systemctl start mytimer.timer
systemctl start uptime.service
journalctl -S today -f -u uptime.service
