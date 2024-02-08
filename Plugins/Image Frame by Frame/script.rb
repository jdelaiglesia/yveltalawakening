class ImageFrameByFrame
    def initialize(folderName, frames, x, y, width, height, waitAfterFinish = 0, fadeOut = false)
        @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
        @viewport.z = 2
        @sprite = Sprite.new(@viewport)
        @fileName = 1
        @sprite.x = x
        @sprite.y = y
        @sprite.z = 0
        @waitAfterFinish = waitAfterFinish  
        @frames = frames
        @folderName = folderName
        @fadeOut = fadeOut
        main
    end
   
    def main
        @sprite.bitmap = Bitmap.new("Graphics/Pictures/" + @folderName + "/" + @fileName.to_s)
        Graphics.update
        loop do
            if (@fileName < @frames)
                @fileName += 1
                @sprite.bitmap = Bitmap.new("Graphics/Pictures/" + @folderName + "/" + @fileName.to_s)
                pbWait(2)
            else
                if (@waitAfterFinish > 0)
                    pbWait(@waitAfterFinish)
                end
                dispose
                break
            end
        end
    end

    def dispose
        loop do
            if (@sprite.opacity > 0 && @fadeOut == true)
                @sprite.opacity -= 10
                pbWait(1)
            elsif (@fadeOut == false)
                @sprite.opacity = 0
                break
            else
                #pbDisposeSpriteHash(@sprite)
                #@viewport.dispose
                break
            end
        end 
    end
end
