From: Ivan Uzunov <dj@online.bg>
Message-ID: <Pine.LNX.4.30.0211062334420.1036-100000@localhost.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] PVscan Question.
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
Date: Wed Nov  6 15:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

	Hi :)

	I have small and may be stupid questions, I run LVM 1.0.6 with
kernel 2.4.19 onto redhat system. The LVM is running but when i run
pvdisplay command onto one of the HDD into LVM output is :

PV Name               /dev/hdc1
VG Name               home
PV Size               76.69 GB [160836417 secs] / NOT usable 16.18 MB
[LVM: 143
KB]
PV#                   3
PV Status             NOT available
			^^^^^^^^^^^

What's this mean ?

I have 6 HDD in this LVM and
HDD : /dev/hda7 /dev/hdc1 /dev/hde1 /dev/hdh1 has this status ; other for
example /dev/hdb1 is :
PV Status             available
		       ^^^^^^^^^


	And second when i run pvscan program i see this :

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg"  is in no VG  [8.01 GB]
pvscan -- ACTIVE   PV "/dev/hdg1" of VG "home" [76.67 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh1" of VG "home" [114.47 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hde1" of VG "home" [76.67 GB / 0 free]
pvscan -- inactive PV "/dev/hdc"  is in no VG  [8.01 GB]
pvscan -- ACTIVE   PV "/dev/hdc1" of VG "home" [76.67 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hda7" of VG "home" [60 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "home" [114.47 GB / 0 free]
pvscan -- total: 8 [535.10 GB] / in use: 6 [519.09 GB] / in no VG: 2
[16.01 GB]

	Where this 16Gigs goes ? 8 onto /dev/hdg and 8 onto /dev/hdc
Can i extend LVM volume and use this Gigs without destroying data onto LVM
?

Thank You.


						WWell : Ivan Uzunov
