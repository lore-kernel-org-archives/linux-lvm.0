Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k598OtSR006962
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 04:24:55 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k598Osbv012358
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 04:24:54 -0400
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] How Can I modify the mapping PE to LE??
Date: Fri, 9 Jun 2006 03:24:37 -0500
References: <16630672.1149686019060.JavaMail.root@mail1>
In-Reply-To: <16630672.1149686019060.JavaMail.root@mail1>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200606090324.38178.krakrjak@volumehost.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: jowkju@postech.ac.kr, LVM general discussion and development <linux-lvm@redhat.com>

On Wednesday 07 June 2006 08:13, 조완근 wrote:
> Hello, I'm at the beginning to use LVM in my machine.
Congrats!

> Could you give any information on the implementation details of LVM and
> device mapper?? More specifically, I want to change the "mapping between PE
> and LE" for some purposes, however I'm just finished to read the manual of
> LVM-HowTO. This means that I'm totally a&nbsp;newbie in LVM and
> device-mapper. I just read some codes on data
> structures&nbsp;in&nbsp;LVM2/lib/metadata/metadata.h, but I can't get more
> information anymore on how they are mapped.
Well really it's down to basic concepts here.  A physical volume is created 
using some backing store (block device).  The pv is then put into a volume 
group where it is split into PEs (Physical Extents) that are then used to 
create logical volumes.  Logical volumes are split up into LE (Logical 
Extents) which are the same size as the volume groups PE size.  The idea is 
that any LE can be on a PE from any pv in the volume group.  (make sense?)

Now if you wish to discover which LEs map to which PEs (and in turn what 
disks) you need to use lvdisplay -m vg/lv and this will give you each set of 
extent ranges and what PE/PVs they map to.  Here is an example:
ath600 sbin # lvdisplay -m main/var
  --- Logical volume ---
  LV Name                /dev/main/var
  VG Name                main
  LV UUID                Qq9ywx-zPNR-mbhn-LcZ4-7ZEV-AJhF-42wDk1
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                8.00 GB
  Current LE             2048
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2

  --- Segments ---
  Logical extent 0 to 511:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    30976 to 31487

  Logical extent 512 to 1279:
    Type                linear
    Physical volume     /dev/sdb
    Physical extents    25725 to 26492

  Logical extent 1280 to 2047:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    45056 to 45823

So you can clearly see that both /dev/sda3 and sdb are spanned for this 
logical volume.  You can see which LEs map to which PEs.

> I'll use LVM for&nbsp;this purpose -&nbsp;I would like to make&nbsp;a
> program to change the mapping relationship between PE and LE in my own. In
> fact,&nbsp;the program's goal is to move an extent in a bad disk to a disk
> with good performance.&nbsp;The movement is done by the extent. In order to
> do it, I definitely, have to know how I can modify the mapping and maybe,
> the entire structure of LVM and device mapper.
Okay this is actually already done.  You are looking for pvmove.  Check its 
man page.  If you want to move all allocated extents from a slow drive to a 
faster one it's quite easy, just do pvmove /dev/slowdisk /dev/fastdisk.  
However if you just want to move extents from some LVs then you'll need the 
much more advanced, pvmove /dev/slowdisk:beginextent-endextent /dev/fastdisk, 
version of the command.  Use the output of lvdisplay -m to guide you in the 
extents.

> Could you give me some information on LVM &amp; device-mapper details that
> help me??
Not sure you need these details, just more fundamental knowledge of the 
concepts and of what the userland tools can do for you.

> I'm totally at the beginning, I'm well prepared to dig in the codes from
> now on, does anyone can help me to run faster??
No need to read the code unless you really really really get stuck and this 
list can't help you.  And if you've made it that far then someone on this 
list will surely be of good service as a starting point.

If you really want to run faster you can move data that is touched often onto 
faster disks with pvmove.  Also making volumes contiguously helps and you can 
use pvmove to make existing logical volumes contiguous as well.  I'll leave 
that as an excercise for the reader.

Hope That helps!

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
