
// Handles all file descriptors

configuration IOManagerC {
  provides {
    interface IO[uint8_t io_id];
    interface BlockingIO;
    interface TimerFired;
  }
}

implementation {
  components IOManagerP;
  components HalAlarmC;
  components MainC;

  MainC -> IOManagerP.Init;

  IOManagerP.TimerQuery -> HalAlarmC.TimerQuery;

  IO = IOManagerP.IO;
  BlockingIO = IOManagerP.BlockingIO;
  TimerFired = IOManagerP.TimerFired;
}
