Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103132302.f2DN2u305720@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
In-Reply-To: <20010313232626.A31056@cistron.nl> from Wichert Akkerman at "Mar
 13, 2001 11:26:26 pm"
Date: Tue, 13 Mar 2001 16:02:56 -0700 (MST)
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

Wichert, you write:
> Previously Andreas Dilger wrote:
> > Wichert writes:
> > > I think I'll add the LVM10 ioctls to strace 4.4 actually :)
> > 
> > That would be nice.
> 
> Turns out this is impossible: LVM made the same mistake some of the OSS
> sound drivers did and used ioctl numbers that the kernel already uses
> for other purposes. This is not a problem for the kernel itself, but
> means a tool like strace can't decode syscalls.

What are they duplicated with?  I was recently checking the 2.4.x version
of Documentation/ioctl-number.txt, and there was nothing for 0xFE at all.
In fact, just to avoid this problem, I submitted a patch to the list here
(and to MEC) to "register" the LVM ioctl numbers.

Hard to avoid duplicating ioctl numbers, if it is not documented anywhere.
Does strace know about other ioctl numbers not listed in ioctl-number.txt?
Interested in making a patch which lists them and submitting it to Linus?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
