Date: Mon, 3 Jul 2000 18:16:14 +0100
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
Message-ID: <20000703181614.N3284@redhat.com>
References: <B45465FD9C23D21193E90000F8D0F3DF6834F1@mailsrv.linkvest.ch> <20000703150524.E2931@redhat.com> <20000703181627.A19757@gruyere.muc.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000703181627.A19757@gruyere.muc.suse.de>; from ak@suse.de on Mon, Jul 03, 2000 at 06:16:27PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>, linux-lvm@msede.com

Hi,

On Mon, Jul 03, 2000 at 06:16:27PM +0200, Andi Kleen wrote:
> On Mon, Jul 03, 2000 at 03:05:24PM +0100, Stephen C. Tweedie wrote:
> > The only known problem with journaling and software raid is to do with
> > the raid array rebuild code in raid1/5.  The rebuild could cause I/O
> > to be done in the wrong order for the filesystem, causing clean blocks
> > in the buffer cache to be flushed to disk as part of the rebuild.
> > That is fixed in the 2.4 soft raid.  raid0 and LVM were never affected
> > by this as they have no rebuild operation.
> 
> Note this applies only to the RAID1 in Raid 0.90 or in 2.4.
> Unpatched 2.2 does Raid1 reconstruction in user space only and should be 
> safe for journaling.

I think the user-space rebuild still has the same problem --- it
accesses the underlying raid device through the buffer cache, causing
clean buffers to be written to disk.  That's enough to kill
journaling.

Cheers,
 Stephen
