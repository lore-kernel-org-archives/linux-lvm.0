content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Snapshot creating problem
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4A5@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
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
Date: Mon Mar 17 12:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Oh - sorry for the omission:

LVM version: 1.95.15
Library version 0.96.07-ioctl-cvs
driver version: 1.0.8

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com


-----Original Message-----
From: Barry, Christopher=20
Sent: Monday, March 17, 2003 1:21 PM
To: Lvm (E-mail)
Subject: [linux-lvm] Snapshot creating problem


Hi all,
	I'm experimenting with lvm2 on a patched 2.4.20 kernel with xfs =
filesystem volumes on a dual 2.4GHz Xeon box.

I built a pv on a 1.8TB RAID 5 array, (/dev/sda), created a volume group =
(vg0), and created several logical volumes:
data 200G xfs
home 200G xfs
backup 600G xfs
installs 200G xfs

I dd'd from /dev/zero a 500MB file onto the data lv.

I then used lvcreate -s -n snaptest -c 1M -L 200G /dev/vg0/data

The command returned with the following error:
device-mapper ioctl cmd 2 failed: Invalid argument
couldn't load device 'vg0-snaptest'
logical volume snaptest created

Any ideas of what I'm doing wrong? An lvs shows it there, but it does =
not seem to appear in /dev/vg0/ and I cannot mount it.


Thanks,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
