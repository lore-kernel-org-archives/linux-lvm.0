From: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <Pine.LNX.4.44.0312020510230.4857-100000@localhost.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] still need to install device mapper with 2.6 kernel?
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
Date: Tue Dec  2 07:51:42 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM mailing list <linux-lvm@sistina.com>

  i think i'm confused about the support for device mapper in the 
2.6 kernel.  i'm aware that i need to install device-mapper for
LVM2, and i know where to get the device-mapper tarball.

  but, in the configuration process for the 2.6 kernel, you can 
select device mapper support, so i did and built it into the
kernel.  i assumed (perhaps unwisely) that device mapper was now
part of the 2.6 kernel source tree, and i now had it since i'd
selected it as part of the configuration in the kernel build for
my 2.6.0-test11 kernel.  therefore, i didn't need to explicitly 
install device-mapper anymore.

  however, when i went to configure/make LVM2 on my FC1 system,
the configure worked fine, but the make gave me:

...

gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT 
-DO_DIRECT_SUPPORT -DHAVE_LIBDL -DHAVE_GETOPTLONG -fPIC -Wall -Wundef 
-Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes 
-Wmissing-declarations -Wnested-externs -Winline -O2 cache/lvmcache.c -o 
cache/lvmcache.o
In file included from activate/activate.c:9:
activate/activate.h:13:28: libdevmapper.h: No such file or directory
activate/activate.c: In function `library_version':
activate/activate.c:119: warning: implicit declaration of function 
`dm_get_library_version'
activate/activate.c: In function `driver_version':
activate/activate.c:133: warning: implicit declaration of function 
`dm_task_create'
activate/activate.c:133: error: `DM_DEVICE_VERSION' undeclared (first use 
in this function)
activate/activate.c:133: error: (Each undeclared identifier is reported 
only once
activate/activate.c:133: error: for each function it appears in.)
activate/activate.c:133: warning: assignment makes pointer from integer 
without a cast
activate/activate.c:138: warning: implicit declaration of function 
`dm_task_run'
activate/activate.c:141: warning: implicit declaration of function 
`dm_task_get_driver_version'
activate/activate.c:147: warning: implicit declaration of function 
`dm_task_destroy'
activate/activate.c: In function `_lv_info':
activate/activate.c:160: error: storage size of `dminfo' isn't known
activate/activate.c:160: warning: unused variable `dminfo'
make[1]: *** [activate/activate.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/home/rpjday/SW/lvm/LVM2.2.00.08/lib'
make: *** [lib] Error 2


  note the reference to no libdevmapper.h file.  so what's the
proper recipe?  what exactly was the effect of adding device-mapper
support to my kernel?  do i still have to explicitly configure/make
and install device-mapper myself?  am i just confused?

rday
