Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3J9JKj26724
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 05:19:20 -0400
Received: from mail003.syd.optusnet.com.au (mail003.syd.optusnet.com.au
	[211.29.132.144])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3J9JH87010492
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 05:19:18 -0400
Received: from webmail04.syd.optusnet.com.au (webmail04.syd.optusnet.com.au
	[211.29.132.238])
	by mail003.syd.optusnet.com.au (8.11.6p2/8.11.6) with ESMTP id
	i3J9J4415205
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 19:19:05 +1000
Message-Id: <200404190919.i3J9J4415205@mail003.syd.optusnet.com.au>
Content-Disposition: inline
Content-Transfer-Encoding: binary
MIME-Version: 1.0
From: drsmithy@optusnet.com.au
Date: Mon, 19 Apr 2004 19:19:04 +1000
Subject: Re: [linux-lvm] Lost a VG - please help
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

After doing some more research throughout the
day, I've tried a few solutions for other
somewhat similar problems, all to no avail.

Fortunately, I still have the old system
drive with its /etc/lvm* data, so I plugged
it back in hoping to resurrect my data.

From this message:
http://www.somelist.com/mails/403762/
I tried a similar solution:

[root@terminus root]# cp
/etc/lvmconf/vg_data.conf /etc/lvmtab.d/vg_data
[root@terminus root]# echo -ne "vg_data\0" >>
/etc/lvmtab
[root@terminus root]# vgchange -ay vg_data
vgchange -- ERROR: physical volume "/dev/md0"
of volume group "vg_data" is inconsistent
vgchange -- run vgscan

[root@terminus root]#

Of course, running vgscan just results in the
bogus "vg_wbl" being detected.

Then I tried vgcfgrestore, again without any
luck:

[root@terminus root]# vgcfgrestore -l -n vg_data
vgcfgrestore -- INFO: using backup file
"/etc/lvmconf/vg_data.conf"
--- Volume group ---
VG Name               vg_data
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               447.09 GB
PE Size               32 MB
Total PE              14307
Alloc PE / Size       11862 / 370.69 GB
Free  PE / Size       2445 / 76.41 GB
VG UUID              
HKLIZ7-72l6-OjsA-ujH0-qpMz-tDi7-1R18jZ


[root@terminus root]# vgcfgrestore -t -n
vg_data /dev/md0
vgcfgrestore -- INFO: using backup file
"/etc/lvmconf/vg_data.conf"
vgcfgrestore -- backup of volume group
"vg_data"  is consistent
vgcfgrestore -- test run for volume group
"vg_data" end

[root@terminus root]# vgcfgrestore -n vg_data
/dev/md0
vgcfgrestore -- INFO: using backup file
"/etc/lvmconf/vg_data.conf"
vgcfgrestore -- physical volume "/dev/md0"
belongs to volume group "vg_wbl"

[root@terminus root]#


I am sure the data on /dev/md0 is undamaged,
I just need to get the appropriate LVM
metadata back onto it to make it accessible.
 Is there any way to "force" vfcfgrestore to
write to /dev/md0 ?  If I "remove" it from
the VG "vg_wbl" and then try vgcfgrestore,
will that work ?  Will running "pvcreate"
possibly allow the vgcfgrestore to work ? 
Will that damage any of the non-LVM
structures on the disk ?

Also, does anyone have any theories on how
this might have happened, so I don't
inadvertently do it again the next time I
want to reinstall this system ?

Regards,
CS
