Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p26COpep012563
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2011 07:24:51 -0500
Received: from ns.mindbit.ro (ns.mindbit.ro [80.86.127.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p26COevZ031946
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2011 07:24:41 -0500
Received: from [10.0.1.130] (Rendec.iNES.RO [80.86.127.25])
	(authenticated bits=0)
	by ns.mindbit.ro (8.13.8/8.13.8) with ESMTP id p26COdgm003240
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2011 14:24:39 +0200
From: Radu Rendec <radu.rendec@mindbit.ro>
In-Reply-To: <AANLkTinATFdAZ6fsrE_vkfJ6pMrF6v0xfN4hu8sqEP0N@mail.gmail.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
	<1299228115.13997.37.camel@localhost>
	<AANLkTinATFdAZ6fsrE_vkfJ6pMrF6v0xfN4hu8sqEP0N@mail.gmail.com>
Date: Sun, 06 Mar 2011 14:24:41 +0200
Message-ID: <1299414281.13997.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2011-03-05 at 15:13 +1300, Scott Arthur wrote:
> I've been playing around on a test system with a similar partition
> table. 
> 
> 
> Have successfully resized 2 to fill the disk extent. Partition 5
> however proves to be problematic.
> 
> 
> Using fdisk, I tried deleting 2 and 5 and recreating based on sectors,
> but couldn't recreate 5 on the same starting sector, it told me I was
> out of bounds. 

Perhaps there's a (hidden) problem with partition 2 as well: it should
also start on the same sector as it did before deleting/re-creating.
Otherwise it would "push" the beginning of partition 5 by a bunch of
sectors.

> I then tried the same thing with fdisk but with cylinders instead and
> both partitions were recreated okay, but destroyed all my LVM stuff.

It's exactly like Milan Broz said in his earlier post: if the partition
doesn't start at exactly the same location (sector) as it did before,
LVM won't find its metadata at the expected location, thus rendering the
volume unusable.

> I can happily resize 2 using parted but parted wont resize 5.
> 
> 
> Should I expect to be able to resize 5, or am I missing the point.
> Should I simply be creating a partition 6 to fill the additional space
> opened up by the resizing of partition 2?

Yup, you should create partition 6 to fill the remaining space, then
make it a physical volume and add it to the volume group. At least this
is what I had in mind when I made the other post.

Someone else also suggested simply extending the physical volume. I
haven't done this, but I guess it is also worth looking into it.
However, you should resize the partitions anyway (even if you use this
approach). It's just that you would resize partition 5 instead of
creating partition 6.

> 
> On 4 March 2011 21:41, Radu Rendec <radu.rendec@mindbit.ro> wrote:
>         On Thu, 2011-03-03 at 15:18 -0500, Stuart D. Gathman wrote:
>         > On Thu, 3 Mar 2011, Scott Arthur wrote:
>         >
>         > > Partition Table: msdos
>         > >
>         > > Number  Start   End     Size    Type      File system
>          Flags
>         > >  1      32.3kB  296MB   296MB   primary   ext4
>         boot
>         > >  2      296MB   1000GB  1000GB  extended
>         > >  5      296MB   1000GB  1000GB  logical                lvm
>         > >
>         > > I'm obviously wanting to expand the LVM partition to fill
>         the remaining 1TB
>         > > of space.
>         > >
>         > > Am I able to simply use parted to resize the partition
>         before doing a
>         > > pvresize etc?
>         > >
>         > > Or is it risky to resize the underlying LVM partition?
>         
>         
>         I wouldn't do that. Instead, I would create a new logical
>         partition,
>         "format" it as lvm physical volume and then extend the volume
>         group to
>         use this partition as well.
>         
>         I think this can be safely done like this:
>         
>         * turn off lvm;
>         * note down the exact starting and ending *sector* of
>         partition 5 (using
>         fdisk -lu)
>         * use fdisk and delete partition 5 and 2, then re-create
>         partition 2 up
>         to the full disk size
>         * re-create partition 5 making sure it's on exactly the same
>         starting
>         and ending sector as it was before
>         * create new partition 6
>         
>         > You are getting to a size where msdos partition tables are
>         risky.
>         > Don't they crap out at 2TB?
>         
>         
>         They do. But the "2TB" disk is actually 2000GB, which is safe
>         (it takes
>         more than 2048GB to run into trouble with m$dos partitions).
>         
>         Best regards,
>         
>         Radu Rendec
