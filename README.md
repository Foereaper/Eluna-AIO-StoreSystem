## Prerequisites:
- AIO installed on client and server

## Installation:
1. Put contents of "Client" in a patch
2. Put contents of "Server" in the Lua scripts directory on the server
3. Run contents of "SQL" in MySQL in a database named "store"

You can access the store through the "Escape" menu ingame.

## DB flags and other config specific stuff:
- Some dummy data is already provided with the database. All data in the database can be safely removed and configured to your liking.
- The store frame PSD contains some guide borders to show the area of a texture being selected. This should allow you to customize as you please without really touching any of the code. Area is always the top-left black border pixel to the bottom-right black pixel. Stay within this border and you're fine.
- All scripts have some config options at the top of the script. Review these if need be.

### store_categories:
- icon: sets the navigation button icon to the one specified, this checks in the "interface/icons" directory. 
- requiredRank: This defines the minimum account rank needed to open a category.
- flags = 1: This flags a category as a "Sales" category. It will automatically populate with all items that are on sale.
- flags = 2: This flags a category as a "New" category. It will automatically populate with all items that are flagged as new.
- enabled: set this to 0 to disable a category. it will not be rendered in the navigation list.

### store_services:
- type = 1: items, will award everything in reward_1 to reward_8 through mail.
	- flags = 1: will enable the preview pane when the service box is clicked. will preview all items from reward_1 to reward_8.
- type = 2: gold, will award gold in reward_1.
- type = 3: mount, will teach the player the mounts defined in reward_1 to reward_8.
	- creatureEntry = entry of creature to display in the preview pane when the service box is clicked.
- type = 4: pet, will teach the player the mounts defined in reward_1 to reward_8.
	- creatureEntry = entry of creature to display in the preview pane when the service box is clicked.
- type = 5: buff, casts spell ID defined in reward_1 to reward_8.
- type = 7: services (login flags), sets the players' login flag to flag defined in reward_1.
- type = 8: levels, gives the player the amount of levels defined in reward_1.
	- flags = 1: sets the players level to the level defined in reward_1 instead of giving.
- type = 9: titles, gives player the title defined in reward_1.
- tooltipType = "item": renders the item tooltip in the on-hover service tooltip, uses the ID defined in the "hyperlinkId" field.
- tooltipType = "spell": renders the spell tooltip in the on-hover service tooltip, uses the ID defined in the "hyperlinkId" field.
- icon: sets the backdrop icon to the icon specified, this checks in the "interface/icons" directory.
- currency: id of the currency defined in the "store_currencies" table.
- discountAmount: the amount a service is discounted, deducted from the "price" field. Setting this field will automatically flag a service as "on sale". This will render the on sale tag on the service box.
- new = 1: flags the service as new, this will render the new tag on the service box. All items tagged as new will always be pushed to the front of a category.

### store_currencies:
- type = 1: gold, this will set this currency to normal ingame gold.
- type = 2: item token, this will set this currency to use an item as currency.
	- data: this is the entry id of the item token.
- type = 3: server handled, this should be used for any other currency, be it database driven donation/vote points or otherwise. This requires special handling in Store_Server.lua, specifically in the functions SHOP_UI.DeductCurrency and StoreHandler.UpdateCurrencies.
- icon: sets the currencies icon, this is loaded from "interface/Store_UI/Currencies" directory.

### store_category_service_link:
- This table is relatively self explanatory. You link categories and services from "store_categories" and "store_services" together to define which category a service should appear in. A service can appear in multiple categories.

## Credits:
- Vlad, lots of texture work and ideas/feedback. Check out his project at https://shinobistory.com/
- Tester, rubber duck as always.
