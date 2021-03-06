hwgrid.cls changelog

Version 1.4 - 8 September 2019

- Class options are now passed to the geometry package (allowing users to
  define custom margins, etc.)
- Days of week are now optional, defaulting to the workweek (Mon - Fri)

Version 1.3 - 3 September 2019

- Use more expl3 syntax

Version 1.2 - 2 September 2019

- Use expl3 syntax for \insertgrid
- Combine \insertgrid and \insertgridfixed, using an optional argument for the
  height of the rows for classes
- Make list of events an optional argument to \insertgrid

Version 1.1 - 2 September 2019

- Added list of events (holidays, etc. corresponding to each date) under the
  dates, read from a new argument to \insertgrid just before the list of
  classes.
- Classes (leftmost column) are ragged-right
- \insertgridfixed now takes the height of each class row as an argument (the
  last argument) instead of using 80pt.
