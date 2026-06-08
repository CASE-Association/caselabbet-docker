# Inventory collator
[Inventory Debug View](https://caselabbet.se/inventory?debug)


This container published inventory status on [caselabbet.se/inventory](https://caselabbet.se/inventory) by collating the [Inventory Sheet](https://docs.google.com/spreadsheets/d/147HL4QCIvZX2amx6_Im6BiK4NwPTtFHxHf3mKN7k_S4/edit?gid=0#gid=0) and Zettle. 

If a component exists in both Zettle and the sheet, they are merged to one entry with full information. Components are matched by (case-insensitive) name. The name of a Zettle component with variants will be `[name] [variant name]`. Components expected to be found in Zettle should be marked as such in the sheet, so that a warning can be shown on the debug page for unmatched components.

- The sheet contains data like a detailed description, drawer location, MPN etc.
- Zettle contains price, stock and images.

Most free or lab components will only be in the sheet, as these are a) not sold and b) too numerous to manage in Zettle.
