-- Project Home

-- initialise variables
local numLines = 0
local filePath = "ProjectHome.txt"

-- set up file
if io.open(filePath, "r") == nil then
  io.output(filePath)
end

-- write 2000 lines of text
while numLines < 2000 do
  io.write("This is line number " .. numLines + 1 .. "\n")
  numLines = numLines + 1
end

-- close file
io.close(filePath)