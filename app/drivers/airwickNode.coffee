module.exports =

  announcer: 11

  descriptions:
    ping:
      title: 'Ping count'
      min: 0
    age:
      title: 'Estimated age'
      unit: 'days'
      min: 0
    vpre:
      title: 'Vcc before send'
      unit: 'V'
      min: 0
      factor: 2
      scale: 2
    vpost:
      title: 'Vcc after send'
      unit: 'V'
      min: 0
      factor: 2
      scale: 2
    temp:
      title: 'Temperature'
      unit: '°C'
      scale: 1
      min: -50
      max: 50
    humi:
      title: 'Relative humidity'
      unit: '%'
      scale: 1
      min: 0
      max: 100

  feed: 'rf12.packet'

  decode: (raw, cb) ->
    count = raw.readUInt32LE(1)
    t = raw.readUInt16LE(8, true)
    h = raw.readUInt16LE(10, true)
    result =
      ping: count
      age: count / (86400 / 60) | 0
      temp: t
      humi: h
      vpre: 50 + raw[6]
      vpost: 50 + raw[7]
    cb result

