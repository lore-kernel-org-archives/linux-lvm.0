Date: Mon, 14 Feb 2000 17:23:19 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Configuring boot partition with LVM
Message-ID: <20000214172319.C12623@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <200002100714.AAA05415@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200002100714.AAA05415@webber.adilger.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

On Thu, Feb 10, 2000 at 12:14:04AM -0700, Andreas Dilger wrote:
> Christopher Shaulis writes:
> > I can't remember exactly how they explained it, but IBM has a good
> > reason for not allowing mirrored dump devices. I think the idea is that
> > in order to catch the system dumping in the LVM code itself, you have to
> > write the dump without the aid of the LVM. I think the way that works is
> > that it precomputes a list of offset:extent lists for the device when it
> > is brought online.

Dunno 'bout IBM, with HP you can setup dump to a mirrored LV, but it
will dump only on the first PV, this is due to dumping being handled
by the firmware, which knows nothing about LVM

dump LVs must be contiguous on disk, but you can have many of them

> I think that the issue isn't when the dump is written to a mirrored LV
> (as the dump will only go to one or the other copy of the LV), but when
> it is read back there is no way to determine which copy you will read
> from (I/O load balancing causes reads to come from either PV), so you
> may get intermittent garbage inside the dump...
This is one issue, another nice pitfall is that dump is usually read
from disk after mirror reconstruction has begun (remember, if it crashed
mirror copies aren't synchronized), so you may not exactly found what you expect
in the dump :)

With HP you must specify a couple of options in lv creation to disable
mirror reconstruction.

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
