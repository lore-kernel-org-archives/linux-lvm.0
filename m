Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAO9qULi003186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 04:52:30 -0500
Received: from clarity.mcc.ac.uk (clarity.mcc.ac.uk [130.88.200.144])
	by mx1.redhat.com (Postfix) with ESMTPS id 522FD8EA3B
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 09:52:29 +0000 (UTC)
Received: from asmtp1.its.manchester.ac.uk ([130.88.13.149])
	by clarity.mcc.ac.uk with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.85 (FreeBSD)) (envelope-from <tony.arnold@manchester.ac.uk>)
	id 1a1AGx-000DI0-Je
	for linux-lvm@redhat.com; Tue, 24 Nov 2015 09:52:27 +0000
Received: from zaphod.itservices.manchester.ac.uk ([130.88.201.81]:38026)
	by asmtp1.its.manchester.ac.uk with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.83)
	(envelope-from <tony.arnold@manchester.ac.uk>) id 1a1AGx-00079z-97
	for linux-lvm@redhat.com; Tue, 24 Nov 2015 09:52:27 +0000
From: Tony Arnold <tony.arnold@manchester.ac.uk>
Message-ID: <5654335A.5050702@manchester.ac.uk>
Date: Tue, 24 Nov 2015 09:52:26 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems creating/converting large logical volume to
	RAID1
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I'm trying to convert one of my logical volumes to be RAID1 mirrored
using LVM on my Ubuntu 15.10 system. When I do, the command lvs shows
the mirror set is 100% synchronized immediately. syslog show a failure
saying one of the devices in the mirror set has failed and it reverts to
a single device mirror set.

Errors include saying attempt to access beyond end of device. There is
also an error showing code=-5 for 'super_written'. A full extract of
syslog is below.

The volume group is configured so:

root@the-circus:~# pvs
  PV         VG        Fmt  Attr PSize PFree
  /dev/sda3  vg0       lvm2 a--  2.73t 1.09t
  /dev/sdb3  vg0       lvm2 a--  2.73t 2.68t

So it's trying to create the mirror devices on /dev/sdb3.

The disks are 3TB Seagate Barracuda disks. They both brand new.

Experimentation shows I only get these errors for logical volumes bigger
than 31GB, anything smaller behaves correctly.

My version of Ubuntu:

# lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 15.10
Release:	15.10
Codename:	wily

Kernel is:

# uname -a
Linux the-circus 4.2.0-18-generic #22-Ubuntu SMP Fri Nov 6 18:25:50 UTC
2015 x86_64 x86_64 x86_64 GNU/Linux


Anyone any ideas? I've googled this until the cows come home but cannot
find anything helpful.

Regards,
Tony.

Nov 21 17:29:52 the-circus kernel: [  231.538111] device-mapper: raid:
Loading target version 1.7.0
Nov 21 17:29:52 the-circus kernel: [  231.541976] device-mapper: raid:
Superblocks created for new array
Nov 21 17:29:52 the-circus kernel: [  231.542894] md/raid1:mdX: not
clean -- starting background reconstruction
Nov 21 17:29:52 the-circus kernel: [  231.542897] md/raid1:mdX: active
with 2 out of 2 mirrors
Nov 21 17:29:52 the-circus kernel: [  231.542899] Choosing daemon_sleep
default (5 sec)
Nov 21 17:29:52 the-circus kernel: [  231.542903] created bitmap (50
pages) for device mdX
Nov 21 17:29:52 the-circus kernel: [  231.542906] attempt to access
beyond end of device
Nov 21 17:29:52 the-circus kernel: [  231.542908] dm-7: rw=13329,
want=18446744073709551608, limit=8192
Nov 21 17:29:52 the-circus kernel: [  231.542909] md: super_written gets
error=-5, uptodate=0
Nov 21 17:29:52 the-circus kernel: [  231.542920] md/raid1:mdX: Disk
failure on dm-8, disabling device.
Nov 21 17:29:52 the-circus kernel: [  231.542920] md/raid1:mdX:
Operation continuing on 1 devices.
Nov 21 17:29:52 the-circus kernel: [  231.542933] attempt to access
beyond end of device
Nov 21 17:29:52 the-circus kernel: [  231.542936] dm-5: rw=13329,
want=18446744073709551608, limit=8192
Nov 21 17:29:52 the-circus kernel: [  231.542939] md: super_written gets
error=-5, uptodate=0
Nov 21 17:29:52 the-circus kernel: [  231.569851] attempt to access
beyond end of device
Nov 21 17:29:52 the-circus kernel: [  231.569859] dm-5: rw=13329,
want=18446744073709551608, limit=8192
Nov 21 17:29:52 the-circus kernel: [  231.569863] md: super_written gets
error=-5, uptodate=0
Nov 21 17:29:52 the-circus kernel: [  231.596802] mdX: bitmap file is
out of date, doing full recovery
Nov 21 17:29:52 the-circus kernel: [  231.712193] mdX: bitmap
initialized from disk: read 4 pages, set 102400 of 102400 bits
Nov 21 17:29:52 the-circus systemd[1]: Started Device-mapper event daemon.
Nov 21 17:29:52 the-circus dmeventd[3132]: dmeventd ready for processing.
Nov 21 17:29:52 the-circus kernel: [  231.786858] RAID1 conf printout:
Nov 21 17:29:52 the-circus kernel: [  231.786863]  --- wd:1 rd:2
Nov 21 17:29:52 the-circus kernel: [  231.786866]  disk 0, wo:0, o:1,
dev:dm-6
Nov 21 17:29:52 the-circus kernel: [  231.786868]  disk 1, wo:1, o:0,
dev:dm-8
Nov 21 17:29:52 the-circus kernel: [  231.793942] RAID1 conf printout:
Nov 21 17:29:52 the-circus kernel: [  231.793947]  --- wd:1 rd:2
Nov 21 17:29:52 the-circus kernel: [  231.793949]  disk 0, wo:0, o:1,
dev:dm-6
Nov 21 17:29:52 the-circus kernel: [  231.794033] md: resync of RAID
array mdX
Nov 21 17:29:52 the-circus kernel: [  231.794037] md: minimum
_guaranteed_  speed: 1000 KB/sec/disk.
Nov 21 17:29:52 the-circus kernel: [  231.794039] md: using maximum
available idle IO bandwidth (but not more than 200000 KB/sec) for resync.
Nov 21 17:29:52 the-circus kernel: [  231.794042] md: using 128k window,
over a total of 52428800k.
Nov 21 17:29:52 the-circus kernel: [  231.794196] md: mdX: resync done.
Nov 21 17:29:53 the-circus kernel: [  232.037242] RAID1 conf printout:
Nov 21 17:29:53 the-circus kernel: [  232.037248]  --- wd:1 rd:2
Nov 21 17:29:53 the-circus kernel: [  232.037251]  disk 0, wo:0, o:1,
dev:dm-6
Nov 21 17:29:53 the-circus lvm[3132]: Monitoring RAID device vg0-testlv
for events.
Nov 21 17:29:53 the-circus lvm[3132]: Device #1 of raid1 array,
vg0-testlv, has failed.
Nov 21 17:29:53 the-circus lvm[3132]: Use 'lvconvert --repair
vg0/testlv' to replace failed device.

-- 
Tony Arnold, IT Security Analyst, University of Manchester.
T: +44 (0) 161 275 6093, F: +44 (0) 705 344 3082,
M: +44 (0) 773 330 0039, E: tony.arnold@manchester.ac.uk

-- 
ubuntu-users mailing list
ubuntu-users@lists.ubuntu.com
Modify settings or unsubscribe at:
https://lists.ubuntu.com/mailman/listinfo/ubuntu-users
