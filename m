Message-ID: <3D6226F9.8080906@mindmatics.de>
From: Andreas Baier <andreas.baier@mindmatics.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Strange behaviour on a SuSE8.0 with LVM
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
Date: Tue Aug 20 06:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi all,

I am posting this error since I don=B4t know what is going wrong and how =

severe this condition is.

This is from my syslog and the message repeats a thousand times


  20 13:20:10 cruise kernel: lvm -- lvm_blk_ioctl: unknown command x24b


One Filesystem on this volume was severly ruined, I had to reinstall=20
from a backup.

My system is a SuSE8-0 professional with the SuSE-Kernel
2.4.18-4GB #1 Wed Mar 27 13:57:05 UTC 2002 i686 unknown

My LVM-utils are Version
backup1:~ # vgdisplay --version
vgdisplay: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)



--=20
Andreas Baier
MindMatics AG			fon:      +49 (0)89 322986-0 =09
Frankfurter Ring 193a		fax:      +49 (0)89 9227 9897
80807 Munich			internet: www.mindmatics.de
Germany=20

-------------------------------------------------------------------
Besuchen Sie uns vom 1.-3.09.2002 auf der DIMA (Halle 4 Stand A24)
und melden Sie sich schon jetzt f=FCr den Messe SMS Service an unter:
http://www.mindmatics.de Wir freuen uns auf Ihren Besuch!
