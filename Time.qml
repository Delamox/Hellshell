pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  // an expression can be broken across multiple lines using {}
  readonly property string time: {
    // The passed format string matches the default output of
    // the `date` command.
    Qt.formatDateTime(clock.date, "T-hh:mm:ss")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
