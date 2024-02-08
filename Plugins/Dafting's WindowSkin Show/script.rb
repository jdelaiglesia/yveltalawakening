class WindowSkinShow
    def initialize
        @viewport5 = Viewport.new(0,0,Graphics.width,Graphics.height)
        @viewport5.z = 99998
        
        window = "speech especial"

        @sprites = {}

        @sprites["window"] = IconSprite.new(0,292,@viewport5)
        @sprites["window"].setBitmap("Graphics/Windowskins/" + window)
        @sprites["window"].opacity = 0
    end

    def update
        Graphics.update
    end

    def show
        20.times do
            @sprites["window"].opacity += 255/20
            Graphics.update
        end
    end

    def hide
        20.times do
            @sprites["window"].opacity -= 255/20
            Graphics.update
        end
    end

    def dispose
        pbDisposeSpriteHash(@sprites)  
        @viewport5.dispose
    end
end