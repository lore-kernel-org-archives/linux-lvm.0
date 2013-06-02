Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r529PZm7008766
	for <linux-lvm@redhat.com>; Sun, 2 Jun 2013 05:25:35 -0400
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r529PXVZ015949
	for <linux-lvm@redhat.com>; Sun, 2 Jun 2013 05:25:34 -0400
Received: by mail-bk0-f43.google.com with SMTP id jm19so352938bkc.2
	for <linux-lvm@redhat.com>; Sun, 02 Jun 2013 02:25:33 -0700 (PDT)
Received: from gmail.com (nat-pool-pnq-t.redhat.com. [209.132.188.26])
	by mx.google.com with ESMTPSA id
	jm15sm17819047bkb.13.2013.06.02.02.25.30 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 02:25:32 -0700 (PDT)
Date: Sat, 1 Jun 2013 23:50:10 -0400
From: Kumar amit mehta <gmate.amit@gmail.com>
Message-ID: <20130602035010.GB17194@gmail.com>
References: <20130602033724.GA17194@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130602033724.GA17194@gmail.com>
Subject: Re: [linux-lvm] segfault with pvcreate command
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Jun 01, 2013 at 11:37:24PM -0400, Kumar amit mehta wrote:
> Hi,
> 
> I'm observing a weird segfault with any of the lvm commands (pvcreate, 
> lvcreate etc). Please note that these tools worked fine when I was using
> the lvm2 package installed from the red hat repository. Only recently, I
> had removed the lvm2 package(yum remove lvm2) and have built the lvm
> tools by cloning the git repo and following the straight-forward steps
> of ./configure; make; make install.
> 
> Some information about my system and error logs.
> <snip>
> # cat /etc/redhat-release 
> Red Hat Enterprise Linux Server release 6.4 (Santiago)
> 
> # uname -a
> Linux snow 2.6.32-358.el6.x86_64 #1 SMP Tue
> Jan 29 11:47:41 EST 2013 x86_64 x86_64 x86_64 GNU/Linux
> 
> # rpm -qa|grep -i mapper
> device-mapper-multipath-0.4.9-64.el6.x86_64
> device-mapper-1.02.77-9.el6.x86_64
> device-mapper-event-1.02.77-9.el6.x86_64
> device-mapper-multipath-libs-0.4.9-64.el6.x86_64
> device-mapper-persistent-data-0.1.4-1.el6.x86_64
> device-mapper-libs-1.02.77-9.el6.x86_64
> device-mapper-event-libs-1.02.77-9.el6.x86_64
> 
> # rpm -qa|grep -i lvm2
> lvm2-libs-2.02.98-9.el6.x86_64
> 
> # git config --get remote.origin.url
> git://git.fedorahosted.org/git/lvm2.git
> 
> # pvcreate
> Segmentation fault (core dumped)
> 
> # file core.17231 
> core.17231: ELF 64-bit LSB core file x86-64, version 1 (SYSV),
> SVR4-style, from 'pvcreate'
> 
> # ldd `which pvcreate`
> 	linux-vdso.so.1 =>  (0x00007fffd36e9000)
> 	libdl.so.2 => /lib64/libdl.so.2 (0x00007f012220e000)
> 	libdevmapper.so.1.02 => /lib64/libdevmapper.so.1.02
> (0x00007f0121fd4000)
> 	libc.so.6 => /lib64/libc.so.6 (0x00007f0121c40000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f0122418000)
> 	libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f0121a21000)
> 	libsepol.so.1 => /lib64/libsepol.so.1 (0x00007f01217e4000)
> 	libudev.so.0 => /lib64/libudev.so.0 (0x00007f01215d5000)
> 
> # gdb -q pvcreate core.17231
> Reading symbols from /sbin/pvcreate...(no debugging symbols
> found)...done.
> [New Thread 17231]
> Reading symbols from /lib64/libdl.so.2...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/libdl.so.2
> Reading symbols from /lib64/libdevmapper.so.1.02...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/libdevmapper.so.1.02
> Reading symbols from /lib64/libc.so.6...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/libc.so.6
> Reading symbols from /lib64/ld-linux-x86-64.so.2...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/ld-linux-x86-64.so.2
> Reading symbols from /lib64/libselinux.so.1...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/libselinux.so.1
> Reading symbols from /lib64/libsepol.so.1...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/libsepol.so.1
> Reading symbols from /lib64/libudev.so.0...(no debugging symbols
> found)...done.
> Loaded symbols for /lib64/libudev.so.0
> Reading symbols from
> /lib/modules/2.6.32-358.el6.x86_64/vdso/vdso.so...Reading symbols from
> /usr/lib/debug/lib/modules/2.6.32-358.el6.x86_64/vdso/vdso.so.debug...done.
> done.
> Loaded symbols for /lib/modules/2.6.32-358.el6.x86_64/vdso/vdso.so
> Core was generated by `pvcreate'.
> Program terminated with signal 11, Segmentation fault.
> #0  0x00007f6d5c375403 in ?? () from /lib64/libdevmapper.so.1.02 <---
> Missing separate debuginfos, use: debuginfo-install
> device-mapper-libs-1.02.77-9.el6.x86_64 glibc-2.12-1.107.el6.x86_64
> libselinux-2.0.94-5.3.el6.x86_64 libsepol-2.0.41-4.el6.x86_64
> libudev-147-2.46.el6.x86_64
> (gdb) bt
> #0  0x00007f6d5c375403 in ?? () from /lib64/libdevmapper.so.1.02
> #1  0x0000000000447bd0 in merge_config_tree ()
> #2  0x0000000000444588 in _merge_config_files ()
> #3  0x0000000000446b07 in create_toolcontext ()
> #4  0x00000000004217da in init_lvm ()
> #5  0x0000000000425a75 in lvm2_main ()
> #6  0x00007f6d5bfe1cdd in __libc_start_main () from /lib64/libc.so.6
> #7  0x0000000000413569 in _start ()
> 
> <snip>
> 
> Q1: I think this could be due to some mismatch between the dev-mapper
> (from yum repo) and the lvm2(from git repo), but if it's not then in
> order to debug further, is there a way to get the debug packages or
> built one from the lvm2 sources ?
> 
> Q2: In my case, the segfault seem to be happening in the dev-mapper
> library, so in order to debug dev-mapper library issues, should i be
> reporting this in a dm-mapper mailing list? 
> 
> Q3: Why there is no 'make uninstall' option in the lvm2 git repo tree?
> After seing this segfault, I thought of cleanup and re-installing lvm2
> package from the yum repo, but before that I wish to remove all the
> lvm2 binaries and shared objects that got installed, but there seem to be 
> no clean way of doing so.
> 
> -Amit

My apologies for being impatient. I just remove the lvm2-libs
package(mentioned in my previous mail) and everything seem to be working 
fine now.

<snip>
# yum remove lvm2-libs
---> Package lvm2-libs.x86_64 0:2.02.98-9.el6 will be erased
Removed:
  lvm2-libs.x86_64 0:2.02.98-9.el6                                                                                                                                              

Complete!
# which pvcreate
/sbin/pvcreate
# pvcreate
  Please enter a physical volume path
  Run `pvcreate --help' for more information.
# pvcreate /dev/vdd1
  Physical volume "/dev/vdd1" successfully created
<snip>

However, I'd appreciate a lot if you can look into my concern, mentioned
in "Q3" in my previous mail and guide me to build the debug package of
lvm2.

-Amit
