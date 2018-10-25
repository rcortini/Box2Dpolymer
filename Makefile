CC = gcc
CXX = g++
AR = ar
BOX2D_dir = /home/rcortini/soft/Box2D
BOX2D_libdir= $(BOX2D_dir)/Build/bin/x86_64/Debug
TARGET    = Box2Dpolymer
DEFINES   +=
INCLUDES  += -I$(BOX2D_dir)
ALL_CPPFLAGS  += -std=c++11 $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -Wall
ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g
ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
ALL_LDFLAGS   += $(LDFLAGS) -L. -L$(BOX2D_libdir)
LDDEPS    += $(BOX2D_libdir)/libBox2D.a # $(BOX2D_libdir)/libGLUI.a
LIBS      += $(LDDEPS) -lX11 -lGL -lGLU -lglut -lGLEW -lglfw -lXxf86vm -lpthread -lXrandr -lXi
LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)

HEADERS = Test.h Chain.h DebugDraw.h RenderGL3.h imgui.h stb_truetype.h Thermostat.h
OBJECTS := \
	TestEntries.o \
	Thermostat.o \
	RenderGL3.o \
	imgui.o \
	Test.o \
	Main.o \
	DebugDraw.o


RESOURCES := \

.PHONY: clean

all : $(TARGET)

clean :
	rm -f $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS) $(HEADERS)
	$(LINKCMD)

%.o: %.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"
