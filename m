Message-Id: <200308122330.h7CNUco11467@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] compiling lvm2.2.00.05 w/ linux-2.6.0-test3
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Aug 12 18:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello, I'm having a little problem building the lvm2 tools.  I'm
starting with a RedHat 8.0 distro, built the 2.6.0-test3 kernel with
CONFIG_BLK_DEV_DM=y and CONFIG_DM_IOCTL_V4=y, built and installed
device-mapper 1.00.02.  Then I created a simlink from /usr/include/linux
to the 2.6.0-test3 include/linux directory.  When I try to build the
lvm2 2.00.05 tools, I get the following errors:

gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL -DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2 filters/filter-composite.c -o filters/filter-composite.o
In file included from /usr/include/linux/fs.h:9,
                 from device/dev-io.c:24:
/usr/include/linux/config.h:6:22: asm/kgdb.h: No such file or directory
In file included from /usr/include/linux/fs.h:10,
                 from device/dev-io.c:24:
/usr/include/linux/linkage.h:5:25: asm/linkage.h: No such file or directory
In file included from /usr/include/linux/fs.h:16,
                 from device/dev-io.c:24:

I wasn't sure how to best get around this, so I wanted to ask for some
advice.

Thanks!
-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://www.osdl.org/archive/markw/
