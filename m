From: grobe@gmx.de
MIME-Version: 1.0
Message-ID: <8189.1053716777@www16.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM on Mylex DAC 960 (Raid1)
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
Date: Fri May 23 14:05:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi!=20
=20
I know that this is a known problem, but I didn't find the=20
solution so far, so I have to ask here now...=20
=20
I have some machines with Mylex-controllers that are to=20
be used with RAID1s. As the controller supports only=20
6 partitions (and fo other reasons, too) I wanted to use=20
LVM on this. I have created a primary /boot, a /swap and=20
a logical partition in an extended one that became type "LVM".=20
I am doing all this in SuSE 8.1's installation routine (Yast).=20
=20
I have choosed a VG, put the PV into it, and created LVs for=20
/, /usr, /var, /tmp, /home, however, when Yast is going to=20
execute the steps choosen before, I get a failure by pvcreate=20
(can't get device size of /dev/rd/c0d0p5).=20
=20
I know that the Mylex raidset appears in a somehow special=20
device in the Linux devtree, but I am quite sure it is possible=20
to put LVM on top of it - now I just wonder how to do this?=20
=20
Thank You, CU, Lars.=20

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=EF=BF=BDcheln! Fotogalerie online mit GMX ohne eigene Homepage!
