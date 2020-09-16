cc = g++
dir = build
prom = $(dir)/rt
deps = $(shell find ./ -name "*.h")
src = $(shell find ./ -name "*.cpp")
obj = $(src:./%.cpp=$(dir)/%.o) 

$(prom): $(obj)
	$(cc) -o $(prom) $(obj)

$(dir)/%.o: %.cpp $(deps)
	rm -rf build && mkdir build 
	$(cc) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(dir)
	rm image.ppm

img: $(prom)
	$(prom) > image.ppm
