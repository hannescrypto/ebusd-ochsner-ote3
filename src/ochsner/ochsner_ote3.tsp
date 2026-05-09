import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Ochsner;

@base(0x6, 0x21, 0)
model r {}

// 1. Außentemperatur (00800040)
@inherit(r)
@ext(0x80, 0, 0x40)
model OutsideTemp {
  param: param;
  temp: tempt;
}

// 2. Warmwassertemperatur Ist (00840040)
@inherit(r)
@ext(0x84, 0, 0x40)
model WaterTemp {
  param: param;
  temp: tempt;
}

// 3. Vorlauf Puffer oben TPO (00e00040)
@inherit(r)
@ext(0xe0, 0, 0x40)
model FlowTemp {
  param: param;
  temp: tempt;
}

// 4. Status Wärmepumpe (02b50040)
@base(0x6, 0x21, 0x2)
model r_hp {}

@inherit(r_hp)
@id(0x6, 0x21, 0x2, 0xb5, 0, 0x40)
model HpMode {
  param: param;
  status: hpstatus;
}

// 5. Datum (02c60040)
@inherit(r)
@ext(0xc6, 0, 0x40)
model DateValue {
  param: param;
  date: bdate;
}

// 6. Uhrzeit (02c80040)
@inherit(r)
@ext(0xc8, 0, 0x40)
model TimeValue {
  param: param;
  time: btime;
}