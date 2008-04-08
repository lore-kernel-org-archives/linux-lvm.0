Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m38B1dQd028574
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:01:39 -0400
Received: from odzwierny0.comarch.com (inptr-69-8.comarch.com [217.74.69.8])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m38B1Pia026793
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:01:26 -0400
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.com
	by odzwierny0.comarch.com with esmtpa (ComArch ESMTP)
	id 1JjBZs-00017j-E9
	for linux-lvm@redhat.com; Tue, 08 Apr 2008 13:01:24 +0200
From: =?iso-8859-2?Q?Marcin_Ka=B3u=BFa?= <marcin.kaluza@comarch.pl>
Subject: RE: [linux-lvm] LVM mirroring questions...
Date: Tue, 8 Apr 2008 13:01:24 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <69649d440804080214v706eedf3m50e443182a1827ae@mail.gmail.com>
Message-Id: <E1JjBZs-00017j-E9@odzwierny0.comarch.com>
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hello

Why software RAID is not an option? It works with partitions as well as with
whole disks (actually it doesn't care what it is working on as long as it's
a block device)

The amount of log data is small - on my test setup for creating 1GB mirrored
LV log fit into single 16MB PE - don't know how much of it was left freee
though. 
Everything is in mans - the HOWTO seems to be a little old

But if all you want to do is mirroring one partition, than just create a
partition of the same size (well, it can be bigger, but then the remaining
space is lost an unusable) on the other drive and create md over them.

Hope this helps
Martin

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Jess Bromley
Sent: Tuesday, April 08, 2008 11:15 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM mirroring questions...

Hi all,

I've been trying to find out about LVM mirroring, but it's hard to
find much information in the documentation.

Is mirroring considered stable/ready for production use yet?  "man
lvcreate" and "man lvconvert" suggest that the current stable versions
support creating mirrored volumes, but the HOWTO has nothing to say
about it.

On a more detailed note, what sort of size does the physical volume
for the disk log need to be in relation to the size of the logical
volume to be mirrored, and is there any way to specify which physical
volume will hold the disk log (either using lvconvert or lvcreate)?

I've got a situation where I want to mirror only a partition of a
physical disk on to that of another physical disk, not the whole disk;
so software/hardware RAID isn't an option.

Thanks for your help,
J Bromley

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
