From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001291836.TAA03466@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Re: (reiserfs) Re: AIX JFS dual-mount
In-Reply-To: <20000129001449.A13523@ultraviolet.org> from Tracy R Reed at "Jan 29, 2000  0:14:49 am"
Date: Sat, 29 Jan 2000 19:36:02 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Tracy R Reed <treed@ultraviolet.org>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> On Fri, Jan 28, 2000 at 05:47:01AM -0800, Chris Mason wrote:
> > On Fri, 28 Jan 2000, Russell Coker wrote:
> > > A colleague told me that with AIX machines you can have two systems mount the
> > > same file system, they then lock the bus whenever they need to do updates.
> > > 
> > > Can this give usable write performance?  If so is it worth considering?
> > > 
> > Only if you also include some kind of lock manager.  Without it, the two
> > boxes would have no way if knowing if and when their caches are still
> > valid.  
> > 
> > Once you have the lock manager, you don't need the full device 
> > lock, the systems can coordinate who is writing/reading which blocks.
> > 
> > Anybody know exactly what AIX provides here?  
> 
> Sounds similar to GFS (which I only recently learned about and find totally
> amazing and plan to play with soon and perhaps implement it in a production
> environment if it is all it's cracked up to be) only not over fibrechannel.

You can use parallel scsi as well.

> It does fine grain locking, manages cache coherency, the works:
> 
> www.globalfilesystem.org
> 
> I've been meaning to mention this to you guys and make sure everyone was aware
> of it. It is a journalling filesystem

Not so far.

The GFS group is working on journalling extensions right now.
AFAIK multi client journaling is supposed to be ready around march/april this.

> while allows multiple hosts to mount the
> same filesystem at the same time. I hope to see a lot of integration between
> reiserfs, GFS, LVM, and MD in the future. There is currently a lot of overlap
> in these areas.

Basically very little overlapping here.

reiserfs and GFS work fine with LVM right now because they work in different
layers of the kernel. The VFS and the Block Device Layer respectivly.

The disatvantage today is the lack of distribution/cluster support in LVM.

I'll work on extensions in that area this year taking into regard and
using the results (APIs etc.) the Linux Cluster Infrastructure Group
around Stephen Tweedie, Peter Bram, Volker Wiegand and others will give us.

Today you are only able to setup a LVM volume group and create logical volumes
on one host and to share it with the others in an afterwards not
changable manner 8-{(
Doing this you can create a GFS in each of these
volumes, mount is on all hosts and do i/o using the GFS given locking.
This has already been tested 8-{)

Journaling filesystems like ext3 and reiserfs _don't_ work reliable
with MD's RAID5 support because of buffercache issues (see recent linux-raid
threads). If you want to have disk redundancy in this case you better
install hardware raid subsystems.

> Linux needs all of these features to be smoothly integrated
> and very stable if it is going to go head to head with the big boys someday.
> 
> --
> Tracy Reed      http://www.ultraviolet.org
> 

Heinz


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
