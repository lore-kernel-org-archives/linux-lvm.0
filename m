Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28Hho828197
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 12:43:50 -0500
Received: from exch-calgary.int.pason.com (hemlock.pason.com [208.38.1.1])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i28HhnST014431
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 12:43:50 -0500
From: "Donald Murray P.Eng." <donald.murray@pason.com>
Message-Id: <20040308104349.6347c531.donald.murray@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems compiling device-mapper 1.00.08 on RedHat 7.2 with
 linux-2.4.22
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  8 12:42:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm <linux-lvm@redhat.com>

Is anyone running LVM2 on RedHat 7.2?

I'm trying to build LVM2 support for a RedHat 7.2 box. We use a 2.4.22 kernel 
from kernel.org. We only want LVM so we can do snapshot-based backups of a MySQL 
database. 

Following the instructions in the device-mapper 1.00.08 INSTALL, I've successfully
completed the following steps:
    ./configure --with-kernel-dir=/home/dmurray/kernel/linux-2.4.22
    make apply-patches
    make menuconfig 
    (LVM, Device-mapper, Mirror (RAID-1) support all compiled into the kernel)
    make dep && make bzImage && make modules

So far, so good.

When I tried to build the libdevmapper.so library, it failed on an undeclared
DM_LIST_VERSIONS:

dmurray@dmdev:/home/dmurray/kernel/device-mapper.1.00.08> make
make -C include
make[1]: Entering directory `/home/dmurray/kernel/device-mapper.1.00.08/include'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/dmurray/kernel/device-mapper.1.00.08/include'
make -C man
make[1]: Entering directory `/home/dmurray/kernel/device-mapper.1.00.08/man'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/dmurray/kernel/device-mapper.1.00.08/man'
make -C lib
make[1]: Entering directory
`/home/dmurray/kernel/device-mapper.1.00.08/lib' gcc -c -Iioctl
-I. -I../include -I/home/dmurray/kernel/linux-2.4.22/include
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align
-Wwrite-strings -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline -O2 ioctl/libdevmapper.c -o
ioctl/libdevmapper.o
ioctl/libdevmapper.c:84: `DM_LIST_VERSIONS' undeclared here (not in a function)
ioctl/libdevmapper.c:84: initializer element is not constant
ioctl/libdevmapper.c:84: (near initialization for `_cmd_data_v4[16].cmd')
make[1]: *** [ioctl/libdevmapper.o] Error 1
make[1]: Leaving directory `/home/dmurray/kernel/device-mapper.1.00.08/lib'
make: *** [lib] Error 2
dmurray@dmdev:/home/dmurray/kernel/device-mapper.1.00.08>

Any suggestions? Should we stick with LVM1 instead on RedHat 7.2?



 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473
