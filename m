From: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <Pine.LNX.4.53.0307181659170.6115@localhost.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] problem building LVM2 for 2.6 kernel
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
Date: Fri Jul 18 16:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  in trying to set up LVM for the 2.6 kernel, i configured the
2.6.0-test1-ac2 version and selected device mapper and v4 ioctl
(this version of the kernel did not appear to need any patching),
rebuilt, and rebooted with the new kernel, and that seemed to go
smoothly.

  i then built and installed libdevmapper (the latest version
from today), and that again went smoothly.

  but when i tried to build the final LVM2 utilities, i ran

  # ./configure --with-lvm1=none
  # make

 which eventually produced:

...

device/dev-io.c: In function `dev_get_size':
device/dev-io.c:215: `BLKGETSIZE64' undeclared (first use in this function)
device/dev-io.c:215: (Each undeclared identifier is reported only once
device/dev-io.c:215: for each function it appears in.)
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [lib] Error 2

  is there something i did wrong?  a patch i forgot to install?
thanks.

rday
