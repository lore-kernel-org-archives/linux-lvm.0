Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k86GTVTE004896
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 12:29:31 -0400
Received: from swlx166.swmed.edu (swlx166.swmed.edu [199.165.152.166])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k86GTUAq030921
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 12:29:30 -0400
Received: from peters.swmed.org ([129.112.118.137])
	by swlx166.swmed.edu with esmtp (Exim 4.44) id 1GL0HD-000631-Jc
	for linux-lvm@redhat.com; Wed, 06 Sep 2006 11:29:25 -0500
Message-ID: <44FEF763.9040609@utsouthwestern.edu>
Date: Wed, 06 Sep 2006 11:29:23 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com>
In-Reply-To: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com>
Content-Type: multipart/alternative;
	boundary="------------040604000900010900030507"
Subject: Re: [linux-lvm] Wrecked Logical Volume with vgreduce --removemissing
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

This is a multi-part message in MIME format.
--------------040604000900010900030507
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

What if you do "lvdisplay -m /dev/VolGroup00/LogVol00 --partial"

P

Tom+Dale wrote:

> I had a bad drive in my volume group, so I tried "vgreduce 
> --removemissing VolGroup00" which seemed to work. Then, I tried 
> "vgchange -ay --partial VolGroup00" which also appeared to complete 
> successfully.  It seems like I was partly successful but I cannot get 
> the logical volume to be recognized.  I don't know what else to do?  
> Where can I learn more about LVM?  How does one utilize the LVM 
> archive or backup files?  Can't seem to find an answer to this 
> problem.  Is all of my data lost?
>
> [root[at]server ~]# lvchange -vvvay /dev/VolGroup00/LogVol00
> Processing: lvchange -vvvay /dev/VolGroup00/LogVol00
> O_DIRECT will be used
> Setting global/locking_type to 1
> Setting global/locking_dir to /var/lock/lvm
> File-based locking enabled.
> Using logical volume(s) on command line
> Locking /var/lock/lvm/V_VolGroup00 WB
> Opened /dev/sda RW
> /dev/sda: block size is 4096 bytes
> /dev/sda: No label detected
> Opened /dev/hda1 RW
> /dev/hda1: block size is 1024 bytes
> /dev/hda1: No label detected
> Opened /dev/hda2 RW
> /dev/hda2: block size is 4096 bytes
> /dev/hda2: No label detected
> Opened /dev/hda3 RW
> /dev/hda3: block size is 4096 bytes
> /dev/hda3: No label detected
> Opened /dev/hda5 RW
> /dev/hda5: block size is 512 bytes
> /dev/hda5: lvm2 label detected
> lvmcache: /dev/hda5 now orphaned
> lvmcache: /dev/hda5 now in VG VolGroup00
> Opened /dev/hdb RW
> /dev/hdb: block size is 4096 bytes
> /dev/hdb: lvm2 label detected
> lvmcache: /dev/hdb now orphaned
> lvmcache: /dev/hdb now in VG VolGroup00
> /dev/hda5: lvm2 label detected
> /dev/hdb: lvm2 label detected
> /dev/hda5: lvm2 label detected
> /dev/hdb: lvm2 label detected
> Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720
> /dev/hda5: lvm2 label detected
> /dev/hdb: lvm2 label detected
> Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720
> One or more specified logical volume(s) not found.
> Unlocking /var/lock/lvm/V_VolGroup00
> Closed /dev/sda
> Closed /dev/hda1
> Closed /dev/hda2
> Closed /dev/hda3
> Closed /dev/hda5
> Closed /dev/hdb
>
> ------------------------------------------------------------------------
> Do you Yahoo!?
> Get on board. You're invited 
> <http://us.rd.yahoo.com/evt=40791/*http://advision.webevents.yahoo.com/mailbeta> 
> to try the new Yahoo! Mail.
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--------------040604000900010900030507
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
What if you do "lvdisplay -m /dev/VolGroup00/LogVol00 --partial"<br>
<br>
P<br>
<br>
Tom+Dale wrote:
<blockquote
 cite="mid20060904040917.25836.qmail@web30308.mail.mud.yahoo.com"
 type="cite"><span style="color: black; font-family: Verdana;">I had a
bad drive in my volume group, so I tried "vgreduce --removemissing
VolGroup00" which seemed to work. Then, I tried "vgchange -ay --partial
VolGroup00" which also appeared to complete successfully.<span style="">&nbsp;
  </span>It seems like I was partly successful but I cannot get the
logical volume to be recognized.<span style="">&nbsp; </span>I don't know
what else to do?&nbsp; Where can I learn more about LVM?&nbsp; How does one
utilize the LVM archive or backup files?&nbsp; Can't seem to find an answer
to this problem.&nbsp; Is all of my data lost?<br>
  <br>
  </span><span style="color: black; font-family: Verdana;">[root[at]server
~]# lvchange -vvvay /dev/VolGroup00/LogVol00 <br>
Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 <br>
O_DIRECT will be used <br>
Setting global/locking_type to 1 <br>
Setting global/locking_dir to /var/lock/lvm <br>
File-based locking enabled. <br>
Using logical volume(s) on command line <br>
Locking /var/lock/lvm/V_VolGroup00 WB <br>
Opened /dev/sda RW <br>
/dev/sda: block size is 4096 bytes <br>
/dev/sda: No label detected <br>
Opened /dev/hda1 RW <br>
/dev/hda1: block size is 1024 bytes <br>
/dev/hda1: No label detected <br>
Opened /dev/hda2 RW <br>
/dev/hda2: block size is 4096 bytes <br>
/dev/hda2: No label detected <br>
Opened /dev/hda3 RW <br>
/dev/hda3: block size is 4096 bytes <br>
/dev/hda3: No label detected <br>
Opened /dev/hda5 RW <br>
/dev/hda5: block size is 512 bytes <br>
/dev/hda5: lvm2 label detected <br>
lvmcache: /dev/hda5 now orphaned <br>
lvmcache: /dev/hda5 now in VG VolGroup00 <br>
Opened /dev/hdb RW <br>
/dev/hdb: block size is 4096 bytes <br>
/dev/hdb: lvm2 label detected <br>
lvmcache: /dev/hdb now orphaned <br>
lvmcache: /dev/hdb now in VG VolGroup00 <br>
/dev/hda5: lvm2 label detected <br>
/dev/hdb: lvm2 label detected <br>
/dev/hda5: lvm2 label detected <br>
/dev/hdb: lvm2 label detected <br>
Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720 <br>
/dev/hda5: lvm2 label detected <br>
/dev/hdb: lvm2 label detected <br>
Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720 <br>
One or more specified logical volume(s) not found. <br>
Unlocking /var/lock/lvm/V_VolGroup00 <br>
Closed /dev/sda <br>
Closed /dev/hda1 <br>
Closed /dev/hda2 <br>
Closed /dev/hda3 <br>
Closed /dev/hda5 <br>
Closed /dev/hdb </span><br>
  <p> </p>
  <hr size="1">Do you Yahoo!?<br>
Get on board. <a
 href="http://us.rd.yahoo.com/evt=40791/*http://advision.webevents.yahoo.com/mailbeta">You're
invited</a> to try the new Yahoo! Mail.
  <pre wrap="">
<hr size="4" width="90%">
_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
</blockquote>
</body>
</html>

--------------040604000900010900030507--
