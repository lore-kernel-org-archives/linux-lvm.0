Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MHeW2K026959
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:40:32 -0400
Received: from ranger.systems.pipex.net (ranger.systems.pipex.net
	[62.241.162.32])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3MHeVPH001948
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:40:32 -0400
Received: from 192.168.0.7 (userb089.dsl.pipex.com [62.188.49.89])
	by ranger.systems.pipex.net (Postfix) with ESMTP id 5536BE0003EE
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 18:40:25 +0100 (BST)
Message-ID: <1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
In-Reply-To: <20060422080622.GB15564@percy.comedia.it>
References: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
	<20060422080622.GB15564@percy.comedia.it>
Date: Sat, 22 Apr 2006 18:40:36 +0100 (BST)
Subject: Re: [linux-lvm] restoring my lvm
From: "Jannetta S Steyn" <jannetta@henning.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: jannetta@henning.org,
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

Hi Luca

> On Sat, Apr 22, 2006 at 12:06:55AM +0100, Jannetta S Steyn wrote:
>>My problem was that the new system (also FC4 and also a vanilla install)
>>already had VolGroup00. I then did a 'vgcreate VolGroup01 /dev/hdb2'. I
> vgcreate = msdos format
> you just wiped your disk

It didn't take very long and didn't give any warnings, so I thought it
just wrote the volume name to somewhere on the disk.

> if you are certain that the previous logical volume spanned the whole
> disk, you can:
> # vgdisplay /dev/VolGroup01

vgdisplay /dev/VolGroup01
  --- Volume group ---
  VG Name               VolGroup01
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               2.93 GB
  PE Size               4.00 MB
  Total PE              749
  Alloc PE / Size       0 / 0
  Free  PE / Size       749 / 2.93 GB
  VG UUID               Fv9M5d-0VU8-PiyT-yg4g-FY2C-Ogcc-30klLO


> and look at the "Total PE" value, then
> # lvcreate -Z n -l TOTAL_PE -n LogVol01 /dev/VolGroup01

What I'm certain about is that there are two partitions on the disk:
   Device Boot      Start         End      Blocks   Id  System
/dev/hdb1   *           1         203      102280+  83  Linux
/dev/hdb2             204        6296     3070872   8e  Linux LVM

/dev/hdb2 has two physical volumes, the first a swap and the second data.


> but i'd rater first try with http://www.cgsecurity.org/wiki/TestDisk
> which might be able to recover the damage you did.


I have downloaded testdisk and this is what I get:

TestDisk 6.3, Data Recovery Utility, March 2006
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/hdb - 3249 MB / 3098 MiB - CHS 6296 16 63
     Partition               Start        End    Size in sectors
* Linux                    0   1  1   202  15 63     204561 [/boot]
D Linux                  203   0  1  5645  15 63    5486544 [/]
D Linux LVM              203   0  1  6295  15 63    6141744
D Linux                  229   0  1  5560  15 63    5374656
D Linux                  265   0  1  5596  15 63    5374656


Any suggestions as to what I could do now?

Thanks so far

Jannetta


Random Thought:
---------------
Two men were sitting over coffee, contemplating the nature of things,
with all due respect for their breakfast.  "I wonder why it is that
toast always falls on the buttered side," said one.
	"Tell me," replied his friend, "why you say such a thing.  Look
at this."  And he dropped his toast on the floor, where it landed on the
dry side.
	"So, what have you to say for your theory now?"
	"What am I to say?  You obviously buttered the wrong side."
