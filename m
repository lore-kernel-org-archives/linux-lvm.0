Message-ID: <38934AD7.C1C33D5F@msede.com>
Date: Sat, 29 Jan 2000 21:17:27 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: spacey@lenin.nu
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: (reiserfs) Re: AIX JFS dual-mount (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Sat, 29 Jan 2000 09:54:03 -0800
From: "Peter C. Norton" <spacey@lenin.nu>
Subject: Re: [linux-lvm] Re: (reiserfs) Re: AIX JFS dual-mount
Message-ID: <20000129095403.A24375@lenin.nu>
References: <Pine.LNX.4.10.10001280539550.13561-100000@home.suse.com>
<20000129001449.A13523@ultraviolet.org>
In-Reply-To: <20000129001449.A13523@ultraviolet.org>; from
treed@ultraviolet.org on Sat, Jan 29, 2000 at 12:14:49AM -0800

GFS seems to require some support from hardware in the way of
"dlocks", a
not-too widely supported standard.  I think you'd need to have drives
that
implement dlocks, and that the lvm would have to know about them. 
What
would need to be done to the volume stuff to support dlocks?  Could
any
filesystem be built on top of a volume manager with dlock support?

-Peter

On Sat, Jan 29, 2000 at 12:14:49AM -0800, Tracy R Reed wrote:
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
> environment if it is all it's cracked up to be) only not over fibrechannel. It
> does fine grain locking, manages cache coherency, the works:
> 
> www.globalfilesystem.org
> 
> I've been meaning to mention this to you guys and make sure everyone was aware
> of it. It is a journalling filesystem while allows multiple hosts to mount the
> same filesystem at the same time. I hope to see a lot of integration between
> reiserfs, GFS, LVM, and MD in the future. There is currently a lot of overlap
> in these areas. Linux needs all of these features to be smoothly integrated
> and very stable if it is going to go head to head with the big boys someday.
> 
> --
> Tracy Reed      http://www.ultraviolet.org

-- 
The 5 year plan:
In five years we'll make up another plan.
Or just re-use this one.
