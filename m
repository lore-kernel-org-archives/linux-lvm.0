Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBD3AXr05207
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 22:10:33 -0500
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBD3AQST026236
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 22:10:26 -0500
Received: from [193.11.254.225] (myrium.csbnet.se [193.11.254.225])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id 9AC5318FBC
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 04:10:21 +0100 (CET)
Message-ID: <41BD0810.5060400@danielroth.se>
Date: Mon, 13 Dec 2004 04:10:08 +0100
From: Daniel Roth <daniel@danielroth.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm lost after debian upgrade
References: <41BA5A7F.1010302@danielroth.se>
	<20041212174834.GO11338@agk.surrey.redhat.com>
In-Reply-To: <20041212174834.GO11338@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:

>On Sat, Dec 11, 2004 at 03:25:03AM +0100, Daniel Roth wrote:
>  
>
>>My lvm is at /dev/volume_group/mylv, my lvm consisted of hde,g,i
>>    
>>
>
>Known issues with Debian:
>
>  lvm.conf detect_md_component should be set to 1 not 0
>
>  lvm.conf filters - check if cdrom drive is excluded correctly:
>    sometimes the cdrom exclusion points to a real hard disk by mistake
>
>Use pvscan -P to check what LVM2 actually sees.
>
>Alasdair
>  
>
lvm.conf and cdrom exclusion: checked and confirmed
pvscan -P gives me the following(scroll down). Seems ok for actual 
devices (/dev/hdb,f,h,j does not exist)

I am currently in status of what is described in thread "Can't mount 
after crash"

Regards Daniel


roth:/disk# pvscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  /dev/loop0: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop1: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop2: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop3: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop4: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop5: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop6: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/loop7: ioctl BLKGETSIZE64 failed: No such device or address
  /dev/hdf: open failed: No such device or address
  /dev/hdh: open failed: No such device or address
  /dev/hdj: open failed: No such device or address
  /dev/hdb1: open failed: No such device or address
  /dev/hdf1: open failed: No such device or address
  /dev/hdh1: open failed: No such device or address
  /dev/hdj1: open failed: No such device or address
  /dev/hdb2: open failed: No such device or address
  /dev/hdf2: open failed: No such device or address
  /dev/hdh2: open failed: No such device or address
  /dev/hdj2: open failed: No such device or address
  /dev/hdb3: open failed: No such device or address
  /dev/hdf3: open failed: No such device or address
  /dev/hdh3: open failed: No such device or address
  /dev/hdj3: open failed: No such device or address
  /dev/hdb4: open failed: No such device or address
  /dev/hdf4: open failed: No such device or address
  /dev/hdh4: open failed: No such device or address
  /dev/hdj4: open failed: No such device or address
  /dev/hdb5: open failed: No such device or address
  /dev/hdf5: open failed: No such device or address
  /dev/hdh5: open failed: No such device or address
  /dev/hdj5: open failed: No such device or address
  /dev/hdb6: open failed: No such device or address
  /dev/hdf6: open failed: No such device or address
  /dev/hdh6: open failed: No such device or address
  /dev/hdj6: open failed: No such device or address
  /dev/hdb7: open failed: No such device or address
  /dev/hdf7: open failed: No such device or address
  /dev/hdh7: open failed: No such device or address
  /dev/hdj7: open failed: No such device or address
  /dev/hdb8: open failed: No such device or address
  /dev/hdf8: open failed: No such device or address
  /dev/hdh8: open failed: No such device or address
  /dev/hdj8: open failed: No such device or address
  /dev/hdb9: open failed: No such device or address
  /dev/hdf9: open failed: No such device or address
  /dev/hdh9: open failed: No such device or address
  /dev/hdj9: open failed: No such device or address
  /dev/hdb10: open failed: No such device or address
  /dev/hdf10: open failed: No such device or address
  /dev/hdh10: open failed: No such device or address
  /dev/hdb11: open failed: No such device or address
  /dev/hdf11: open failed: No such device or address
  /dev/hdh11: open failed: No such device or address
  /dev/hdb12: open failed: No such device or address
  /dev/hdf12: open failed: No such device or address
  /dev/hdh12: open failed: No such device or address
  /dev/hdb13: open failed: No such device or address
  /dev/hdf13: open failed: No such device or address
  /dev/hdh13: open failed: No such device or address
  /dev/hdb14: open failed: No such device or address
  /dev/hdf14: open failed: No such device or address
  /dev/hdh14: open failed: No such device or address
  /dev/hdb15: open failed: No such device or address
  /dev/hdf15: open failed: No such device or address
  /dev/hdh15: open failed: No such device or address
  /dev/hdb16: open failed: No such device or address
  /dev/hdf16: open failed: No such device or address
  /dev/hdh16: open failed: No such device or address
  /dev/hdb17: open failed: No such device or address
  /dev/hdf17: open failed: No such device or address
  /dev/hdh17: open failed: No such device or address
  /dev/hdb18: open failed: No such device or address
  /dev/hdf18: open failed: No such device or address
  /dev/hdh18: open failed: No such device or address
  /dev/hdb19: open failed: No such device or address
  /dev/hdf19: open failed: No such device or address
  /dev/hdh19: open failed: No such device or address
  /dev/hdb20: open failed: No such device or address
  /dev/hdf20: open failed: No such device or address
  /dev/hdh20: open failed: No such device or address
  PV /dev/hdi1   VG my_volume_group   lvm2 [149.05 GB / 0    free]
  PV /dev/hde1   VG my_volume_group   lvm2 [76.69 GB / 0    free]
  PV /dev/hdg5   VG my_volume_group   lvm2 [57.25 GB / 964.00 MB free]
  Total: 3 [282.99 GB] / in use: 3 [282.99 GB] / in no VG: 0 [0   ]
