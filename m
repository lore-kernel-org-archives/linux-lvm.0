Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5974Wsw001618
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 03:04:32 -0400
Received: from csmtp2.one.com (csmtp2.one.com [195.47.247.206])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5974I1C015896
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 03:04:18 -0400
Received: from [10.61.95.174] (64-103-25-233.cisco.com [64.103.25.233])
	by csmtp2.one.com (Postfix) with ESMTP id 5ACD9160003AA
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2009 07:04:16 +0000 (UTC)
Message-ID: <4A2E096F.1010203@nektulos.de>
Date: Tue, 09 Jun 2009 09:04:15 +0200
From: Stefan Radovanovici <stefan@nektulos.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvremove won't work
References: <4A2E0396.4030006@nektulos.de>
	<20090609065405.GB10101@maude.comedia.it>
In-Reply-To: <20090609065405.GB10101@maude.comedia.it>
Content-Transfer-Encoding: 7bit
Reply-To: stefan@nektulos.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 6/9/2009 8:54 AM, Luca Berra wrote:
>> However, I can't remove /dev/sda4 (the partition on the failing disk)
>> from the group:
>> root@neriak:~# pvremove /dev/sda4
>>  Can't open /dev/sda4 exclusively - not removing. Mounted filesystem?
> what is the use of doing pvremove on sda4?? you just rip the disk off
> and dump it in the wastebin.

Well, yeah, I just wanted to make sure that removing the disk while some of its partitions are part of the LVM won't cause any problems. I can't remove it just yet anyway, the OS is also installed on other partitions on sda. So basically as long as I did a vgreduce, I can take the disk out, is that right? I am assuming /dev/sda4 is still showing in the pvdisplay output because it's still a LVM-type partition. 

> check /sys/block/sda/sda4/holders

I did: 

root@neriak:/sys/block/sda/sda4/holders# l
total 0
drwxr-xr-x 2 root root 0 2009-06-09 08:55 .
drwxr-xr-x 4 root root 0 2009-06-09 08:43 ..
lrwxrwxrwx 1 root root 0 2009-06-09 08:55 dm-1 -> ../../../../../../../../../virtual/block/dm-1
root@neriak:/sys/block/sda/sda4/holders# cd dm-1
root@neriak:/sys/block/sda/sda4/holders/dm-1# l
total 0
drwxr-xr-x  5 root root    0 2009-06-09 08:43 .
drwxr-xr-x 28 root root    0 2009-06-09 08:30 ..
lrwxrwxrwx  1 root root    0 2009-06-09 08:55 bdi -> ../../bdi/252:1
-r--r--r--  1 root root 4096 2009-06-09 08:55 capability
-r--r--r--  1 root root 4096 2009-06-09 08:55 dev
-r--r--r--  1 root root 4096 2009-06-09 08:55 ext_range
drwxr-xr-x  2 root root    0 2009-06-09 08:55 holders
drwxr-xr-x  2 root root    0 2009-06-09 08:55 power
-r--r--r--  1 root root 4096 2009-06-09 08:55 range
-r--r--r--  1 root root 4096 2009-06-09 08:55 removable
-r--r--r--  1 root root 4096 2009-06-09 08:55 ro
-r--r--r--  1 root root 4096 2009-06-09 08:55 size
drwxr-xr-x  2 root root    0 2009-06-09 08:55 slaves
-r--r--r--  1 root root 4096 2009-06-09 08:55 stat
lrwxrwxrwx  1 root root    0 2009-06-09 08:55 subsystem -> ../../../../class/block
-rw-r--r--  1 root root 4096 2009-06-09 08:43 uevent

I have to admit I don't know what I am looking at. What's the dm-1 ?

Regards,
Stefan
