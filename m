Message-ID: <4B2AD174.40402@redhat.com>
Date: Thu, 17 Dec 2009 19:48:52 -0500
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] brainfart: lilo'd a PV
References: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
In-Reply-To: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
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
To: linux-lvm@redhat.com

On 12/17/09 18:41, Brian J. Murrell wrote:
> I managed to write a lilo block (lilo) to the start of a PV which I have
> on /dev/sda (note, /dev/sda is a whole disk PV, unpartitioned).
> 
> However, looking at a number of different PVs here, it appears that the
> LVM data starts at 0x200 with: "LABELONE".  i.e.:
> 
> # hexdump -C /dev/sdc3
> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE........|
> ...
> # hexdump -C /dev/sdb
> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 000001b0  00 00 00 00 00 00 00 00  dc 59 0f 10 cf c9 00 00  |.........Y......|
> 000001c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE........|
> ...
> # hexdump -C /dev/sda 
> 00000000  fa eb 31 12 00 00 4c 49  4c 4f 16 08 10 00 01 00  |..1...LILO......|
> ...
> 00000180  30 e4 cd 13 eb 91 e8 93  fe 44 69 73 6b 20 72 65  |0........Disk re|
> 00000190  61 64 20 65 72 72 6f 72  0d 0a 00 00 00 00 00 00  |ad error........|
> 000001a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 000001b0  00 00 00 00 00 00 00 00  c6 08 1a 45 cf c9 00 00  |...........E....|
> 000001c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 000001f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 55 aa  |..............U.|
> 00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE........|
> 
> Is that correct?

Yes. The area begin with "LABELONE" is PV label, which is recorded in
the first sector by default. This is the description from the pvcreate
man page.

       --labelsector sector
              By default the PV is labelled with an  LVM2  identifier  in  its
              second  sector (sector 1).  This lets you use a different sector
              near the start of the disk (between 0  and  3  inclusive  -  see
              LABEL_SCAN_SECTORS in the source).  Use with care.

> Is there anything I should do to repair this or is my brainfart benign
> to this PV?

You don't have any problem on the PV, do you?
I don't think you need something to repair the PV.

Thanks,
Taka
