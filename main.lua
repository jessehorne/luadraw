currx = love.graphics.getWidth()/2
curry = love.graphics.getHeight()/2
currr = -90

if arg[2] then
	love.graphics.setCaption(arg[2])
end

function string:split(sep)
  local sep, fields = sep or " ", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

function load_string(s)
	local f = {}
	f.file = io.open(s, "r")
	f.txt = f.file:read("*all")
	f.file:close()
	return f.txt
end

function parse_string(s)
	local f = ""
	f = table.concat(s:split("\n"), " ")
	f = f:split(" ")
	return f
end

function create_draw_table(t)
	local points = {}
	table.insert(points, currx)
	table.insert(points, curry)
	for i,v in ipairs(t) do
		if v == "f" then
			currx = (currx + math.cos(math.rad(currr)) * tonumber(t[i+1]))
			curry = (curry + math.sin(math.rad(currr)) * tonumber(t[i+1]))
			table.insert(points, currx)
			table.insert(points, curry)
		elseif v == "b" then
			currx = (currx - math.cos(math.rad(currr)) * tonumber(t[i+1]))
			curry = (curry - math.sin(math.rad(currr)) * tonumber(t[i+1]))
			table.insert(points, currx)
			table.insert(points, curry)
		elseif v == "r" then
			currr = currr + t[i+1]
		end

	end
	return points
end

function love.load()
	local file = arg[2]
	if file ~= nil then
		t = load_string(file)
		t = parse_string(t)
		t = create_draw_table(t)
	else
		print("No file input.")
	end
end

function draw_table(t)
	love.graphics.line(unpack(t))
end

function love.update(dt)

end

function love.draw()
	draw_table(t)
end