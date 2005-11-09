Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA9855V31723
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 03:05:05 -0500
Received: from dgate1.fujitsu-siemens.com (dgate1.fujitsu-siemens.com
	[217.115.66.35])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA984trZ021325
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 03:04:56 -0500
Received: from [172.25.76.98] (hvr0011m.hvr.fsc.net [172.25.76.98])
	by plam.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	jA984qZk004768
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 09:04:55 +0100
Message-Id: <200511090804.jA984qZk004768@plam.pdb.fsc.net>
From: "Diedrich Ehlerding" <diedrich.ehlerding@fujitsu-siemens.com>
Date: Wed, 09 Nov 2005 09:04:52 +0100
MIME-Version: 1.0
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] boot sequence of lvm and dm_multipath
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello. 

I am trying to run dm_multipath (mpio) against an EMC Clariion array on 
a SuSE SLES) system. According to 
http://portal.suse.com/sdb/en/2005/04/sles_multipathing.html 
this should work, and it does to a certain degree, but I have problem 
with lvm integration on a system which has an lvm boot disk 
configuration.

This  is the environment:

hges3302:~ # rpm -q multipath-tools
multipath-tools-0.4.4-0.22
hges3302:~ # uname -a
Linux hges3302 2.6.5-7.201-bigsmp #1 SMP Thu Aug 25 06:20:45 UTC 2005 
i686 i686
i386 GNU/Linux
hges3302:~ # cat /etc/SuSE-release
SUSE LINUX Enterprise Server 9 (i586)
PATCHLEVEL = 2
VERSION = 9

The server is a Fujitsu Siemens Primergy with an internal raid 
controller and two Emulex lp9802 HBAs; driver is lpfc 8.0.16.  

Everything works fine if I start SuSE's /etc/init.d/boot.multipath 
(which simply loads dm-multiptah) and /etc/init.d/multipathd manually, 
having booted the server without multipath. Once starting 
boot.multipath and multipathd manually, I can pvscan the Clariion, 
vgchange -ay the volumegroups etc.; and the path failover works fine.

However, I would like to detect the volume groups at boot time; not 
manually. But if I put boot.multpath and multipathd (wich SuSE 
delivers) into the boot sequence (insserv boot.multipath / multipathd), 
I run into problems with lvm. My server has its root file system on an 
internal disk, and this disk is under lvm control too. I tried booting 
lvm after boot.multipath as well as loading first multipath, then lvm. 
I dont get any boot time error messages.

Having booted the server in this way, multipath detects the disks 
properly, i.e it cretes /dev/disk/by-name/<UID> etc - but lvm is not 
willing to detect these disks; i.e. pvscan shows only the internal 
disks sda and sdb.

Here is the relevant part of my lvm.conf in both cases:
######  accept  mpioDevices and the boot disks, but nothing else
    filter=[ "a|/dev/disk/by-name/.*|","a|/dev/sda.*|","a|/dev/sdb|"
,"r|.*|" ]
    types = [ "device-mapper",253 ]

If I create a rc-script by myself (containing nothing but "/etc/init.d 
boot.multipath start; /etc/init.d/multipathd start") and run it later 
at the end of rc5.d, then again everything is fine and pvscan detects 
the disks.

Is there anybody who can give me some recommendation conderning the 
sequence to start dm_multipath and lvm at bot time? Should I try to 
"sleep 10" or something the like after booting multipath and before 
booting lvm?

TIA, 
-- 
Diedrich Ehlerding, Fujitsu Siemens Computers, S DE SE PS N/O
Hildesheimer Str 25, D-30880 Laatzen
diedrich.ehlerding@fujitsu-siemens.com
Fon +49 511 8489-1806, Fax -251806, Mobil +49 173 2464758
