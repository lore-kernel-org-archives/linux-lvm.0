Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAO4nXr12830
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 23:49:33 -0500
Received: from erc-server.ercwc.org (www.ercwc.org [198.85.167.1])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iAO4nGtj015129
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 23:49:26 -0500
Message-ID: <41A412BC.3050409@ercwc.org>
Date: Tue, 23 Nov 2004 23:49:00 -0500
From: "Frank J. Buchholz" <frankb@ercwc.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060201060601080000050206"
Subject: [linux-lvm] XFS device-mapper problem
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060201060601080000050206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Recently I attemped to 'lvextend' a logical volume.  My fatal error was 
that I had a typo in my prior 'vgextend' command in which I added 
/dev/sda to a volume that already held /dev/sda1. One the device for the 
disk (sda) and the other being the device for the only partition on the 
disk (sda1). Oh no!

I recieved the following error during the 'lvextend' command...
lvm> lvextend -L+1G /dev/Volume00/LogVol00
  Extending logical volume LogVol00 to 2.93 TB
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'Volume00-LogVol00'.
  Problem reactivating LogVol00

I have since 'lvreduce'd the logical volume back to its original size 
and 'vgreduce'd the volume by removing /dev/sda from the volume.  Both 
of these commands ran well without any noticable errors.

However my problem is that I believe I have corrupted the block device 
located at /dev/mapper.  The block device in that directory is 
Volume00-LogVol00.  The filesystem is XFS.  When I run xfs_check on the 
filesystem I recieve the following error:
xfs_check /dev/Volume00/LogVol00
xfs_check: /dev/Volume00/LogVol00 is invalid (cannot read first 512 bytes)

When I run:
# hexdump -C Volume00-LogVol00
#
It simply returns nothing except a prompt.

The directory listing looks like:
# pwd
/dev/mapper
#ls -l
crw-------  1 root root  10, 63 Nov 22 12:05 control
brw-------  1 root root 253,  1 Jun 17  2003 Volume00-LogVol00
brw-------  1 root root 253,  0 Nov 22 10:03 Volume01-LogVol00

Volume01 is a working block device while Volume00 seems to have stopped 
working. 

I can 'hexdump' /dev/sda1, the physical volume device in Volume00, and 
it shows me the content of the filesystem (phew, still there).

How do I fix LVM and device-mapper to make this work again?

Thanks,
Frank

-- 
Frank J. Buchholz




--------------060201060601080000050206
Content-Type: text/x-vcard; charset=utf8;
 name="frankb.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="frankb.vcf"

begin:vcard
fn:Frank J. Buchholz
n:Buchholz;Frank J.
org:Education & Research Services
adr;dom:Suite 170;;151 Patton Ave;Asheville;NC;28801
email;internet:frankb@ercwc.org
title:Director, High Performance Computing
tel;work:828.350.2421
tel;fax:828.350.2008
tel;cell:828.606.2105
url:http://www.erswc.org
version:2.1
end:vcard


--------------060201060601080000050206--
