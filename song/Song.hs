module Song where

import HMusic

motorikBD = X :| X :| O :| X :| X :| X :| O :| X
motorikSD = inversePattern motorikBD
motorikHH = 8 .* X


motorik =
  MakeTrack "drum-bass"  motorikBD :||
  MakeTrack "drum-snare" motorikSD :||
  MakeTrack "drum-hihat" motorikHH

moto1 =
  MakeTrack "bell" (X :| O :| O :| X) :||
  motorik

moto2 =
  MakeTrack "bell" (O :| X :| O :| O :| X :| O :| X) :||
  motorik

moto3 =
  MakeTrack "aah" (O :| O :| X :| O :| O :| X) :||
  moto1

moto4 =
  MakeTrack "aah"  (X :| O :| O :| O :| X)      :||
  MakeTrack "bell" (X :| O :| O :| X :| O :| X) :||
  motorik

song =
  (2 |* motorik)          |+
  (2 |* (moto1 |+ moto2)) |+
  moto3                   |+
  moto4

--------------------------
-- Auxiliary functions. --
--------------------------

inversePattern :: MPattern -> MPattern
inversePattern X = O
inversePattern O = X
inversePattern (a :| b) = (inversePattern a) :|
                          (inversePattern b)
