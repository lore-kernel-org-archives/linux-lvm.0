Return-Path: <phillips@bonn-fries.net>
From: Daniel Phillips <phillips@bonn-fries.net>
Date: Mon, 16 Jul 2001 15:19:39 +0200
References: <200107151747.f6FHlAU60256@aslan.scsiguy.com> <20010716205633.G11938@weta.f00f.org>
In-Reply-To: <20010716205633.G11938@weta.f00f.org>
MIME-Version: 1.0
Message-Id: <01071615193905.06482@starship>
Content-Transfer-Encoding: 7BIT
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
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
To: Chris Wedgwood <cw@f00f.org>, "Justin T. Gibbs" <gibbs@scsiguy.com>
Cc: Jonathan Lundell <jlundell@pobox.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

On Monday 16 July 2001 10:56, Chris Wedgwood wrote:
> On Sun, Jul 15, 2001 at 11:47:10AM -0600, Justin T. Gibbs wrote:
>
>     Simply disabling the write cache does not guarantee the order of
>     writes.  For one, with tagged I/O and the use of the SIMPLE_Q tag
>     qualifier, commands may be completed in any order.  If you want
>     some semblance of order, either disable the write cache or use
> the FUA bit in all writes, and use the ORDERED tag qualifier.  Even
> when using these options, it is not clear that the drive cannot
> reorder writes "slightly" to make track writes more efficient (e.g.
> two separate commands to write sequential sectors on the same track
> may be written in reverse order).
>
> ORDERED sounds like the trick...  I assume this is some kind of
> write-barrier? If so, then I assume it has some kind of strict
> temporal ordering, even between command issues to the drive.
>
> If so, that would be idea if we can have the fs communicate this all
> the way down to the device layer, making it work for soft-raid and
> LVM be a little harder perhaps.

There was general agreement amongst filesystem developers at San Jose
that we need some kind of internal interface at the filesystem level
for this, independent of the type of underlying block device - IDE,
SCSI or "other".  That's as far as it got.

--
Daniel
