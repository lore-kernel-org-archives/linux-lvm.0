Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8449Ulf020182
	for <linux-lvm@redhat.com>; Mon, 4 Sep 2006 00:09:30 -0400
Received: from web30308.mail.mud.yahoo.com (web30308.mail.mud.yahoo.com
	[209.191.69.70])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k8449SSB020183
	for <linux-lvm@redhat.com>; Mon, 4 Sep 2006 00:09:28 -0400
Message-ID: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com>
Date: Sun, 3 Sep 2006 21:09:17 -0700 (PDT)
From: Tom+Dale <tdmyth@yahoo.com>
Subject: [linux-lvm] Wrecked Logical Volume with vgreduce --removemissing 
In-Reply-To: <20060830021657.28641.qmail@web30301.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-668531939-1157342957=:25207"
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-668531939-1157342957=:25207
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

I had a bad drive in my volume group, so I tried "vgreduce --removemissing VolGroup00" which seemed to work. Then, I tried "vgchange -ay --partial VolGroup00" which also appeared to complete successfully.  It seems like I was partly successful but I cannot get the logical volume to be recognized.  I don't know what else to do?  Where can I learn more about LVM?  How does one utilize the LVM archive or backup files?  Can't seem to find an answer to this problem.  Is all of my data lost?

[root[at]server ~]# lvchange -vvvay /dev/VolGroup00/LogVol00 
Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 
O_DIRECT will be used 
Setting global/locking_type to 1 
Setting global/locking_dir to /var/lock/lvm 
File-based locking enabled. 
Using logical volume(s) on command line 
Locking /var/lock/lvm/V_VolGroup00 WB 
Opened /dev/sda RW 
/dev/sda: block size is 4096 bytes 
/dev/sda: No label detected  
Opened /dev/hda1 RW 
/dev/hda1: block size is 1024 bytes 
/dev/hda1: No label detected 
Opened /dev/hda2 RW 
/dev/hda2: block size is 4096 bytes 
/dev/hda2: No label detected 
Opened /dev/hda3 RW 
/dev/hda3: block size is 4096 bytes 
/dev/hda3: No label detected 
Opened /dev/hda5 RW 
/dev/hda5: block size is 512 bytes 
/dev/hda5: lvm2 label detected 
lvmcache: /dev/hda5 now orphaned 
lvmcache: /dev/hda5 now in VG VolGroup00 
Opened /dev/hdb RW 
/dev/hdb: block size is 4096 bytes 
/dev/hdb: lvm2 label detected 
lvmcache: /dev/hdb now orphaned 
lvmcache: /dev/hdb now in VG VolGroup00 
/dev/hda5: lvm2 label detected 
/dev/hdb: lvm2 label detected 
/dev/hda5: lvm2 label detected 
/dev/hdb: lvm2 label detected 
Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720 
/dev/hda5: lvm2 label detected 
/dev/hdb: lvm2 label detected 
Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720  
One or more specified logical volume(s) not found. 
Unlocking /var/lock/lvm/V_VolGroup00 
Closed /dev/sda 
Closed /dev/hda1 
Closed /dev/hda2 
Closed /dev/hda3 
Closed /dev/hda5 
Closed /dev/hdb 

 		
---------------------------------
Do you Yahoo!?
 Get on board. You're invited to try the new Yahoo! Mail.
--0-668531939-1157342957=:25207
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<span style="color: black; font-family: Verdana;">I had a bad drive in my volume group, so I tried "vgreduce --removemissing VolGroup00" which seemed to work. Then, I tried "vgchange -ay --partial VolGroup00" which also appeared to complete successfully.<span style="">&nbsp; </span>It seems like I was partly successful but I cannot get the logical volume to be recognized.<span style="">&nbsp; </span>I don't know what else to do?&nbsp; Where can I learn more about LVM?&nbsp; How does one utilize the LVM archive or backup files?&nbsp; Can't seem to find an answer to this problem.&nbsp; Is all of my data lost?<br><br></span><span style="color: black; font-family: Verdana;">[root[at]server ~]# lvchange -vvvay /dev/VolGroup00/LogVol00 <br>Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 <br>O_DIRECT will be used <br>Setting global/locking_type to 1 <br>Setting global/locking_dir to /var/lock/lvm <br>File-based locking enabled. <br>Using logical volume(s) on command line
 <br>Locking /var/lock/lvm/V_VolGroup00 WB <br>Opened /dev/sda RW <br>/dev/sda: block size is 4096 bytes <br>/dev/sda: No label detected  <br>Opened /dev/hda1 RW <br>/dev/hda1: block size is 1024 bytes <br>/dev/hda1: No label detected <br>Opened /dev/hda2 RW <br>/dev/hda2: block size is 4096 bytes <br>/dev/hda2: No label detected <br>Opened /dev/hda3 RW <br>/dev/hda3: block size is 4096 bytes <br>/dev/hda3: No label detected <br>Opened /dev/hda5 RW <br>/dev/hda5: block size is 512 bytes <br>/dev/hda5: lvm2 label detected <br>lvmcache: /dev/hda5 now orphaned <br>lvmcache: /dev/hda5 now in VG VolGroup00 <br>Opened /dev/hdb RW <br>/dev/hdb: block size is 4096 bytes <br>/dev/hdb: lvm2 label detected <br>lvmcache: /dev/hdb now orphaned <br>lvmcache: /dev/hdb now in VG VolGroup00 <br>/dev/hda5: lvm2 label detected <br>/dev/hdb: lvm2 label detected <br>/dev/hda5: lvm2 label detected <br>/dev/hdb: lvm2 label detected <br>Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size
 720 <br>/dev/hda5: lvm2 label detected <br>/dev/hdb: lvm2 label detected <br>Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720  <br>One or more specified logical volume(s) not found. <br>Unlocking /var/lock/lvm/V_VolGroup00 <br>Closed /dev/sda <br>Closed /dev/hda1 <br>Closed /dev/hda2 <br>Closed /dev/hda3 <br>Closed /dev/hda5 <br>Closed /dev/hdb </span><br><p>&#32;
		<hr size=1>Do you Yahoo!?<br> 
Get on board. <a href="http://us.rd.yahoo.com/evt=40791/*http://advision.webevents.yahoo.com/mailbeta">You're invited</a> to try the new Yahoo! Mail.
--0-668531939-1157342957=:25207--
