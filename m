Date: Tue, 27 Jul 1999 14:57:04 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990727145704.B11652@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <199907271227.AA28175@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199907271227.AA28175@mailgate1b.telekom.de>; from Heinz Mauelshagen on Tue, Jul 27, 1999 at 02:23:53PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Jul 27, 1999 at 02:23:53PM +0000, Heinz Mauelshagen wrote:
> > i believe useful integrating raid and lvm
> > it means a user can dcide the different raid policy
...
> That's the Veritas Volume Manager concept.
that is what i am accustomed to.
i usually work on hp servers.
are you suggesting there are better ways to do things?

> > as a side question, how does LVM autodetect works
> > (if it exists, that is)?

> Today, it's the initrd mechanism (partially) supported by lvmcreate_initrd
> in LVM 0.7.
that is what i tought, see my previous msg
but the scan is done in user space, i was asking if some
kernel space solution existed/was planned/has any sense

what i want to do is have both raid and LVM work and be autodetected
at boot even if both are compiled as modules.
why would i want to do this?
Distributions, i would like both raid and lvm to become
a standard part of all linux distributions.

i hope that there will be some improvements in
boot loaders, so we can avoid the small bios addressable
partition, and completely avoid the idiotic pc partitioning
cheme.

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
