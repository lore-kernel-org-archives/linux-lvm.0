Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAOGn76Z007389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 11:49:07 -0500
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	by mx1.redhat.com (Postfix) with ESMTPS id 6C8A9D69D9
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 16:49:05 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id tAOGn4gP017260
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 11:49:04 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id tAOGfp7w011581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 11:41:51 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22100.38142.696227.209012@quad.stoffel.home>
Date: Tue, 24 Nov 2015 11:49:02 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <5654335A.5050702@manchester.ac.uk>
References: <5654335A.5050702@manchester.ac.uk>
Subject: Re: [linux-lvm] Problems creating/converting large logical volume
	to	RAID1
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Tony,

Can I make a suggestion to you?  Instead of trying to do the mirroring
in LVM, build yourself an MD mirror, then layer LVM ontop of that
instead.  You get nice seperation.

You can also take that /dev/sdb3, make it into an MD RAID1 array with
just one device, add it into the VG, then move the LVs onto the new
device.  Once that's done, you remove the sda3 from the VG, then add
it into the MD device.  Something like this...

> mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb3 missing
> cat /proc/mdstat
> pvcreate -v /dev/md1
> vgextend -v vg0 /dev/md1
> pvmove -v sda3
> vgreduce -v vg0 sda3
> mdadm --add /dev/md0 /dev/sda3
> cat /proc/mdstat

And you will now be mirrored, etc.  

Tony> I'm trying to convert one of my logical volumes to be RAID1 mirrored
Tony> using LVM on my Ubuntu 15.10 system. When I do, the command lvs shows
Tony> the mirror set is 100% synchronized immediately. syslog show a failure
Tony> saying one of the devices in the mirror set has failed and it reverts to
Tony> a single device mirror set.

Tony> Errors include saying attempt to access beyond end of device. There is
Tony> also an error showing code=-5 for 'super_written'. A full extract of
Tony> syslog is below.

Tony> The volume group is configured so:

Tony> root@the-circus:~# pvs
Tony>   PV         VG        Fmt  Attr PSize PFree
Tony>   /dev/sda3  vg0       lvm2 a--  2.73t 1.09t
Tony>   /dev/sdb3  vg0       lvm2 a--  2.73t 2.68t

Tony> So it's trying to create the mirror devices on /dev/sdb3.

Tony> The disks are 3TB Seagate Barracuda disks. They both brand new.

Tony> Experimentation shows I only get these errors for logical volumes bigger
Tony> than 31GB, anything smaller behaves correctly.

Tony> My version of Ubuntu:

Tony> # lsb_release -a
Tony> No LSB modules are available.
Tony> Distributor ID:	Ubuntu
Tony> Description:	Ubuntu 15.10
Tony> Release:	15.10
Tony> Codename:	wily

Tony> Kernel is:

Tony> # uname -a
Tony> Linux the-circus 4.2.0-18-generic #22-Ubuntu SMP Fri Nov 6 18:25:50 UTC
Tony> 2015 x86_64 x86_64 x86_64 GNU/Linux


Tony> Anyone any ideas? I've googled this until the cows come home but cannot
Tony> find anything helpful.

Tony> Regards,
Tony> Tony.

Tony> Nov 21 17:29:52 the-circus kernel: [  231.538111] device-mapper: raid:
Tony> Loading target version 1.7.0
Tony> Nov 21 17:29:52 the-circus kernel: [  231.541976] device-mapper: raid:
Tony> Superblocks created for new array
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542894] md/raid1:mdX: not
Tony> clean -- starting background reconstruction
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542897] md/raid1:mdX: active
Tony> with 2 out of 2 mirrors
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542899] Choosing daemon_sleep
Tony> default (5 sec)
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542903] created bitmap (50
Tony> pages) for device mdX
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542906] attempt to access
Tony> beyond end of device
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542908] dm-7: rw=13329,
Tony> want=18446744073709551608, limit=8192
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542909] md: super_written gets
Tony> error=-5, uptodate=0
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542920] md/raid1:mdX: Disk
Tony> failure on dm-8, disabling device.
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542920] md/raid1:mdX:
Tony> Operation continuing on 1 devices.
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542933] attempt to access
Tony> beyond end of device
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542936] dm-5: rw=13329,
Tony> want=18446744073709551608, limit=8192
Tony> Nov 21 17:29:52 the-circus kernel: [  231.542939] md: super_written gets
Tony> error=-5, uptodate=0
Tony> Nov 21 17:29:52 the-circus kernel: [  231.569851] attempt to access
Tony> beyond end of device
Tony> Nov 21 17:29:52 the-circus kernel: [  231.569859] dm-5: rw=13329,
Tony> want=18446744073709551608, limit=8192
Tony> Nov 21 17:29:52 the-circus kernel: [  231.569863] md: super_written gets
Tony> error=-5, uptodate=0
Tony> Nov 21 17:29:52 the-circus kernel: [  231.596802] mdX: bitmap file is
Tony> out of date, doing full recovery
Tony> Nov 21 17:29:52 the-circus kernel: [  231.712193] mdX: bitmap
Tony> initialized from disk: read 4 pages, set 102400 of 102400 bits
Tony> Nov 21 17:29:52 the-circus systemd[1]: Started Device-mapper event daemon.
Tony> Nov 21 17:29:52 the-circus dmeventd[3132]: dmeventd ready for processing.
Tony> Nov 21 17:29:52 the-circus kernel: [  231.786858] RAID1 conf printout:
Tony> Nov 21 17:29:52 the-circus kernel: [  231.786863]  --- wd:1 rd:2
Tony> Nov 21 17:29:52 the-circus kernel: [  231.786866]  disk 0, wo:0, o:1,
Tony> dev:dm-6
Tony> Nov 21 17:29:52 the-circus kernel: [  231.786868]  disk 1, wo:1, o:0,
Tony> dev:dm-8
Tony> Nov 21 17:29:52 the-circus kernel: [  231.793942] RAID1 conf printout:
Tony> Nov 21 17:29:52 the-circus kernel: [  231.793947]  --- wd:1 rd:2
Tony> Nov 21 17:29:52 the-circus kernel: [  231.793949]  disk 0, wo:0, o:1,
Tony> dev:dm-6
Tony> Nov 21 17:29:52 the-circus kernel: [  231.794033] md: resync of RAID
Tony> array mdX
Tony> Nov 21 17:29:52 the-circus kernel: [  231.794037] md: minimum
Tony> _guaranteed_  speed: 1000 KB/sec/disk.
Tony> Nov 21 17:29:52 the-circus kernel: [  231.794039] md: using maximum
Tony> available idle IO bandwidth (but not more than 200000 KB/sec) for resync.
Tony> Nov 21 17:29:52 the-circus kernel: [  231.794042] md: using 128k window,
Tony> over a total of 52428800k.
Tony> Nov 21 17:29:52 the-circus kernel: [  231.794196] md: mdX: resync done.
Tony> Nov 21 17:29:53 the-circus kernel: [  232.037242] RAID1 conf printout:
Tony> Nov 21 17:29:53 the-circus kernel: [  232.037248]  --- wd:1 rd:2
Tony> Nov 21 17:29:53 the-circus kernel: [  232.037251]  disk 0, wo:0, o:1,
Tony> dev:dm-6
Tony> Nov 21 17:29:53 the-circus lvm[3132]: Monitoring RAID device vg0-testlv
Tony> for events.
Tony> Nov 21 17:29:53 the-circus lvm[3132]: Device #1 of raid1 array,
Tony> vg0-testlv, has failed.
Tony> Nov 21 17:29:53 the-circus lvm[3132]: Use 'lvconvert --repair
Tony> vg0/testlv' to replace failed device.

Tony> -- 
Tony> Tony Arnold, IT Security Analyst, University of Manchester.
Tony> T: +44 (0) 161 275 6093, F: +44 (0) 705 344 3082,
Tony> M: +44 (0) 773 330 0039, E: tony.arnold@manchester.ac.uk

Tony> -- 
Tony> ubuntu-users mailing list
Tony> ubuntu-users@lists.ubuntu.com
Tony> Modify settings or unsubscribe at:
Tony> https://lists.ubuntu.com/mailman/listinfo/ubuntu-users

Tony> _______________________________________________
Tony> linux-lvm mailing list
Tony> linux-lvm@redhat.com
Tony> https://www.redhat.com/mailman/listinfo/linux-lvm
Tony> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
