VERIOG = iverilog
TARGET = seven_segment.vcd
TEMP = temp.vvp

$(TARGET) : $(TEMP)
	vvp $(TEMP)

$(TEMP): tb.v decoder.v
	$(VERIOG) -o $(TEMP) tb.v decoder.v

clean:
	rm $(TARGET)
	rm $(TEMP)
