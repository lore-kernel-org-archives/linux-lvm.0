Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102061734.f16HY8A30556@webber.adilger.net>
Subject: Re: [linux-lvm] startup stuff an dnew question :-)
In-Reply-To: <3A7FAB7A.29CFB419@twc.de> from Ulf Bartelt at "Feb 6, 2001 08:44:58
 am"
Date: Tue, 6 Feb 2001 10:34:07 -0700 (MST)
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

Ulf Bartelt writes:
> > >I just faked partition map entries for them and I use them only by this
> > >"partition aliases", so I can boot a system living totally in LVs using
> > >conventional things like lilo...
> > 
> > erm... just what does this gain you, then? if you resize or move those
> > LVs, wouldn't you have to manually change the fake partition map
> > entries, sort of negating the entire point of using LVM...?
> 
> ...but for now I never needed to resize /boot or /, only the other
> LVs...

With the recent changes that went into LVM-0.9.1-beta3, and some patches
to LILO, it _should_ be possible to use LILO on a /boot LV.  Unfortunately,
I was distracted from completing the testing, but the LVM fixes are there.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
