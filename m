Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B1BDAA0.A02C0304@tls.msk.ru>
Date: Mon, 04 Jun 2001 22:59:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
References: <200106041734.f54HYLbh020302@webber.adilger.int>
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

Andreas Dilger wrote:
> 
[]
> Yes, you are correct that you know in advance which IOP version you need.
> However, it is much easier for lvmcreate_initrd to just copy all of the
> programs (including the wrapper) to the initrd, instead of trying to find
> which ones are needed and which are not needed.  In the end, the wrapper
> is one disk block + a few directory entries (no more space needed).

The wrapper is small enouth, but not all the tools.  If using only one
version of lvmtools in initrd, then wrapper is just unnecessary complicates
things (may be not an issue as you demonstrated).  If not, then size
is in trouble.  BTW, I see no reasons on not using small wrapper's piece
directly in mkinitrd, the only thing it should support is to determine
lvm version from on-disk kernel file (is it possible?), not from a
running kernel (or else all the tool versions should be in initrd).

> The problem is that "sed" is used in the wrapper script.  AFAIK, I do not
> have "sed" in my wrapper script, so I don't know where it came from.  Can
> you tell me where the wrapper script comes from that you are using and/or
> post a copy to this list so it can be fixed?

I leave that to Steve Wray -- I personally not use any wrappers at all,
and ever never saw mkinitrd script(s)... ;)

> Cheers, Andreas

Regards,
 Michael.
