Message-ID: <3DAE7DE4.726F8309@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] performance comparison soft-hardware RAID + LVM:bad
References: <3DAC940D.7010903@netland.nl> <3DAD24A0.814E4028@silicide.dk> <3DAD8837.8070803@netland.nl>
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Oct 17 04:19:46 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Ron Arts wrote:
> =

> Jon Bendtsen wrote:
> > Ron Arts wrote:

[snip]
 =


> > I cant clearly see what is LVM setup and what isnt. Remember that LVM=

> > doesnt allocate blocks sequeltial, but by default the first one free.=

> > So, when you create 3 lv's, and then you mkfs them, then you allocate=

> > at least the first block. Then when you fill the rest of the
> > filesystem...
> > you allocate the next blocks. Results are one block in the beginning,=

> > a wide gap, and then the rest of the blocks.
> >
> =

> Sorry, I don't understand. Why the gap?
> Omn the other hand, the underlying devices are RAID-1 in software, the
> allocation shouldn't matter should it?

Well, let me try a state of the art (tm) ascii drawing ;-D

 disk1	 disk2
|-----| |-----| =


those you make into a mirror
    |-----|


Lets zoom in on that and see how LVM works	(unallocated vg)
|------------------------------------------------------------------------=
---------|
So, you make a lv in this vg
|#-----------------------------------------------------------------------=
---------|
Then you make another
|#=A4--------------------------------------------------------------------=
-----------|
You allocate some data for the first lv
|#=A4#####---------------------------------------------------------------=
-----------|
You allocate some data for the 2. lv
|#=A4#####=A4=A4=A4=A4=A4=A4---------------------------------------------=
-----------------------|

Can you see the trend now ??
when you need a "block" you just get the next free. So, unless you are
carefull, or
make it allocate all on creation, then you get this
|#=A4#####=A4=A4=A4=A4=A4=A4##=A4#=A4#=A4#=A4#=A4=A4=A4=A4####=A4=A4##=A4=
#=A4#=A4#=A4###=A4=A4=A4=A4##=A4=A4##=A4=A4##=A4=A4####=A4=A4=A4=A4=A4###=
##=A4=A4##=A4#|
And how do you think this changes your performance ? if you are reading
one BIG file.
that covers several # or =A4


> > I've done 3 (or 0.5 + 0.5 + 1) benchmarks. The first 2 times i didnt =
do
> > it well enough. I dont believe you have done it well enough, you clea=
rly
> > dont have enough numbers. I found that using tiobench i had to variat=
e
> > the number of threads (concurrent read/write) and the blocksize, befo=
re
> > i
> > got the best performance. And it variates alot. (See my .pdf, which i=

> > will
> > mail to you). I've got lots of numbers. I used gnuplot to create grap=
hs,
> =

> Okay, but lots of numbers still don't explain why in this particular ca=
se
> performance was so slow. If I understand why, I can begin to make
> optimizations.

I think it is the default allocation of "blocks" for a lv in a vg.
The point with lots of numbers was that just running one benchmark, with
one concurrent write, aka one "thread" and trying to write one big file,
rather than 10 medium files, doesnt give an adequette view of the
performance.


> To give some background:
> I do this because I need such a setup for a particular application
> (MySQL high volume logging server). If I understand the issues involved=

> I can make more informed choices implementing the application.
> Should it log using multiple threads or one? Will readers from the
> datbase hinder the writing process a lot? What is the best way
> to add disks using LVM, without taking a large performance hit?

I see your problem, but since you have many readers/writes, you
NEED to test it with concurrent access, maybe 10-20, or more

 =

> This server must be up 24x7. I found something called scsirastools
> that can deal with hotswapping SCSI disks under software RAID.

good. Think of adding many small scsi disks to your raid setup, and
then make it raid10, or raid1 ontop of raid 0 (or the other way arround,
see my repport for which one kills performance)

the proxy server squid can handle more than one area to store the
files. You'll get greater performance by giving it more small areas,
rather than putting the disks into a larger raid array. MAYBE your
mysql logging server can do the same thing ?


> I thought I'd first try some benchmarks with bonnie to get a feel
> for the issues involved, and seeing the performance (and CPU) hit
> for my LVM setup (and having never used LVM before) I decided
> to ask you guys about this.

understandable, but i think you need to do more benchmarking, with
more than one concurrent access.

 =

> And thanks for your report, at least it confirmed what I
> had seen: software raid is faster then hardware.

Well, it can be. I havent tried with _MANY_ disks, and i havent
tried with cpu load arround 100%. (per cpu). Actualy, as i wrote =

somewhere in the repport, i would like if someone parallized the
raid, so you could get linear to the number of harddisks performance,
or fill the pci bus. So, someone who reads this... just parallize the
raid, it's not like the first block needs the next block, or the one
before that, so just create a simple asic, it doesnt need to be fast
just many of them, so the pci bus can be filled. 64bit 66MHz of course
;-D




JonB
