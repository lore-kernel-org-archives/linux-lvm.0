Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAMM8or23851
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 17:08:50 -0500
Received: from erc-server.ercwc.org (mail.ercwc.org [198.85.167.1])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iAMM8jpq003898
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 17:08:45 -0500
Subject: [linux-lvm] Re: lvextend error on XFS
From: "Frank J. Buchholz" <frankb@ercwc.org>
Message-Id: <1101161308.4630.8.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Mon, 22 Nov 2004 17:08:28 -0500
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

"Frank J. Buchholz" <frankb ercwc org> writes:

> Hello,
>
> I recently attempted to extend my logical volume.  First I added an
> additional physical volume to an existing volume group.  This worked
> fine.
>
> vgextend Volume00 /dev/sba
> lvextend -L+100G /dev/Volume00/LogVol00
>
> However when it came time to run the lvextend command I received a
> number of  device-mapper errors.  While I was trying to determine what
> the errors were I noticed that the filesystem that sits on the logical
> volume being extended was no longer available.  I attempted to umount
> the filesystem however the command froze.  I then rebooted the system
> without mounting the filesystem in question and manually mounted the
> filesystem. XFS reported back that it could not locate the superblock.

I have done lvextend followed by xfs_growfs many times without any
problems.  Have you checked for hardware errors?

-- 
M�ns Rullg�rd
mru inprovide com

M�ns - 

Unfortunately the timing is far too coincidental to be a hardware error.

Just after typing the following command and recieving the following error
lvm> lvextend -L+1G /dev/Volume00/LogVol00
  Extending logical volume LogVol00 to 2.93 TB
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'Volume00-LogVol00'.
  Problem reactivating LogVol00

I then noticed that the filesystem on LogVol00 was no longer available
and when I ran xfs_repair it stated the following:
# xfs_repair /dev/Volume00/LogVol00 
Phase 1 - find and verify superblock...
superblock read failed, offset 0, size 524288, ag 0, rval 0
 
fatal error -- Invalid argument
