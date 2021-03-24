SLICER=../cura-slicer

all::	gcode

gcode::
	${SLICER} --load test.ini cube.stl   
	${SLICER} --load test.ini sphere.stl
	${SLICER} --load test.ini --support-enable=1 overhang-out.stl
	${SLICER} --load test.ini --support-enable=1 overhang-in.stl
	${SLICER} --load test.ini --support-enable=1 overhang-inout.stl
	${SLICER} --load test.ini --support-enable=1 overhang3l4mm.stl

clean::
	rm -f *.gcode 
