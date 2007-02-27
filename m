Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1RN4ETA027669
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 18:04:15 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.171])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1RN4BBx013877
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 18:04:12 -0500
Received: by ug-out-1314.google.com with SMTP id x30so1430963ugc
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 15:04:11 -0800 (PST)
Message-ID: <2100174a0702271504s5d0a9d4cra027a3e38fc6d9fa@mail.gmail.com>
Date: Tue, 27 Feb 2007 18:04:02 -0500
From: "Pete Toscano" <shubnub@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_25697_25322176.1172617442553"
Subject: [linux-lvm] Please help: LVM Recovery on base RHEL3 system.
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
To: linux-lvm@redhat.com

------=_Part_25697_25322176.1172617442553
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

A friend of mine recently built a fileserver from some spare stuff he had
around along with a spare RHEL3 CD from his work.  He has no RHEL
entitlements, so no binary updates.  (I would have encouraged him to at
least use an upgradeable system, but that's neither here nor there, now.)
As for the system, it's very basic with a system hard drive, a DVD drive,
PCI IDE card, and five drives dedicated to a RAID5 volume.

He followed the software RAID and LVM how-tos, eventually building a 930+GB
RAID5 volume md0.  He then used md0 as the sole PV to build a "raid_discs"
VG.  This VG was split into three LVs: home, music, and pics.  Each LV was
formatted EXT3 and set to mount in /etc/fstab:

/dev/raid_discs/music  /raid/music              ext3    defaults        0 0
/dev/raid_discs/pictures  /raid/pictures        ext3    defaults        0 0
/dev/raid_discs/home  /raid/home                ext3    defaults        0 0

This done, he proceeded to copy 260G of media to the server.  Thinking
everything we living safely on a RAID5 device now, he proceeded to delete
the sources.  *sigh*

Everything worked fine until he rebooted the server (cleanly, I'm told).
After the machine came up, it wouldn't mount his LVs.  The RAID device is
there:

[root@Server lvmconf]# cat /proc/mdstat
Personalities : [raid5]
read_ahead 1024 sectors
Event: 1
md0 : active raid5 hdh[4] hdg[3] hdf[2] hde[1] hdc[0]
      976793600 blocks level 5, 128k chunk, algorithm 2 [5/5] [UUUUU]

unused devices: <none>

From what I can tell, though, it doesn't look like LVM is seeing the RAID
device as a PV anymore:

[root@Server lvmconf]# pvdisplay -vv /dev/md0
pvdisplay -- checking physical volume name "/dev/md0"
pvdisplay -- reading data of physical volume "/dev/md0" from disk
pvdisplay -- no physical volume identifier on "/dev/md0"

Am I reading this correctly?

I tried to do a vgcfgrestore and got this:

[root@Server lvmconf]# vgcfgrestore -n raid_discs -vv  /dev/md0
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/raid_discs.conf"
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "raid_discs" from
"/etc/lvmconf/raid_discs.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/raid_discs.conf"
vgcfgrestore -- reading volume group data for "raid_discs" from
"/etc/lvmconf/raid_discs.conf"
vgcfgrestore -- reading physical volume data for "raid_discs" from
"/etc/lvmconf/raid_discs.conf"
vgcfgrestore -- reading logical volume data for "raid_discs" from
"/etc/lvmconf/raid_discs.conf"
vgcfgrestore -- checking volume group consistency of "raid_discs"
vgcfgrestore -- checking volume group consistency of "raid_discs"
vgcfgrestore -- reading physical volume "/dev/md0"
vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physical
volume "/dev/md0"

Is there anything that we can do to save his data?  I know that with
partition tables, if you know them in advance, you can re-write them and, if
you're exact, you won't lose any data.  Is it possible to do the same with
pvcreate?  Could I re-init the PV, then have the VG suddenly be happy?
Suggestions?

Would it help matters to boot off a live CD like Helix and try recovery that
way?  I'm a bit hesitant to do that as I'd rather try to get things working
with the tools that created the VG in the first place and I'm not sure how
nicely LVM2 would play with LVM.  OTOH, since we're dealing with base RHEL3,
we could also be hitting a bug that was later patched.  (After recovery, I'm
getting him to change the OS ASAP.)

Thank you so much.  I really hope he hasn't borked his pics of his kids.

pete

------=_Part_25697_25322176.1172617442553
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

A friend of mine recently built a fileserver from some spare stuff he had around along with a spare RHEL3 CD from his work.&nbsp; He has no RHEL entitlements, so no binary updates.&nbsp; (I would have encouraged him to at least use an upgradeable system, but that&#39;s neither here nor there, now.)&nbsp; As for the system, it&#39;s very basic with a system hard drive, a DVD drive, PCI IDE card, and five drives dedicated to a RAID5 volume.
<br><br>He followed the software RAID and LVM how-tos, eventually building a 930+GB RAID5 volume md0.&nbsp; He then used md0 as the sole PV to build a &quot;raid_discs&quot; VG.&nbsp; This VG was split into three LVs: home, music, and pics.&nbsp; Each LV was formatted EXT3 and set to mount in /etc/fstab:
<br><br>/dev/raid_discs/music&nbsp; /raid/music&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>/dev/raid_discs/pictures&nbsp; /raid/pictures&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>/dev/raid_discs/home&nbsp; /raid/home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0
<br><br>This done, he proceeded to copy 260G of media to the server.&nbsp; Thinking everything we living safely on a RAID5 device now, he proceeded to delete the sources.&nbsp; *sigh*<br><br>Everything worked fine until he rebooted the server (cleanly, I&#39;m told).&nbsp; After the machine came up, it wouldn&#39;t mount his LVs.&nbsp; The RAID device is there:
<br><br>[root@Server lvmconf]# cat /proc/mdstat <br>Personalities : [raid5] <br>read_ahead 1024 sectors<br>Event: 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>md0 : active raid5 hdh[4] hdg[3] hdf[2] hde[1] hdc[0]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 976793600 blocks level 5, 128k chunk, algorithm 2 [5/5] [UUUUU]
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>unused devices: &lt;none&gt;<br><br>From what I can tell, though, it doesn&#39;t look like LVM is seeing the RAID device as a PV anymore:<br><br>[root@Server lvmconf]# pvdisplay -vv /dev/md0<br>pvdisplay -- checking physical volume name &quot;/dev/md0&quot;
<br>pvdisplay -- reading data of physical volume &quot;/dev/md0&quot; from disk<br>pvdisplay -- no physical volume identifier on &quot;/dev/md0&quot;<br><br>Am I reading this correctly? <br><br>I tried to do a vgcfgrestore and got this:
<br><br>[root@Server lvmconf]# vgcfgrestore -n raid_discs -vv&nbsp; /dev/md0<br>vgcfgrestore -- INFO: using backup file &quot;/etc/lvmconf/raid_discs.conf&quot;<br>vgcfgrestore -- locking logical volume manager<br>vgcfgrestore -- restoring volume group &quot;raid_discs&quot; from &quot;/etc/lvmconf/raid_discs.conf&quot;
<br>vgcfgrestore -- checking existence of &quot;/etc/lvmconf/raid_discs.conf&quot;<br>vgcfgrestore -- reading volume group data for &quot;raid_discs&quot; from &quot;/etc/lvmconf/raid_discs.conf&quot;<br>vgcfgrestore -- reading physical volume data for &quot;raid_discs&quot; from &quot;/etc/lvmconf/raid_discs.conf&quot;
<br>vgcfgrestore -- reading logical volume data for &quot;raid_discs&quot; from &quot;/etc/lvmconf/raid_discs.conf&quot;<br>vgcfgrestore -- checking volume group consistency of &quot;raid_discs&quot;<br>vgcfgrestore -- checking volume group consistency of &quot;raid_discs&quot;
<br>vgcfgrestore -- reading physical volume &quot;/dev/md0&quot;<br>vgcfgrestore -- ERROR &quot;pv_read(): PV identifier invalid&quot; reading physical volume &quot;/dev/md0&quot;<br><br>Is there anything that we can do to save his data?&nbsp; I know that with partition tables, if you know them in advance, you can re-write them and, if you&#39;re exact, you won&#39;t lose any data.&nbsp; Is it possible to do the same with pvcreate?&nbsp; Could I re-init the PV, then have the VG suddenly be happy?&nbsp; Suggestions?
<br><br>Would it help matters to boot off a live CD like Helix and try recovery that way?&nbsp; I&#39;m a bit hesitant to do that as I&#39;d rather try to get things working with the tools that created the VG in the first place and I&#39;m not sure how nicely LVM2 would play with LVM.&nbsp; OTOH, since we&#39;re dealing with base RHEL3, we could also be hitting a bug that was later patched.&nbsp; (After recovery, I&#39;m getting him to change the OS ASAP.)
<br><br>Thank you so much.&nbsp; I really hope he hasn&#39;t borked his pics of his kids.<br><br>pete<br> 

------=_Part_25697_25322176.1172617442553--
