Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LEg2a01672
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 10:42:02 -0400
Received: from atl-ms1.megatrends.com (mail2.megatrends.com [155.229.80.16])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6LEfuXn005869
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 10:41:56 -0400
Message-ID: <8CCBDD5583C50E4196F012E79439B45C04C9A463@atl-ms1.megatrends.com>
From: Vinesh Christopher <vineshc@ami.com>
Subject: RE: [linux-lvm] Raid 0+1
Date: Wed, 21 Jul 2004 10:41:12 -0400
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

The softraid comes with linux does not support resize.

Try DM + EVMS. This is much simpler and powerful. You can create Raid over 
Raid (Any raid level not limited to 0 and 1)
The next EVMS release 2.4 scheduled for Aug 2004, has features to resize
RAID 1 and 4/5.

-----Original Message-----
From: Wayne Pascoe [mailto:lists-june2004@penguinpowered.org] 
Sent: Wednesday, July 21, 2004 8:23 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Raid 0+1

Hi all,

I am working on a project to evaluate LVM2 against Veritas Volume
Manager for a new Linux deployment. I am trying to get a Raid 0+1
solution working and I'm struggling.

So far, this is where I am:

1. I created 8GB partitions on 4 disks, sdb, sdc, sdd and sde, and set
their partition types to 8e with fdisk

2. I then ran vgscan, follwed by pvcreate /dev/sdb1, /dev/sdc1,
/dev/sdd1, /dev/sde1

3. Next, I created 2 volume groups as follows:
vgcreate StripedData1 /dev/sdb1 /dev/sdc1
vgcreate StripedData2 /dev/sdd1 /dev/sde1

4. Next, I created 2 volumes, one in each group as follows:
lvcreate -i 2 -I 64 -n Data1 -L 6G StripedData1
lvcreate -i 2 -I 64 -n Data2 -L 6G StripedData2
Now I have 2 striped volumes, but no redundancy. This is where I think
things start to go wrong.

5. I now create a raid device, /dev/md0 consisting of these two
volumes. I run mkraid on this, create a file system, and mount it on
/Data1. This all works fine, and I have a 6GB filesystem on /Data1

Now I need to be able to resize this whole solution, and I'm not sure
if the way I've built it caters for what I need to do...

I unmount /Data1 and use lvextend to extend the 2 volumes from 6GB to
7.5GB. This succeeds. Now even though both of the volumes that make up
/dev/md0 are extended, I cannot resize /dev/md0 using resize2fs
/dev/md0

Can anyone advise me how I can achieve what I'm looking for here ? I'm
guessing maybe I did things the wrong way around, but I can't find a
solution that will give me both striping and mirroring :(

Thanks in advance,


-- 
Wayne Pascoe
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
