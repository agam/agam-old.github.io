
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /usr/lib/ruby/1.8/x86_64-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/usr
dvidir = $(docdir)
sitelibdir = $(sitedir)/$(ruby_version)
pdfdir = $(docdir)
archdir = $(rubylibdir)/$(arch)
sharedstatedir = $(prefix)/com
sitedir = $(DESTDIR)/usr/local/lib/site_ruby
infodir = $(prefix)/share/info
sysconfdir = $(DESTDIR)/etc
bindir = $(exec_prefix)/bin
vendorlibdir = $(vendordir)/$(ruby_version)
sbindir = $(exec_prefix)/sbin
libexecdir = $(prefix)/lib/ruby1.8
mandir = $(prefix)/share/man
sitearchdir = $(sitelibdir)/$(sitearch)
vendorarchdir = $(vendorlibdir)/$(sitearch)
vendordir = $(libdir)/ruby/vendor_ruby
datarootdir = $(prefix)/share
oldincludedir = $(DESTDIR)/usr/include
psdir = $(docdir)
rubylibdir = $(libdir)/ruby/$(ruby_version)
htmldir = $(docdir)
includedir = $(prefix)/include
localedir = $(datarootdir)/locale
libdir = $(exec_prefix)/lib
docdir = $(datarootdir)/doc/$(PACKAGE)
datadir = $(datarootdir)
localstatedir = $(DESTDIR)/var

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = extconf.h
CFLAGS   =  -fPIC -fno-strict-aliasing -g -g -O2  -fPIC $(cflags)   
INCFLAGS = -I. -I. -I/usr/lib/ruby/1.8/x86_64-linux -I.
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\" -D_FORTIFY_SOURCE=2  -D_FORTIFY_SOURCE=2
CXXFLAGS = $(CFLAGS) 
ldflags  = -L. -Wl,-Bsymbolic-functions -Wl,-z,relro -rdynamic -Wl,-export-dynamic 
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = $(CC) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby1.8
RUBY_SO_NAME = ruby1.8
arch = x86_64-linux
sitearch = x86_64-linux
ruby_version = 1.8
ruby = /usr/bin/ruby1.8
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -lffi  -lffi   -lpthread -lrt -ldl -lcrypt -lm   -lc
SRCS = ffi.c DataConverter.c ArrayType.c StructLayout.c MappedType.c StructByReference.c Types.c FunctionInfo.c Platform.c Struct.c LongDouble.c LastError.c Variadic.c Buffer.c Thread.c Pointer.c Call.c Type.c MemoryPointer.c Function.c MethodHandle.c StructByValue.c ClosurePool.c AbstractMemory.c DynamicLibrary.c
OBJS = ffi.o DataConverter.o ArrayType.o StructLayout.o MappedType.o StructByReference.o Types.o FunctionInfo.o Platform.o Struct.o LongDouble.o LastError.o Variadic.o Buffer.o Thread.o Pointer.o Call.o Type.o MemoryPointer.o Function.o MethodHandle.o StructByValue.o ClosurePool.o AbstractMemory.o DynamicLibrary.o
TARGET = ffi_c
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /usr/local/google/home/agam/Documents/agam.github.io/liquid/ruby/1.8/gems/ffi-1.9.3/lib$(target_prefix)
RUBYARCHDIR = /usr/local/google/home/agam/Documents/agam.github.io/liquid/ruby/1.8/gems/ffi-1.9.3/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h $(RUBY_EXTCONF_H)
