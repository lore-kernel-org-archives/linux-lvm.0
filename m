Return-Path: <Stefan.Helfert@mpi-hd.mpg.de>
Message-ID: <3ADC129E.3C12373B@mpi-hd.mpg.de>
Date: Tue, 17 Apr 2001 11:53:34 +0200
From: Stefan Helfert <Stefan.Helfert@mpi-hd.mpg.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] disk add means trouble: vgscan -- invalid i/o protocol 
 version 5
References: <3ADB3B2A.B28AC133@mpi-hd.mpg.de> <20010416142849.B16508@sistina.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

AJ Lewis wrote:
> 
> On Mon, Apr 16, 2001 at 08:34:18PM +0200, Stefan Helfert wrote:
> > Dear list,
> >
> > I was running a stable configuration until yesterday:
> > several SCSI disks with standard partitions, two IDE disks, only one IDE
> > disk (Maxtor 40Gig /dev/hda) holding a LVM partition. LVM version that
> > of
> > SuSE 7.0, that was lvm-0.8 Build 111 from SuSE.
> >
> > When I added a 60 GB Maxtor IDE as primary slave, I found that vgscan
> > only
> > throws an "invalid i/o protocol" error. Upgrading to a SuSE 7.0 update
> > lvm did not help. Upgrading to the SuSE 7.1 lvm-0.9.1_beta-3 did not
> > help
> > except detailing the error "... protocol version 5".
> >
> > When detaching the 60 GB disk, everything works again. (The 60 Gig disk
> > is empty, it did not hold a partition table -- and it does not work with
> > a
> > partition table and some partition either.)
> 
> Can you run vgscan w/o the 60GB disk attached?  If so, that's very
> odd...there may be some crud on the front of the disk that the LVM tools are
> reading as metadata.

I'm sorry to tell:
The 40 Gig disk alone, w/o 60GB disk attached, vgscan runs.
I now have moved the data with the help of another machine, and
currently the 40 GB disk is primary master and the 60GB disk is primary
slave -- and vgscan does not run anymore. Note that the 60GB disk is
holding partitions now -- a NTFS partition and a ext2, but no LVM
partition there.

Ideas how to investigate ?

> 
> If you've updated the tools, you need to upgrade the kernel as well.  That's
> normally why you'd get the invalid IOP protocol message.

I understand. I did downgrade to LVM-0.8 again, since 0.9.1-beta3 did
not run with my 2.2 kernel.


Stefan
