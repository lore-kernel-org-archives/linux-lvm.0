Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012220613.eBM6Dwx06755@webber.adilger.net>
Subject: Re: [linux-lvm] 0.9 tools compatible with 0.8 kernel? (and vice versa)
In-Reply-To: <Pine.LNX.4.30.0012220347410.27430-100000@fogarty.jakma.org>
 "from Paul Jakma at Dec 22, 2000 03:51:25 am"
Date: Thu, 21 Dec 2000 23:13:57 -0700 (MST)
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
Cc: Linux LVM list <linux-lvm@msede.com>

Paul writes:
> i want to try out test13-pre4, which i see has LVM v0.9 rolled in.
> 
> if i need to revert to a previous kernel with 0.8, would that cause a
> problem?

Yes,

> and if it doesn't, will the 0.9 tools work with 0.8 kernel side?

No.

> (they should, or upgrade path is pretty risky).

Yes, that's why we have been discussing all of the "LVM user tools wrappers"
issues here over the last week.  With the current setup, you can't even
_install_ multiple versions of the LVM tools at the same time, let alone
have a single version handle multiple protocols.

Try out Marcelo's latest LVM user tools install, which is really required
before trying to update your system, as it allows multiple versions of
user tools to be installed and work well.  Also keep a boot floppy with the
LVM 0.8 and LVM 0.9 tools available in case of trouble, if you don't have
an emergency non-LVM boot partition.

rpm http://distro.conectiva.com.br/experimental/

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
