Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4E857FCC8
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 15:44:10 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEFC168A3
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 15:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 46EA7411
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 17:44:05 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 2C_NKQmFd5v0 for <linux-lvm@redhat.com>;
	Wed, 10 May 2017 17:44:05 +0200 (CEST)
Received: from [192.168.178.33] (p4FC4A30D.dip0.t-ipconnect.de [79.196.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id D9B1E410
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 17:44:04 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <7d905fff-99cf-3448-211d-70525494ba1c@mglug.de>
Date: Wed, 10 May 2017 17:44:04 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] configure error with dbus-flags
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

configuring lvm2 (git from today) get some strange "bailing out" error
message. Maybe Ive forgot some libs (Ubuntu 16.04), but Im not seeing,
which one is needed:

--------------------- snip -------------------------
oliver@w541:~/gits/lvm2$ ./configure --enable-lvmetad --enable-lvmpolld
--enable-notify-dbus --enable-udev_sync --enable-udev_rules
--enable-applib --enable-cmdlib --enable-dbus-service
--enable-python3_bindings --enable-dmeventd
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking target system type... x86_64-unknown-linux-gnu
checking for a sed that does not truncate output... /bin/sed
checking for gawk... gawk
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking whether gcc needs -traditional... no
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking whether make sets $(MAKE)... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for ranlib... ranlib
checking for cflow... no
checking for cscope... no
checking for chmod... /bin/chmod
checking for wc... /usr/bin/wc
checking for sort... /usr/bin/sort
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking whether sys/types.h defines makedev... yes
checking for stdbool.h that conforms to C99... yes
checking for _Bool... yes
checking for ANSI C header files... (cached) yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking whether time.h and sys/time.h may both be included... yes
checking assert.h usability... yes
checking assert.h presence... yes
checking for assert.h... yes
checking ctype.h usability... yes
checking ctype.h presence... yes
checking for ctype.h... yes
checking dirent.h usability... yes
checking dirent.h presence... yes
checking for dirent.h... yes
checking errno.h usability... yes
checking errno.h presence... yes
checking for errno.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking for inttypes.h... (cached) yes
checking langinfo.h usability... yes
checking langinfo.h presence... yes
checking for langinfo.h... yes
checking libgen.h usability... yes
checking libgen.h presence... yes
checking for libgen.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking paths.h usability... yes
checking paths.h presence... yes
checking for paths.h... yes
checking signal.h usability... yes
checking signal.h presence... yes
checking for signal.h... yes
checking stdarg.h usability... yes
checking stdarg.h presence... yes
checking for stdarg.h... yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking stdio.h usability... yes
checking stdio.h presence... yes
checking for stdio.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking sys/file.h usability... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/resource.h usability... yes
checking sys/resource.h presence... yes
checking for sys/resource.h... yes
checking for sys/stat.h... (cached) yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for sys/types.h... (cached) yes
checking sys/utsname.h usability... yes
checking sys/utsname.h presence... yes
checking for sys/utsname.h... yes
checking for sys/wait.h... (cached) yes
checking time.h usability... yes
checking time.h presence... yes
checking for time.h... yes
checking for unistd.h... (cached) yes
checking termios.h usability... yes
checking termios.h presence... yes
checking for termios.h... yes
checking sys/statvfs.h usability... yes
checking sys/statvfs.h presence... yes
checking for sys/statvfs.h... yes
checking sys/timerfd.h usability... yes
checking sys/timerfd.h presence... yes
checking for sys/timerfd.h... yes
checking sys/vfs.h usability... yes
checking sys/vfs.h presence... yes
checking for sys/vfs.h... yes
checking linux/magic.h usability... yes
checking linux/magic.h presence... yes
checking for linux/magic.h... yes
checking linux/fiemap.h usability... yes
checking linux/fiemap.h presence... yes
checking for linux/fiemap.h... yes
checking asm/byteorder.h usability... yes
checking asm/byteorder.h presence... yes
checking for asm/byteorder.h... yes
checking linux/fs.h usability... yes
checking linux/fs.h presence... yes
checking for linux/fs.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for struct stat.st_rdev... yes
checking for ptrdiff_t... yes
checking for struct stat.st_blocks... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for off_t... yes
checking for pid_t... yes
checking return type of signal handlers... void
checking for size_t... yes
checking for mode_t... yes
checking for int8_t... yes
checking for int16_t... yes
checking for int32_t... yes
checking for int64_t... yes
checking for ssize_t... yes
checking for uid_t in sys/types.h... yes
checking for uint8_t... yes
checking for uint16_t... yes
checking for uint32_t... yes
checking for uint64_t... yes
checking for __builtin_clz... yes
checking for ftruncate... yes
checking for gethostname... yes
checking for getpagesize... yes
checking for gettimeofday... yes
checking for localtime_r... yes
checking for memchr... yes
checking for memset... yes
checking for mkdir... yes
checking for mkfifo... yes
checking for munmap... yes
checking for nl_langinfo... yes
checking for realpath... yes
checking for rmdir... yes
checking for setenv... yes
checking for setlocale... yes
checking for strcasecmp... yes
checking for strchr... yes
checking for strcspn... yes
checking for strdup... yes
checking for strerror... yes
checking for strncasecmp... yes
checking for strndup... yes
checking for strrchr... yes
checking for strspn... yes
checking for strstr... ^Coliver@w541:~/gits/lvm2$ ./configure
--enable-lvmetad --enable-lvmpolld --enable-notify-dbus
--enable-udev_sync --enable-udev_rules --enab --enable-dbus-service
--enable-python3_bindings
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking target system type... x86_64-unknown-linux-gnu
checking for a sed that does not truncate output... /bin/sed
checking for gawk... gawk
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking whether gcc needs -traditional... no
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking whether make sets $(MAKE)... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for ranlib... ranlib
checking for cflow... no
checking for cscope... no
checking for chmod... /bin/chmod
checking for wc... /usr/bin/wc
checking for sort... /usr/bin/sort
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking whether sys/types.h defines makedev... yes
checking for stdbool.h that conforms to C99... yes
checking for _Bool... yes
checking for ANSI C header files... (cached) yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking whether time.h and sys/time.h may both be included... yes
checking assert.h usability... yes
checking assert.h presence... yes
checking for assert.h... yes
checking ctype.h usability... yes
checking ctype.h presence... yes
checking for ctype.h... yes
checking dirent.h usability... yes
checking dirent.h presence... yes
checking for dirent.h... yes
checking errno.h usability... yes
checking errno.h presence... yes
checking for errno.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking for inttypes.h... (cached) yes
checking langinfo.h usability... yes
checking langinfo.h presence... yes
checking for langinfo.h... yes
checking libgen.h usability... yes
checking libgen.h presence... yes
checking for libgen.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking paths.h usability... yes
checking paths.h presence... yes
checking for paths.h... yes
checking signal.h usability... yes
checking signal.h presence... yes
checking for signal.h... yes
checking stdarg.h usability... yes
checking stdarg.h presence... yes
checking for stdarg.h... yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking stdio.h usability... yes
checking stdio.h presence... yes
checking for stdio.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking sys/file.h usability... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/resource.h usability... yes
checking sys/resource.h presence... yes
checking for sys/resource.h... yes
checking for sys/stat.h... (cached) yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for sys/types.h... (cached) yes
checking sys/utsname.h usability... yes
checking sys/utsname.h presence... yes
checking for sys/utsname.h... yes
checking for sys/wait.h... (cached) yes
checking time.h usability... yes
checking time.h presence... yes
checking for time.h... yes
checking for unistd.h... (cached) yes
checking termios.h usability... yes
checking termios.h presence... yes
checking for termios.h... yes
checking sys/statvfs.h usability... yes
checking sys/statvfs.h presence... yes
checking for sys/statvfs.h... yes
checking sys/timerfd.h usability... yes
checking sys/timerfd.h presence... yes
checking for sys/timerfd.h... yes
checking sys/vfs.h usability... yes
checking sys/vfs.h presence... yes
checking for sys/vfs.h... yes
checking linux/magic.h usability... yes
checking linux/magic.h presence... yes
checking for linux/magic.h... yes
checking linux/fiemap.h usability... yes
checking linux/fiemap.h presence... yes
checking for linux/fiemap.h... yes
checking asm/byteorder.h usability... yes
checking asm/byteorder.h presence... yes
checking for asm/byteorder.h... yes
checking linux/fs.h usability... yes
checking linux/fs.h presence... yes
checking for linux/fs.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for struct stat.st_rdev... yes
checking for ptrdiff_t... yes
checking for struct stat.st_blocks... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for off_t... yes
checking for pid_t... yes
checking return type of signal handlers... void
checking for size_t... yes
checking for mode_t... yes
checking for int8_t... yes
checking for int16_t... yes
checking for int32_t... yes
checking for int64_t... yes
checking for ssize_t... yes
checking for uid_t in sys/types.h... yes
checking for uint8_t... yes
checking for uint16_t... yes
checking for uint32_t... yes
checking for uint64_t... yes
checking for __builtin_clz... yes
checking for ftruncate... yes
checking for gethostname... yes
checking for getpagesize... yes
checking for gettimeofday... yes
checking for localtime_r... yes
checking for memchr... yes
checking for memset... yes
checking for mkdir... yes
checking for mkfifo... yes
checking for munmap... yes
checking for nl_langinfo... yes
checking for realpath... yes
checking for rmdir... yes
checking for setenv... yes
checking for setlocale... yes
checking for strcasecmp... yes
checking for strchr... yes
checking for strcspn... yes
checking for strdup... yes
checking for strerror... yes
checking for strncasecmp... yes
checking for strndup... yes
checking for strrchr... yes
checking for strspn... yes
checking for strstr... yes
checking for strtol... yes
checking for strtoul... yes
checking for uname... yes
checking for working alloca.h... yes
checking for alloca... yes
checking whether closedir returns void... no
checking for unistd.h... (cached) yes
checking for working chown... yes
checking vfork.h usability... no
checking vfork.h presence... no
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... yes
checking for working vfork... (cached) yes
checking whether lstat correctly handles trailing slash... yes
checking whether lstat accepts an empty string... no
checking for stdlib.h... (cached) yes
checking for GNU libc compatible malloc... yes
checking for working memcmp... yes
checking for sys/time.h... (cached) yes
checking for unistd.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for sys/param.h... (cached) yes
checking for alarm... yes
checking for working mktime... yes
checking for getpagesize... (cached) yes
checking for working mmap... yes
checking for stdlib.h... (cached) yes
checking for GNU libc compatible realloc... yes
checking whether stat accepts an empty string... no
checking for working strtod... yes
checking for vprintf... yes
checking for _doprnt... no
checking whether to enable dependency tracking... yes
checking whether to use static linking... no
checking whether gcc accepts -pie flag... yes
checking whether gcc accepts -Wl,-z,relro,-z,now ld flags... yes
checking file owner...
checking group owner...
checking device node uid... 0
checking device node gid... 0
checking device node mode... 0600
checking when to create device nodes... on resume
checking default name mangling... auto
checking whether to enable lvm1 fallback... no
checking whether to include support for lvm1 metadata... internal
checking whether to include support for GFS pool metadata... internal
checking whether to include support for cluster locking... internal
checking whether to include snapshots... internal
checking whether to include mirrors... internal
checking whether to include raid... internal
checking whether to include replicators... none
checking whether to include thin provisioning... internal
checking for thin_check... /usr/sbin/thin_check
checking for thin_dump... /usr/sbin/thin_dump
checking for thin_repair... /usr/sbin/thin_repair
checking for thin_restore... /usr/sbin/thin_restore
checking whether thin_check supports the needs-check flag... yes
checking whether to include cache... internal
checking for cache_check... /usr/sbin/cache_check
checking for cache_dump... /usr/sbin/cache_dump
checking for cache_repair... /usr/sbin/cache_repair
checking for cache_restore... /usr/sbin/cache_restore
checking whether cache_check supports the needs-check flag... yes
checking whether to enable readline... maybe
checking whether to enable realtime support... yes
checking whether to enable OCF resource agents... no
checking for default run directory... /run
checking whether to build cluster LVM daemon... none
checking whether to build cluster mirror log daemon... no
checking whether to enable debugging... no
checking whether gcc accepts -Wjump-misses-init flag... yes
checking whether gcc accepts -Wclobbered flag... yes
checking whether gcc accepts -Wsync-nand flag... yes
checking for C optimisation flag... -O2
checking whether to gather gcov profiling data... no
checking whether to enable unit testing... no
checking whether to enable valgrind awareness of pools... no
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for PKGCONFIGINIT... no
pkg-config initialized
checking for VALGRIND... no
checking whether to use device-mapper... yes
checking whether to build LVMetaD... yes
checking whether to build lvmpolld... yes
checking whether to build lvmlockdsanlock... no
checking whether to build lvmlockddlm... no
checking whether to build lvmlockd... no
checking defaults for use_lvmetad... 1
checking defaults for use_lvmpolld... 1
checking whether to build dmfilemapd... no
checking whether to build notifydbus... yes
checking for NOTIFY_DBUS... yes
checking whether to enable libblkid detection of signatures when
wiping... maybe
checking for BLKID... yes
checking whether to use udev-systemd protocol for jobs in background...
maybe
checking for SYSTEMD... yes
checking whether to enable synchronisation with udev processing... yes
checking for UDEV... yes
checking for udev_device_get_is_initialized in -ludev... no
checking whether to enable installation of udev rules required for
synchronisation... yes
checking whether to enable executable path detection in udev rules... no
checking whether udev supports built-in blkid... yes
checking whether to enable O_DIRECT... yes
checking whether to build liblvm2app.so application library... yes
checking whether to compile liblvm2cmd.so... yes
checking whether to include Python D-Bus support... yes
checking whether to build Python wrapper for liblvm2app.so... no
checking whether to build Python2 wrapper for liblvm2app.so... no
checking whether to build Python3 wrapper for liblvm2app.so... yes
checking for a Python interpreter with version >= 3... python3
checking for python3... /usr/bin/python3
checking for python3 version... 3.5
checking for python3 platform... linux
checking for python3 script directory...
${prefix}/lib/python3.5/site-packages
checking for python3 extension module directory...
${exec_prefix}/lib/python3.5/site-packages
checking for python3-config... /usr/bin/python3-config
checking python3 module: pyudev... yes
checking python3 module: dbus... yes
checking whether to install fsadm... yes
checking whether to install blkdeactivate... yes
checking whether to use dmeventd...
checking for getline in -lc... no
checking for canonicalize_file_name in -lc... no
checking for dlopen in -ldl... no
checking for log10 in -lm... no
configure: error: bailing out
--------------------- snap -------------------------


What can I do?
Tfh!
Oliver
