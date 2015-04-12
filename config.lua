--calculate the aspect ratio of the device:
local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
   content = {
      width = aspectRatio > 1.5 and 375 or math.ceil( 563 / aspectRatio ),
      height = aspectRatio < 1.5 and 563 or math.ceil( 375 * aspectRatio ),
      scale = "letterBox",
      fps = 60,

      imageSuffix = {
         ["@2x"] = 1.5,
         ["@4x"] = 3.0,
      },
   },
   license = {
      google = {
         key = "reallylonggooglelicensekeyhere",
         policy = "serverManaged", 
      },
   },
}
