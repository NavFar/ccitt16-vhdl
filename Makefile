GHDL=ghdl
GHDLFLAGS= --std=08
MODULES=\
	ccitt16.o \
	ccitt16_testbench
test: $(MODULES)
	./ccitt16_testbench 
%: %.o
	$(GHDL) -e $(GHDLFLAGS) $@

%.o: %.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<
clean:
	rm -f *.o  work*.cf e*.lst *_testbench
