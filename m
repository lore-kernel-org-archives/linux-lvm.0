Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 27 Mar 2001 15:14:58 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM, lilo and MBR?
Message-ID: <20010327151458.E993@tykepenguin.com>
References: <m2g0fzsghb.fsf@isnogud.escape.de> <20010327110158.A2403@tykepenguin.com> <m2ae67s4yc.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2ae67s4yc.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Tue, Mar 27, 2001 at 03:43:07PM +0200
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 27, 2001 at 03:43:07PM +0200, Urs Thuermann wrote:
> Patrick Caulfield <caulfield@sistina.com> writes:
> 
> > Yes it is. Don't run LILO on /dev/sda if it's a PV because it will
> > destroy it.  You should partition the disk into /dev/sda1 (that way
> > the PV will start further in and leave space for LILO)
> 
> Hm, I hoped I could get rid of the broken partitioning scheme of the
> PC and C/H/S addressing used in the partition table.
> 
> Are there objections to change LVM so that the VGDA is placed at some
> fixed offset (say 1 sector or 1 block (1K)) from the beginning of the
> PV?  This is how many file systems also use block devices to avoid
> conflicts with MBR, boot sectors and so on.

There are no plans to do this for the near future

 
> BTW, are the other partitioning schemes that I could use than the one
> that the standard MBR and MSDOS use?  Can the linux kernel recognize
> other partition tables which only use absolut, linear sector numbers?

LVM works quite happily with any of Linux's supported disk labelling systems,
but I think Sun and IRIX disk labels still use cylinders.

If you're really worried about broken partitioning systems then perhaps you
should use a less broken platform than a PC :-) Alphas are very nice, and you
could use the BSD disklabel utility to slice up the disk.


patrick
