Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8BPtr24509
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 06:25:55 -0500
Received: from adsl.proware.com.tw
	(IDENT:bF01vHqKmsZq5p//Pks0zPseA7guQg91@[211.20.79.38])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA8BPpjX027354
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 06:25:52 -0500
Received: from proware.proware.com.tw (localhost [127.0.0.1])
	by adsl.proware.com.tw (8.12.8/8.12.8) with ESMTP id iA8A5xc0028902
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 18:06:03 +0800
Received: from [192.168.10.199] (199-rocky_lee_desktop [192.168.10.199])
	by proware.proware.com.tw (8.12.8/8.12.8) with ESMTP id iA8A7Xsp021343
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 18:07:38 +0800
From: Rocky <rocky_lee@proware.com.tw>
Content-Type: multipart/alternative; boundary="=-50/xQzgwNDo6lRK+Avns"
Message-Id: <1099908541.2669.39.camel@RockyWorld>
Mime-Version: 1.0
Date: Mon, 08 Nov 2004 18:09:01 +0800
Subject: [linux-lvm] Configure error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-50/xQzgwNDo6lRK+Avns
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dear all

when I use cross compiler to configure LVM, 
but I got the following warning message

checking asm/byteorder.h usability... no
checking asm/byteorder.h presence... yes
configure: WARNING: asm/byteorder.h: present but cannot be compiled
configure: WARNING: asm/byteorder.h: check for missing prerequisite
headers?
configure: WARNING: asm/byteorder.h: proceeding with the preprocessor's
result
configure: WARNING:     ## ------------------------------------ ##
configure: WARNING:     ## Report this to bug-autoconf@gnu.org. ##
configure: WARNING:     ## ------------------------------------ ##
checking for asm/byteorder.h... yes
checking linux/fs.h usability... no
checking linux/fs.h presence... yes
configure: WARNING: linux/fs.h: present but cannot be compiled
configure: WARNING: linux/fs.h: check for missing prerequisite headers?
configure: WARNING: linux/fs.h: proceeding with the preprocessor's
result
configure: WARNING:     ## ------------------------------------ ##
configure: WARNING:     ## Report this to bug-autoconf@gnu.org. ##
configure: WARNING:     ## ------------------------------------ ##
configure: WARNING: Disabling selinux

Compiler with 2.6.7 kernel didn't show this error.
does someone know what cause this?

Kernel                : 2.6.9
device mapper : 1.00.19
gcc                     : 3.3.4
glibc                   : 2.3.2

Thank you!
Rocky

detail configure
-------------------------------------------------------------------------------------------------------------------------

[root@localhost LVM2.2.00.25]# CC=i386-linux-gcc ./configure
--target=${TARGET}
--with-kernel_dir=${PRJROOT}/build-tools/linux-${KERNEL_VERSION}
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... i386-pc-linux-gnu
checking for gawk... gawk
checking for gcc... i386-linux-gcc
checking for C compiler default output... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether i386-linux-gcc accepts -g... yes
checking for i386-linux-gcc option to accept ANSI C... none needed
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking whether make sets $(MAKE)... yes
checking for ranlib... ranlib
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking how to run the C preprocessor... i386-linux-gcc -E
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking whether time.h and sys/time.h may both be included... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking sys/file.h usability... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking assert.h usability... yes
checking assert.h presence... yes
checking for assert.h... yes
checking ctype.h usability... yes
checking ctype.h presence... yes
checking for ctype.h... yes
checking libgen.h usability... yes
checking libgen.h presence... yes
checking for libgen.h... yes
checking signal.h usability... yes
checking signal.h presence... yes
checking for signal.h... yes
checking stdio.h usability... yes
checking stdio.h presence... yes
checking for stdio.h... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking sys/resource.h usability... yes
checking sys/resource.h presence... yes
checking for sys/resource.h... yes
checking for sys/stat.h... (cached) yes
checking for sys/types.h... (cached) yes
checking sys/utsname.h usability... yes
checking sys/utsname.h presence... yes
checking for sys/utsname.h... yes
checking for sys/wait.h... (cached) yes
checking time.h usability... yes
checking time.h presence... yes
checking for time.h... yes
checking asm/byteorder.h usability... no
checking asm/byteorder.h presence... yes
configure: WARNING: asm/byteorder.h: present but cannot be compiled
configure: WARNING: asm/byteorder.h: check for missing prerequisite
headers?
configure: WARNING: asm/byteorder.h: proceeding with the preprocessor's
result
configure: WARNING:     ## ------------------------------------ ##
configure: WARNING:     ## Report this to bug-autoconf@gnu.org. ##
configure: WARNING:     ## ------------------------------------ ##
checking for asm/byteorder.h... yes
checking linux/fs.h usability... no
checking linux/fs.h presence... yes
configure: WARNING: linux/fs.h: present but cannot be compiled
configure: WARNING: linux/fs.h: check for missing prerequisite headers?
configure: WARNING: linux/fs.h: proceeding with the preprocessor's
result
configure: WARNING:     ## ------------------------------------ ##
configure: WARNING:     ## Report this to bug-autoconf@gnu.org. ##
configure: WARNING:     ## ------------------------------------ ##
checking for linux/fs.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for off_t... yes
checking for pid_t... yes
checking for size_t... yes
checking for mode_t... yes
checking for struct stat.st_rdev... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for gethostname... yes
checking for getpagesize... yes
checking for memset... yes
checking for munmap... yes
checking for setlocale... yes
checking for strcasecmp... yes
checking for strchr... yes
checking for strdup... yes
checking for strncasecmp... yes
checking for strerror... yes
checking for strrchr... yes
checking for strstr... yes
checking for strtol... yes
checking for strtoul... yes
checking for working alloca.h... yes
checking for alloca... yes
checking whether closedir returns void... no
checking for unistd.h... (cached) yes
checking vfork.h usability... no
checking vfork.h presence... no
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... yes
checking for working vfork... (cached) yes
checking whether lstat dereferences a symlink specified with a trailing
slash... yes
checking whether lstat accepts an empty string... no
checking for stdlib.h... (cached) yes
checking for GNU libc compatible malloc... yes
checking for working memcmp... yes
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... yes
checking whether stat accepts an empty string... no
checking for working strtod... yes
checking file owner... root
checking group owner... root
checking whether to enable lvm1 fallback... no
checking whether to include support for lvm1 metadata... internal
checking whether to include support for GFS pool metadata... internal
checking whether to include support for cluster locking... internal
checking whether to include snapshots... internal
checking whether to include mirrors... internal
checking whether to use static linking... no
checking whether to enable readline... no
checking whether to enable selinux support... yes
checking whether to build cluster LVM daemon... no
checking whether to enable debugging... no
checking for C optimisation flag... -O2
checking whether to use device-mapper... yes
checking whether to enable O_DIRECT... yes
checking whether to compile liblvm2cmd.so... no
checking whether to build fsadm... no
checking whether i386-linux-gcc needs -traditional... no
checking return type of signal handlers... void
checking for vprintf... yes
checking for _doprnt... no
checking for mkdir... yes
checking for rmdir... yes
checking for uname... yes
checking for dlopen in -ldl... yes
checking for is_selinux_enabled function... checking for
is_selinux_enabled in
-lselinux... no
no
configure: WARNING: Disabling selinux
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking whether to enable internationalisation... no
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking sys/un.h usability... yes
checking sys/un.h presence... yes
checking for sys/un.h... yes
checking for socket... yes
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking libdevmapper.h usability... yes
checking libdevmapper.h presence... yes
checking for libdevmapper.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating make.tmpl
config.status: creating daemons/Makefile
config.status: creating daemons/clvmd/Makefile
config.status: creating doc/Makefile
config.status: creating include/Makefile
config.status: creating lib/Makefile
config.status: creating lib/format1/Makefile
config.status: creating lib/format_pool/Makefile
config.status: creating lib/locking/Makefile
config.status: creating lib/mirror/Makefile
config.status: creating lib/snapshot/Makefile
config.status: creating man/Makefile
config.status: creating po/Makefile
config.status: creating tools/Makefile
config.status: creating tools/version.h
config.status: creating tools/fsadm/Makefile
config.status: creating test/mm/Makefile
config.status: creating test/device/Makefile
config.status: creating test/format1/Makefile
config.status: creating test/regex/Makefile
config.status: creating test/filters/Makefile


--=-50/xQzgwNDo6lRK+Avns
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.10">
</HEAD>
<BODY>
Dear all<BR>
<BR>
when I use cross compiler to configure LVM, <BR>
but I got the following warning message<BR>
<BR>
checking asm/byteorder.h usability... no<BR>
checking asm/byteorder.h presence... yes<BR>
configure: WARNING: asm/byteorder.h: present but cannot be compiled<BR>
configure: WARNING: asm/byteorder.h: check for missing prerequisite headers?<BR>
configure: WARNING: asm/byteorder.h: proceeding with the preprocessor's result<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## Report this to bug-autoconf@gnu.org. ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
checking for asm/byteorder.h... yes<BR>
checking linux/fs.h usability... no<BR>
checking linux/fs.h presence... yes<BR>
configure: WARNING: linux/fs.h: present but cannot be compiled<BR>
configure: WARNING: linux/fs.h: check for missing prerequisite headers?<BR>
configure: WARNING: linux/fs.h: proceeding with the preprocessor's result<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## Report this to bug-autoconf@gnu.org. ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
configure: WARNING: Disabling selinux<BR>
<BR>
Compiler with 2.6.7 kernel didn't show this error.<BR>
does someone know what cause this?<BR>
<BR>
Kernel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 2.6.9<BR>
device mapper : 1.00.19<BR>
gcc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 3.3.4<BR>
glibc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 2.3.2<BR>
<BR>
Thank you!<BR>
Rocky<BR>
<BR>
detail configure<BR>
-------------------------------------------------------------------------------------------------------------------------<BR>
<BR>
[root@localhost LVM2.2.00.25]# CC=i386-linux-gcc ./configure<BR>
--target=${TARGET}<BR>
--with-kernel_dir=${PRJROOT}/build-tools/linux-${KERNEL_VERSION}<BR>
checking build system type... i686-pc-linux-gnu<BR>
checking host system type... i686-pc-linux-gnu<BR>
checking target system type... i386-pc-linux-gnu<BR>
checking for gawk... gawk<BR>
checking for gcc... i386-linux-gcc<BR>
checking for C compiler default output... a.out<BR>
checking whether the C compiler works... yes<BR>
checking whether we are cross compiling... no<BR>
checking for suffix of executables...<BR>
checking for suffix of object files... o<BR>
checking whether we are using the GNU C compiler... yes<BR>
checking whether i386-linux-gcc accepts -g... yes<BR>
checking for i386-linux-gcc option to accept ANSI C... none needed<BR>
checking for a BSD-compatible install... /usr/bin/install -c<BR>
checking whether ln -s works... yes<BR>
checking whether make sets $(MAKE)... yes<BR>
checking for ranlib... ranlib<BR>
checking for dirent.h that defines DIR... yes<BR>
checking for library containing opendir... none required<BR>
checking how to run the C preprocessor... i386-linux-gcc -E<BR>
checking for egrep... grep -E<BR>
checking for ANSI C header files... yes<BR>
checking for sys/wait.h that is POSIX.1 compatible... yes<BR>
checking whether time.h and sys/time.h may both be included... yes<BR>
checking for sys/types.h... yes<BR>
checking for sys/stat.h... yes<BR>
checking for stdlib.h... yes<BR>
checking for string.h... yes<BR>
checking for memory.h... yes<BR>
checking for strings.h... yes<BR>
checking for inttypes.h... yes<BR>
checking for stdint.h... yes<BR>
checking for unistd.h... yes<BR>
checking fcntl.h usability... yes<BR>
checking fcntl.h presence... yes<BR>
checking for fcntl.h... yes<BR>
checking limits.h usability... yes<BR>
checking limits.h presence... yes<BR>
checking for limits.h... yes<BR>
checking locale.h usability... yes<BR>
checking locale.h presence... yes<BR>
checking for locale.h... yes<BR>
checking stddef.h usability... yes<BR>
checking stddef.h presence... yes<BR>
checking for stddef.h... yes<BR>
checking syslog.h usability... yes<BR>
checking syslog.h presence... yes<BR>
checking for syslog.h... yes<BR>
checking sys/file.h usability... yes<BR>
checking sys/file.h presence... yes<BR>
checking for sys/file.h... yes<BR>
checking sys/ioctl.h usability... yes<BR>
checking sys/ioctl.h presence... yes<BR>
checking for sys/ioctl.h... yes<BR>
checking sys/param.h usability... yes<BR>
checking sys/param.h presence... yes<BR>
checking for sys/param.h... yes<BR>
checking sys/time.h usability... yes<BR>
checking sys/time.h presence... yes<BR>
checking for sys/time.h... yes<BR>
checking assert.h usability... yes<BR>
checking assert.h presence... yes<BR>
checking for assert.h... yes<BR>
checking ctype.h usability... yes<BR>
checking ctype.h presence... yes<BR>
checking for ctype.h... yes<BR>
checking libgen.h usability... yes<BR>
checking libgen.h presence... yes<BR>
checking for libgen.h... yes<BR>
checking signal.h usability... yes<BR>
checking signal.h presence... yes<BR>
checking for signal.h... yes<BR>
checking stdio.h usability... yes<BR>
checking stdio.h presence... yes<BR>
checking for stdio.h... yes<BR>
checking sys/mman.h usability... yes<BR>
checking sys/mman.h presence... yes<BR>
checking for sys/mman.h... yes<BR>
checking sys/resource.h usability... yes<BR>
checking sys/resource.h presence... yes<BR>
checking for sys/resource.h... yes<BR>
checking for sys/stat.h... (cached) yes<BR>
checking for sys/types.h... (cached) yes<BR>
checking sys/utsname.h usability... yes<BR>
checking sys/utsname.h presence... yes<BR>
checking for sys/utsname.h... yes<BR>
checking for sys/wait.h... (cached) yes<BR>
checking time.h usability... yes<BR>
checking time.h presence... yes<BR>
checking for time.h... yes<BR>
checking asm/byteorder.h usability... no<BR>
checking asm/byteorder.h presence... yes<BR>
configure: WARNING: asm/byteorder.h: present but cannot be compiled<BR>
configure: WARNING: asm/byteorder.h: check for missing prerequisite headers?<BR>
configure: WARNING: asm/byteorder.h: proceeding with the preprocessor's result<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## Report this to bug-autoconf@gnu.org. ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
checking for asm/byteorder.h... yes<BR>
checking linux/fs.h usability... no<BR>
checking linux/fs.h presence... yes<BR>
configure: WARNING: linux/fs.h: present but cannot be compiled<BR>
configure: WARNING: linux/fs.h: check for missing prerequisite headers?<BR>
configure: WARNING: linux/fs.h: proceeding with the preprocessor's result<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## Report this to bug-autoconf@gnu.org. ##<BR>
configure: WARNING:&nbsp;&nbsp;&nbsp;&nbsp; ## ------------------------------------ ##<BR>
checking for linux/fs.h... yes<BR>
checking malloc.h usability... yes<BR>
checking malloc.h presence... yes<BR>
checking for malloc.h... yes<BR>
checking for an ANSI C-conforming const... yes<BR>
checking for inline... inline<BR>
checking for off_t... yes<BR>
checking for pid_t... yes<BR>
checking for size_t... yes<BR>
checking for mode_t... yes<BR>
checking for struct stat.st_rdev... yes<BR>
checking whether struct tm is in sys/time.h or time.h... time.h<BR>
checking for gethostname... yes<BR>
checking for getpagesize... yes<BR>
checking for memset... yes<BR>
checking for munmap... yes<BR>
checking for setlocale... yes<BR>
checking for strcasecmp... yes<BR>
checking for strchr... yes<BR>
checking for strdup... yes<BR>
checking for strncasecmp... yes<BR>
checking for strerror... yes<BR>
checking for strrchr... yes<BR>
checking for strstr... yes<BR>
checking for strtol... yes<BR>
checking for strtoul... yes<BR>
checking for working alloca.h... yes<BR>
checking for alloca... yes<BR>
checking whether closedir returns void... no<BR>
checking for unistd.h... (cached) yes<BR>
checking vfork.h usability... no<BR>
checking vfork.h presence... no<BR>
checking for vfork.h... no<BR>
checking for fork... yes<BR>
checking for vfork... yes<BR>
checking for working fork... yes<BR>
checking for working vfork... (cached) yes<BR>
checking whether lstat dereferences a symlink specified with a trailing<BR>
slash... yes<BR>
checking whether lstat accepts an empty string... no<BR>
checking for stdlib.h... (cached) yes<BR>
checking for GNU libc compatible malloc... yes<BR>
checking for working memcmp... yes<BR>
checking for stdlib.h... (cached) yes<BR>
checking for unistd.h... (cached) yes<BR>
checking for getpagesize... (cached) yes<BR>
checking for working mmap... yes<BR>
checking whether stat accepts an empty string... no<BR>
checking for working strtod... yes<BR>
checking file owner... root<BR>
checking group owner... root<BR>
checking whether to enable lvm1 fallback... no<BR>
checking whether to include support for lvm1 metadata... internal<BR>
checking whether to include support for GFS pool metadata... internal<BR>
checking whether to include support for cluster locking... internal<BR>
checking whether to include snapshots... internal<BR>
checking whether to include mirrors... internal<BR>
checking whether to use static linking... no<BR>
checking whether to enable readline... no<BR>
checking whether to enable selinux support... yes<BR>
checking whether to build cluster LVM daemon... no<BR>
checking whether to enable debugging... no<BR>
checking for C optimisation flag... -O2<BR>
checking whether to use device-mapper... yes<BR>
checking whether to enable O_DIRECT... yes<BR>
checking whether to compile liblvm2cmd.so... no<BR>
checking whether to build fsadm... no<BR>
checking whether i386-linux-gcc needs -traditional... no<BR>
checking return type of signal handlers... void<BR>
checking for vprintf... yes<BR>
checking for _doprnt... no<BR>
checking for mkdir... yes<BR>
checking for rmdir... yes<BR>
checking for uname... yes<BR>
checking for dlopen in -ldl... yes<BR>
checking for is_selinux_enabled function... checking for is_selinux_enabled in<BR>
-lselinux... no<BR>
no<BR>
configure: WARNING: Disabling selinux<BR>
checking getopt.h usability... yes<BR>
checking getopt.h presence... yes<BR>
checking for getopt.h... yes<BR>
checking whether to enable internationalisation... no<BR>
checking sys/socket.h usability... yes<BR>
checking sys/socket.h presence... yes<BR>
checking for sys/socket.h... yes<BR>
checking sys/un.h usability... yes<BR>
checking sys/un.h presence... yes<BR>
checking for sys/un.h... yes<BR>
checking for socket... yes<BR>
checking dlfcn.h usability... yes<BR>
checking dlfcn.h presence... yes<BR>
checking for dlfcn.h... yes<BR>
checking libdevmapper.h usability... yes<BR>
checking libdevmapper.h presence... yes<BR>
checking for libdevmapper.h... yes<BR>
configure: creating ./config.status<BR>
config.status: creating Makefile<BR>
config.status: creating make.tmpl<BR>
config.status: creating daemons/Makefile<BR>
config.status: creating daemons/clvmd/Makefile<BR>
config.status: creating doc/Makefile<BR>
config.status: creating include/Makefile<BR>
config.status: creating lib/Makefile<BR>
config.status: creating lib/format1/Makefile<BR>
config.status: creating lib/format_pool/Makefile<BR>
config.status: creating lib/locking/Makefile<BR>
config.status: creating lib/mirror/Makefile<BR>
config.status: creating lib/snapshot/Makefile<BR>
config.status: creating man/Makefile<BR>
config.status: creating po/Makefile<BR>
config.status: creating tools/Makefile<BR>
config.status: creating tools/version.h<BR>
config.status: creating tools/fsadm/Makefile<BR>
config.status: creating test/mm/Makefile<BR>
config.status: creating test/device/Makefile<BR>
config.status: creating test/format1/Makefile<BR>
config.status: creating test/regex/Makefile<BR>
config.status: creating test/filters/Makefile<BR>
<BR>
</BODY>
</HTML>

--=-50/xQzgwNDo6lRK+Avns--
