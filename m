From: Rene Schumann <rene@athome.dyndns.org>
Subject: [linux-lvm] vgscan cant find my vg
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210061951.40392.rene@athome.dyndns.org>
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
Date: Sun Oct  6 12:54:10 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello!

Thanks for your help.
A missing Modul is not my problem.
I do not have a scsi only Kernel and both, Mandrake inst. kernel and my n=
ormal=20
Kernel are standard Mandrake Kernels with all Moduls.
Vgscan still fails to find my vg01
Can someone please tell me how i can safe my data?
thx



--------------------------------
Hi Rene,

I had such a situation some time ago, too.
I had 2 scsi disks and a scsi-only kernel, with ide just as a loadable=20
module. I added an ide disk to the running vg and all was ok until I=20
rebooted. When booting up, my system lacked the ide-module so the hole=20
vg was not recognized by the kernel.
Then I had two possibilities: compiling a new kernel with the ide-disk=20
compiled into, or building a new initrd with the ide-module. Now the=20
system is up perfectly well.
