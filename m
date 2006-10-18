Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9ICn9x9015216
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 08:49:09 -0400
Received: from saturn.retrosnub.co.uk (daemon@saturn.retrosnub.co.uk
	[217.112.91.169])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9ICn6pD012344
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 08:49:08 -0400
Date: Wed, 18 Oct 2006 13:49:05 +0100 (BST)
From: Malcolm Scott <linux-lvm@malc.org.uk>
Message-ID: <Pine.LNX.4.64.0610181348420.15257@saturn.retrosnub.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate succeeds but vgcreate cannot read label
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
To: linux-lvm@redhat.com

When I run pvcreate on a partition, it seems the PV label is successfully 
written to the partition, but vgcreate cannot then read this label in order 
to incorporate this new PV into a new VG.

mas90@neptune ~ $ sudo pvcreate /dev/hda6
    Physical volume "/dev/hda6" successfully created

mas90@neptune ~ $ sudo vgcreate neptune_vg /dev/hda6
    No physical volume label read from /dev/hda6
    /dev/hda6 not identified as an existing physical volume
    Unable to add physical volume '/dev/hda6' to volume group 'neptune_vg'.

mas90@neptune ~ $ sudo dd if=/dev/hda6 bs=1k count=1 | hexdump -c
1+0 records in
1+0 records out
0000000  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
*
0000200   L   A   B   E   L   O   N   E 001  \0  \0  \0  \0  \0  \0  \0
0000210   #   - 335   }      \0  \0  \0   L   V   M   2       0   0   1
0000220   h   2   W   4   r   k   w   f   t   N   B   j   s   h   W   f
0000230   M   r   s   a   E   O   f   q   3   M   U   J   S   Z   w   z
0000240  \0   n   ) 342 004  \0  \0  \0  \0  \0 003  \0  \0  \0  \0  \0
0000250  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0000260  \0  \0  \0  \0  \0  \0  \0  \0  \0 020  \0  \0  \0  \0  \0  \0
0000270  \0 360 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0000280  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
*
0000400
1024 bytes (1.0 kB) copied, 0.009396 seconds, 109 kB/s

What could cause this?

The system is running Ubuntu Edgy, with the following versions:

mas90@neptune ~ $ sudo lvm version
    LVM version:     2.02.06 (2006-05-12)
    Library version: 1.02.07 (2006-05-11)
    Driver version:  4.6.0

mas90@neptune ~ $ uname -a
Linux neptune 2.6.17-10-generic #2 SMP Tue Oct 10 19:45:28 UTC 2006 i686 
GNU/Linux

Many thanks.

-- 
Malcolm Scott
Research Associate, TINA project
University of Cambridge Computer Laboratory
