Return-Path: <thornber@btconnect.com>
Date: Thu, 3 May 2001 14:46:50 +0100
Subject: Re: [linux-lvm] Software RAID on LVM
Message-ID: <20010503144650.A1228@66bassett.freeserve.co.uk>
References: <Pine.LNX.4.31L2.0105030602060.3414-100000@theendoftime.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31L2.0105030602060.3414-100000@theendoftime.net>; from fox@theendoftime.net on Thu, May 03, 2001 at 06:06:41AM -0600
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, May 03, 2001 at 06:06:41AM -0600, fox@theendoftime.net wrote:
> Hi;
> 
> I've been on the list for a few days now and I'm starting to get a sense
> of what LVM can an cannot do (I come from AIX's LVM and I'm happy to see
> Linux is starting to have something similar)
> 
> One thing I've not gotten a full sense of is can you have a RAID 1 array
> sit ontop of a LVM filesystem?  I understand that LVM does not have any
> internal RAID capabilities (that's the sense I've been getting...though I
> might be on glue...never count out that possibility with me ;) but might
> be possible to have the internal Software RAID in Linux to sit ontop of a
> filesystem using the LVM.

It depends on the kernel version that you are running.  On 2.4.x
kernels you should be able to run LVM and software raid on top of each
other (this is not something I've tried but I believe other people are
doing so).

With 2.2 kernels I have provided a patch (see LVM/PATCHES/README)
which should allow you to stack LVM on top of software RAID, but not
the other way round.

> Also, what type of filesystem is recommended for use with LVM (and
> possibly RAID 1?  I'm quite hopeful for that...)  I'm thinking ReiserFS is
> the FS of choice here, but would anyone mind clairifying for me why it
> would be better, or which you think would be better?

I don't think any particular fs stands out for use with LVM; choose
the one with the characteristics you want.  I'm sure you can dig up
reiserfs vs. ext2 comparisons on the web.

- Joe
