Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106041734.f54HYLbh020302@webber.adilger.int>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
In-Reply-To: <3B1AC411.D6E307CD@tls.msk.ru> "from Michael Tokarev at Jun 4, 2001
 03:11:13 am"
Date: Mon, 4 Jun 2001 11:34:21 -0600 (MDT)
MIME-Version: 1.0
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

Michael Tokarev writes:
> > Whats IOP anyhow?
> 
> When you're in initrd, you already know (before even that initrd was
> created) what version will be used in a kernel for that you make this
> initrd, and the above wrappers not needed at all, you can just put
> appropriate lvmtools there.  Yes, you can put tools for all versions
> of a protocol and use a wrapper in initrd, but *why*?? ;)  Sed is needed
> to find that proto version based on output of an utility, and used inside
> a wrapper.

Yes, you are correct that you know in advance which IOP version you need.
However, it is much easier for lvmcreate_initrd to just copy all of the
programs (including the wrapper) to the initrd, instead of trying to find
which ones are needed and which are not needed.  In the end, the wrapper
is one disk block + a few directory entries (no more space needed).

The problem is that "sed" is used in the wrapper script.  AFAIK, I do not
have "sed" in my wrapper script, so I don't know where it came from.  Can
you tell me where the wrapper script comes from that you are using and/or
post a copy to this list so it can be fixed?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
