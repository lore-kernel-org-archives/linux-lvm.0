Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADAHEr20359
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:17:14 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iADAHDIs021144
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:17:13 -0500
Received: by rproxy.gmail.com with SMTP id f1so362695rne
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 02:17:13 -0800 (PST)
Message-ID: <89af10f90411130217467c439@mail.gmail.com>
Date: Sat, 13 Nov 2004 15:47:13 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] raid 1 on a single disk
Reply-To: ashwin chaugule <ashwin.chaugule@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi,
         Im trying to get RAID 1 working on a single disk. Can anyone
tell me if thats possible ?
Do I have to use LVM for that ?

So, far this is what i've understood ...
Now.. I have a separate disk on which I want RAID 1.
so I create one PV on that disk (/dev/hdd)
create a logical vol grp.
add 4 LV's , for four filesystems of the same type ...
then in /etc/raidtab or whatever ..
say that i have 4 disks and for each disk specify each LV partition ..
then mkraid /dev/md0 ...

Is this correct if I want data to be mirrored across all 4 partitions
, using RAID 1 on a single disk ?



-- 
Ashwin Chaugule
Embedded Systems Engineer
Aftek Infosys ltd.
[Embedded Division]
