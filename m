From: Martin Webster <mwebster@ntlworld.com>
Subject: [linux-lvm] Removing a SCSI device
Date: Mon, 8 Oct 2001 17:15:29 +0000
MIME-Version: 1.0
Message-Id: <01100817152901.01127@lagothrix>
Content-Transfer-Encoding: quoted-printable
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I want to remove an internal Zip drive (SCSI ID#2) to make way for a DVD=20
drive. However, I have two SCSI drives set-up with LVM as follows and rea=
lise=20
that removing the Zip drive will cause a number of problems. Here's my=20
current configuration:

sda Hard disk 0 (boot) - ID#0
sdb Zip disk - ID#1
sdc Hard disk 1 - ID#2
cdrecorder - ID#6

/ (root) is /dev/sdc5 (reiserfs)
/boot is /dev/sda5 (ext2)
swap is /dev/sda6
Everything else is on the LVM spanning two physical volumes: one logical=20
volume.

And here's what I plan to do:

1. Unplug the Zip drive and change SCSI ID of Hard disk 1 to ID#1
2. Boot system into single user mode: linux S root=3D/dev/sdb5
3. Remount root filesystem and /boot as read/write:=20
mount -n -o remount, rw /
mount -n -o remount, rw /boot
4. Edit /etc/lilo.conf and change instances of "sdc " to "sdb"
5. Run mk_initrd followed by LILO:
mk_initrd && /sbin/lilo
6. Re-boot

What I am uncertain of is whether this approach will work with LVM. Can a=
ny=20
one advise?

BTW, I'm using SuSE 7.2 Professional.

TIA,

M
--=20
Martin Webster <mwebster@ntlworld.com>
Registered Linux User #230322
http://homepage.ntlworld.com/spider-monkey/
