Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103271811.f2RIBS005020@webber.adilger.int>
Subject: Re: [linux-lvm] LVM, lilo and MBR?
In-Reply-To: <m2ae67s4yc.fsf@isnogud.escape.de> from Urs Thuermann at "Mar 27,
 2001 03:43:07 pm"
Date: Tue, 27 Mar 2001 11:11:28 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs Thuermann wrote:
> Patrick Caulfield <caulfield@sistina.com> writes:
> > 2. IIRC, someone had a patch for lilo to load the kernel and initrd
> >    image from a LV.  Where can I get it?  And will it go into the
> >    standard lilo package?
> 
> Andreas will be along in a moment !

Yes, patch for LILO has already been sent to LVM mailing lists a
couple of times.  I found a copy at:

http://marc.theaimsgroup.com/?l=linux-lvm&m=98451699131728&w=4

I have not yet submitted it to the LILO maintainer, because if you try
to run it on older LVM kernel code (i.e. what's in the official 2.4.2
kernel), it will immediately crash your system.  The Sistina folks have
told me they will submit an LVM kernel patch with the fix...

> > Don't run LILO on /dev/sda if it's a PV because it will destroy
> > it.  You should partition the disk into /dev/sda1 (that way
> > the PV will start further in and leave space for LILO)
> 
> Hm, I hoped I could get rid of the broken partitioning scheme of the
> PC and C/H/S addressing used in the partition table.

But then again, your MBR has the same problems, so why worry?  Even so,
you only need the partition table on the boot disk, so no big deal.

> Are there objections to change LVM so that the VGDA is placed at some
> fixed offset (say 1 sector or 1 block (1K)) from the beginning of the
> PV?  This is how many file systems also use block devices to avoid
> conflicts with MBR, boot sectors and so on.

Yes, because it will break every LVM setup around.  Too bad it wasn't
in the original design, but it is too late to change.

Cgeers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
