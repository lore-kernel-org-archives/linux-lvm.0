Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103201040.f2KAeuD00732@webber.adilger.int>
Subject: Re: [linux-lvm] Recovering PV's VG metadata
In-Reply-To: <3AB71D83.2000000@inetnow.net> from HopNet at "Mar 20, 2001 06:06:11
 pm"
Date: Tue, 20 Mar 2001 03:40:56 -0700 (MST)
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

"Hopnet" writes:
> Thanks to Heinz & Andreas for your suggestions.  They are "almost" working.
> :-)  I can activate the VG, but I'm getting "wrong major or minor number"
> from the mount of the lvol, so I'm thinking I have an offset that is not
> correct.

Is this a user message, or a kernel message?  Could you please give the
exact message, so I can find where it is coming from?

> hda showed: (after LILO, which was indeed the problem)
> PV Size               12.14 GB / NOT usable 3.21 MB [LVM: 16.09 MB]
> hdc showed:
> PV Size               12.14 GB / NOT usable 3.24 MB [LVM: 242 KB]
> 
> After I copied the header over, they are the same (as hdc).  Should they
> be the same?  Or do I need to fudge some more numbers in the hda header.

Yes, for the same disks, the PV info should be the same.

> Andreas, this appears to be a v1 header, so no uuid.  This confused the
> heck out of me for a while, until I finally deciphered part of lvm.h.
> Also, pvdata doesn't support -PU on this release.

Yes, I only noticed this after Heinz's post.

> If I can't get the offset fixed, I'll probably try creating the
> "lvrecover" that Andreas suggested.

I would avoid that, since it appears we are almost working.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
