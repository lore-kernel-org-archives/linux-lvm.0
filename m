References: <38537c05-ba92-9817-a791-19ac39b9615f@yahoo.co.uk>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <2feba733-6812-3c1f-d42a-3e5eea82a636@redhat.com>
Date: Thu, 7 Sep 2017 11:16:47 +0200
MIME-Version: 1.0
In-Reply-To: <38537c05-ba92-9817-a791-19ac39b9615f@yahoo.co.uk>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lv raid - how to read this?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, lejeczek <peljasz@yahoo.co.uk>

Dne 7.9.2017 v 10:06 lejeczek napsal(a):
> hi fellas
> 
> I'm setting up a lvm raid0, 4 devices, I want raid0 and I understand & expect 
> - there will be four stripes, all I care of is speed.
> I do:
> $ lvcreate --type raid0 -i 4 -I 16 -n 0 -l 96%pv intel.raid0-0 /dev/sd{c..f} # 
> explicitly four stripes
> 
> I see:
> $ mkfs.xfs /dev/mapper/intel.sataA-0 -f
> meta-data=/dev/mapper/intel.sataA-0 isize=512    agcount=32, agsize=30447488 blks
>           =                       sectsz=512   attr=2, projid32bit=1
>           =                       crc=1        finobt=0, sparse=0
> data     =                       bsize=4096 blocks=974319616, imaxpct=5
>           =                       sunit=4      swidth=131076 blks
> naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
> log      =internal log           bsize=4096   blocks=475744, version=2
>           =                       sectsz=512   sunit=4 blks, lazy-count=1
> realtime =none                   extsz=4096   blocks=0, rtextents=0
> 
> What puzzles me is xfs's:
>   sunit=4      swidth=131076 blks
> and I think - what the hexx?


Unfortunatelly  'swidth'  in XFS has different meaning than lvm2's  stripe 
size parameter.

In lvm2 -


-i | --stripes    - how many disks
-I | --stripesize    - how much data before using next disk.

So  -i 4  & -I 16 gives  64KB  total stripe width

----

XFS meaning:

suinit = <RAID controllers stripe size in BYTES (or KiBytes when used with k)>
swidth = <# of data disks (don't count parity disks)>

----

---- so real-world example ----

# lvcreate --type striped -i4 -I16 -L1G -n r0 vg

or

# lvcreate --type raid0  -i4 -I16 -L1G -n r0 vg

# mkfs.xfs  /dev/vg/r0 -f
meta-data=/dev/vg/r0             isize=512    agcount=8, agsize=32764 blks
          =                       sectsz=512   attr=2, projid32bit=1
          =                       crc=1        finobt=1, sparse=0, rmapbt=0, 
reflink=0
data     =                       bsize=4096   blocks=262112, imaxpct=25
          =                       sunit=4      swidth=16 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=552, version=2
          =                       sectsz=512   sunit=4 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0


---- and we have ----

sunit=4         ...  4 * 4096 = 16KiB        (matching  lvm2 -I16  here)
swidth=16 blks  ... 16 * 4096 = 64KiB
    so we have  64 as total width / size of single strip (sunit)  ->  4 disks
    (matching  lvm2 -i4 option here)

Yep complex, don't ask... ;)



> 
> In a LVM non-raid stripe scenario I've always remember it was: swidth = sunit 
> * Y where Y = number of stripes, right?
> 
> I'm hoping some expert could shed some light, help me(maybe others too) 
> understand what LVM is doing there? I'd appreciate.
> many thanks, L.


We in the first place there is major discrepancy in the naming:

You use intel.raid0-0   VG name
and then you mkfs device: /dev/mapper/intel.sataA-0  ??

While you should be accessing: /dev/intel.raid0/0

Are you sure you are not trying to overwrite some unrelated device here?

(As your shown numbers looks unrelated, or you have buggy kernel or blkid....)


Regards

Zdenek
