Message-Id: <3C686693.2060007@miracleas.dk>
From: Peter Gram <peter.gram@miracleas.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM Redhat 7.2 : Volume Group not activated on boot
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
Date: Mon Feb 11 18:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux LVM <linux-lvm@sistina.com>
Cc: Peter Gram - Miracle A/S <peter.gram@miracleas.dk>

Hi

I have this problem that I hope some of you out there might be able to=20
help with ?

My problem is on boot of the machine I get a  error from the mount=20
process that it can not mount and check my file system
"/dev/vg01/vg01lv01" and a option to go into singe user mode where I can=20
se that the "vgchange -a y" is not run to activate
the volume group. I have looked at the rc.sysinit and there is this=20
entry that should activate all defined volume groups.
Have any of you out in cyberspace seen the same problem with Redhat 7.2 ?

cut from the /etc/rc.d/rc.sysinit :

# LVM initialization
if [ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ]; then
        action $"Setting up Logical Volume Management:" /sbin/vgscan &&=20
/sbin/vgchange -a y
fi

My setup :

HP Omnibook 6000 laptop
Redhat 7.2
I have installed the "new" 2.4.17 Linux kernel
VLM support works (That is I can create lv's and I use ext3 file system=20
on them)
I have added my lvm to fstab and are able to mount/umount the file=20
system without problems

cut from fstab :

/dev/vg01/vg01lv01      /home5/pgram/dev        ext3    defaults        1 2





--=20

/regards

Peter Gram

Phone : +45 2527 7107
Fax   : +45 4466 8856

Miracle A/S
Kratvej 2
2760 M=EF=BF=BDlev
http://miracleas.dk
