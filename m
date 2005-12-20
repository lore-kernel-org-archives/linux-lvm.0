Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBKM3G118874
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 17:03:16 -0500
Received: from web80902.mail.scd.yahoo.com (web80902.mail.scd.yahoo.com
	[66.218.95.65])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jBKM3AK9008153
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 17:03:10 -0500
Message-ID: <20051220220301.2309.qmail@web80902.mail.scd.yahoo.com>
Date: Tue, 20 Dec 2005 14:03:01 -0800 (PST)
From: mymail mymail <internetbizmail@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-269072029-1135116181=:90247"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Recovery of data in LVM from a corrupt disk
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

--0-269072029-1135116181=:90247
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

I have a FC3 system with two disks. The first (/dev/hda) is a new disk on which I have a rebuilt system which has a new LVM installed. The other disk (/dev/hdc) is the system disk that failed. As I couldn't get hdc to boot, my intention is to access hdc by mounting it on the hda system to copy data around, or try other ways to recover what's on there. However whenever I try

   # mount /dev/hdc2 /mnt
   FAT: invalid media value (0x8e)
   mount: you must specify the filesystem type

I get filesystem not found errors. The filesystem type according to fdisk is 8e (LVM), but can I get at the data that's on there and then copy that?

Any hints on how to recover this would be appreciated. I can find loads of info on LVM and how it works, which is great when you have a working system, but not so good when it's corrupt!

Any help on how to do backups and the best procedure to follow in the event of another disaster will also be useful -- there is nothing in the FAQs, etc I've seen on this.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
--0-269072029-1135116181=:90247
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent">I have a FC3 system with two disks. The first (/dev/hda) is a new disk on which I have a rebuilt system which has a new LVM installed. The other disk (/dev/hdc) is the system disk that failed. As I couldn't get hdc to boot, my intention is to access hdc by mounting it on the hda system to copy data around, or try other ways to recover what's on there. However whenever I try<br><br><span style="font-family: courier;">&nbsp;&nbsp; # mount /dev/hdc2 /mnt</span><br style="font-family: courier;"><span style="font-family: courier;">&nbsp;&nbsp; FAT: invalid media value (0x8e)</span><br style="font-family: courier;"><span style="font-family: courier;">&nbsp;&nbsp; mount: you must specify the filesystem type</span><br><br>I get filesystem not found errors. The filesystem type according to fdisk is 8e (LVM), but can I get at the data that's on there and then copy that?<br><br>Any hints on how to recover this would be appreciated. I can find loads of info on LVM a!
nd how it
 works, which is great when you have a working system, but not so good when it's corrupt!<br><br>Any help on how to do backups and the best procedure to follow in the event of another disaster will also be useful -- there is nothing in the FAQs, etc I've seen on this.<br></div><p>__________________________________________________<br>Do You Yahoo!?<br>Tired of spam?  Yahoo! Mail has the best spam protection around <br>http://mail.yahoo.com 
--0-269072029-1135116181=:90247--
