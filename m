Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAMKmlr25275
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 15:48:47 -0500
Received: from erc-server.ercwc.org (mail.ercwc.org [198.85.167.1])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iAMKmjLe018451
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 15:48:45 -0500
Message-ID: <41A250A0.5060702@ercwc.org>
Date: Mon, 22 Nov 2004 15:48:32 -0500
From: "Frank J. Buchholz" <frankb@ercwc.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend error on XFS
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

I recently attempted to extend my logical volume.  First I added an 
additional physical volume to an existing volume group.  This worked fine.

vgextend Volume00 /dev/sba
lvextend -L+100G /dev/Volume00/LogVol00

However when it came time to run the lvextend command I received a 
number of  device-mapper errors.  While I was trying to determine what 
the errors were I noticed that the filesystem that sits on the logical 
volume being extended was no longer available.  I attempted to umount 
the filesystem however the command froze.  I then rebooted the system 
without mounting the filesystem in question and manually mounted the 
filesystem. XFS reported back that it could not locate the superblock.

I attempted to run xfs_repair however this command failed at the first 
stage because it could not find the superblock. 

Is it possible to repair this problem either through LVM or XFS? I 
noticed there are a number of achieved .vg files in /etc/lvm/archive  , 
is it possible to restore LVM from one of these?

I am not running any snapshot copies, which is where I've read this 
occurring before.

Thanks,
Frank

-- 
Frank J. Buchholz
Education and Research Services
828-350-2421 Office
