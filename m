From: Stefan Weigel <sw@global-linxs.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210161748.48980.sw@global-linxs.de>
Subject: [linux-lvm] problem with lvm on root-fs
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
Date: Wed Oct 16 11:22:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!
I'm trying to get lvm on my root-fs working. But there's is an kernel-pan=
ic=20
error. Some details:

- system with Mylex RAID-controller (DAC960). It's included in the initrd=
=2E

- root-partition is /dev/rd/c0d0p1

I used the HowTo from sistina.com, copied the files from /dev/rd/c0d0p1 t=
o=20
/dev/sysvg/rootlv, edited the /etc/fstab pointing to the new partition=20
/dev/sysvg/rootlv.
I made a reboot and everything worked fine. But in /etc/lilo.conf there's=
 the=20
entry root=3D/dev/rd/c0d0p1. I changed this entry to /dev/sysvg/rootlv. T=
hen I=20
run lilo. After another reboot I got the kernel panic.
The initrd is IMO working. But when I change the "root=3D" entry in=20
/etc/lilo.conf a kernel panic occurs.
Can anybody help me ??

Best regards=20

Stefan Weigel
