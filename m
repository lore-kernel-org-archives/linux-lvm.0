From: James Hawtin <oolon@pzat.meep.org>
Subject: Re: [linux-lvm] lvcreate distributed extent option
In-Reply-To: <615A249B783CD41192F400D0B747AC8608982643@hesse.bbn.hp.com>
Message-ID: <Pine.LNX.4.44.0211301337180.4178-100000@pzat.meep.org>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat Nov 30 07:41:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com


On Sat, 30 Nov 2002, ZECHA,HOLGER (HP-Germany,ex1) wrote:

>
> Hello,
>
> I want to create a logical volume of 40GB Size using a physical 9GB disks,is
> there a way to create a logical volume in the way, that the first logical
> extend is on disk one, the second on disk two, ... the 7th on disk one and
> so on ?
>
> Meaning all logical extends are distributed accross all disks.
>
> In HP-UX lvdisplay wwill look like this:
>    --- Logical extents ---
>    LE    PV1                PE1   Status 1
>    00000 /dev/dsk/c16t0d0   00012 current
>    00001 /dev/dsk/c16t0d1   00012 current
>    00002 /dev/dsk/c17t0d2   00000 current
>    00003 /dev/dsk/c17t0d3   00000 current
>    00004 /dev/dsk/c16t0d4   00000 current
>    00005 /dev/dsk/c16t0d5   00000 current
>    00006 /dev/dsk/c17t0d6   00000 current
>    00007 /dev/dsk/c17t0d7   00000 current
>    00008 /dev/dsk/c16t1d0   00000 current
>    00009 /dev/dsk/c16t1d1   00000 current
>    00010 /dev/dsk/c17t1d2   00000 current
>    00011 /dev/dsk/c17t1d3   00000 current
>    00012 /dev/dsk/c16t1d4   00000 current
>
> Holger
>

How about striping with the strip size equal to that of a logical extent?

otherwise if you have quite alot of disk space on another drive you could
create your lv on that one then move the extents one at a time to the
destinations drives using pvmove.....

One does wonder why you want to do this!

James
