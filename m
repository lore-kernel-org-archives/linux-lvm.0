Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106051755.f55HtKSG005083@webber.adilger.int>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
In-Reply-To: <3B1C16AA.AD983576@tls.msk.ru> "from Michael Tokarev at Jun 5, 2001
 03:15:54 am"
Date: Tue, 5 Jun 2001 11:55:20 -0600 (MDT)
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

Michael writes:
> So basename also should be placed to initrd? ;)  I think that
> problem should be resolved at a first place (in mkinitrd), not
> by putting numerous workarounds all other the place.
> BTW, bash have nice construct ${var##*/} to be used instead of
> basename, and it works *much* faster (also ${var%/*} for dirname etc).

I tried this in my lvm-wrapper and it works fine, but on my system /bin/sh
is /bin/bash.  This also works with /bin/zsh, but doesn't work with /bin/ash.

One issue is how to get this fix out.  Since the lvm-wrapper is not part
of the LVM tools itself, it is up to vendors to read this email and fix
it...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
