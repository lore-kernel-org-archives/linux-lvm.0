Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i92JrLr05813
	for <linux-lvm@redhat.com>; Sat, 2 Oct 2004 15:53:21 -0400
Received: from kamion.habulin.si (kamion.habulin.si [193.95.242.17])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i92JrKvL000579
	for <linux-lvm@redhat.com>; Sat, 2 Oct 2004 15:53:20 -0400
Received: from [10.151.16.5] (thor.krneki.org [193.77.155.75])
	(authenticated bits=0)
	by kamion.habulin.si (8.13.1/8.13.1) with ESMTP id i92Jr7wW030433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 2 Oct 2004 21:53:08 +0200
Message-ID: <415F06D7.9090409@habulin.si>
Date: Sat, 02 Oct 2004 21:51:51 +0200
From: Miha Verlic <miha@habulin.si>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cant find PV after boot sector rewrite
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,
I have (or better yet - had) 3x200gb drives joint up together with LVM1. 
PV were created directly on /dev/hde, /dev/hdf, /dev/hdg, without any 
partitions made before. On top of the ~600gb VG I created ext3 partition 
and everything worked for a few months, but now I had to move disks to a 
new server. I exported drives with with "vgchange -an mix" and "vgexport 
mix" successfully, however LILO on new machine was complaining about 
duplicated volume IDs (although it still booted).
"lilo -T vol-ID" showed 00000002 volume IDs on all three drives, so I ran:
"lilo -z -M /dev/hde"
"lilo -z -M /dev/hdf"
"lilo -z -M /dev/hdg"
and a few second later, it occured to me, this *might* change 
bootsectors of all drives. Of course pvscan did not find any physical 
volumes anymore.
Lilo does create backup files every time you run it, however since I ran 
it 3 times, I only have backup of boot sector for one drive - hdg. I 
have successfully "imported" boot sector of /dev/hdg back with "dd 
if=/boot/boot.2140 of=/dev/hdg", however boot sectors from /dev/hde and 
/dev/hdf remains lost. After restoring boot sector, pvscan now finds 1 
inactive PV /dev/hdg in exported VG "mix".
Is there any way to get back/recreate the whole PV without loosing any 
data? All I'm actually missing is 2x512bytes in boot sectors :(

Oh yeah some useful (or not) info: PV is not root partition, lvm 1.0.8, 
linux is 2.4.27, glibc 2.3.2, system is slightly modified slackware 10.
-- 
Miha
