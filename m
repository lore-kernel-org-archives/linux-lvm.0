Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBIC9Mie000994
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 07:09:22 -0500
Subject: Re: [linux-lvm] brainfart: lilo'd a PV
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <4B2AD174.40402@redhat.com>
References: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
	<4B2AD174.40402@redhat.com>
Date: Fri, 18 Dec 2009 12:09:46 +0000
Message-Id: <1261138186.11367.48.camel@localhost>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2009-12-17 at 19:48 -0500, Takahiro Yasui wrote:
> On 12/17/09 18:41, Brian J. Murrell wrote:
> > I managed to write a lilo block (lilo) to the start of a PV which I have
> > on /dev/sda (note, /dev/sda is a whole disk PV, unpartitioned).
> > 
> > However, looking at a number of different PVs here, it appears that the
> > LVM data starts at 0x200 with: "LABELONE".  i.e.:
> > 
> > # hexdump -C /dev/sdc3
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE........|
> > ...
> > # hexdump -C /dev/sdb
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 000001b0  00 00 00 00 00 00 00 00  dc 59 0f 10 cf c9 00 00  |.........Y......|
> > 000001c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE........|
> > ...
> > # hexdump -C /dev/sda 
> > 00000000  fa eb 31 12 00 00 4c 49  4c 4f 16 08 10 00 01 00  |..1...LILO......|
> > ...
> > 00000180  30 e4 cd 13 eb 91 e8 93  fe 44 69 73 6b 20 72 65  |0........Disk re|
> > 00000190  61 64 20 65 72 72 6f 72  0d 0a 00 00 00 00 00 00  |ad error........|
> > 000001a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 000001b0  00 00 00 00 00 00 00 00  c6 08 1a 45 cf c9 00 00  |...........E....|
> > 000001c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 000001f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 55 aa  |..............U.|
> > 00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE........|
> > 
> > Is that correct?
> 
> Yes. The area begin with "LABELONE" is PV label, which is recorded in
> the first sector by default. This is the description from the pvcreate
> man page.
> 
>        --labelsector sector
>               By default the PV is labelled with an  LVM2  identifier  in  its
>               second  sector (sector 1).  This lets you use a different sector
>               near the start of the disk (between 0  and  3  inclusive  -  see
>               LABEL_SCAN_SECTORS in the source).  Use with care.
> 
> > Is there anything I should do to repair this or is my brainfart benign
> > to this PV?
> 
> You don't have any problem on the PV, do you?
> I don't think you need something to repair the PV.

Yeah, you should be fine here since LVM2 does not use the 1st sector of
the device and the MBR (and hence lilo) does all its work in that 1st
sector. The LVM2 PV label begins in the 2nd sector (as you've noticed)
and has been left intact by these changes.

You could always zero out sector 0 to avoid confusion:

dd if=/dev/zero of=/path/to/pv bs=512 count=1

Regards,
Bryn.
