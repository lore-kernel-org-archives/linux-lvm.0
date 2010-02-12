Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1CGffDJ011217
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 11:41:41 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o1CGfRiI017085
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 11:41:28 -0500
From: "Harald Heigl" <Harald_Heigl@gmx.at>
References: <001501caabf3$85080b60$8f182220$@at> (from Harald_Heigl@gmx.at	on
	Fri Feb 12 08:56:11 2010)
	<1265989079.22562.0@raydesk1.bettercgi.com>
In-Reply-To: <1265989079.22562.0@raydesk1.bettercgi.com>
Date: Fri, 12 Feb 2010 17:41:21 +0100
Message-ID: <002801caac02$3556e640$a004b2c0$@at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: de-at
Subject: Re: [linux-lvm] What happens with full snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

>    The summary answer to the list of questions below
> is "it works well".

Thanks a lot for this very fast answer!

 
> > 2.       What happens if there is a problem with a snap? I've heard
> on
> > reboot the snapshots are lost. What if there is a power shortage, so
> > the
> > snap is lost, you boot and the original lv just seeks for the snap?
> 
>     LVM snapshots are NOT lost on reboot.  That information may apply
> to some other type of snapshot mechanism unrelated to LVM, or some
> system could potentially be built on top of LVM which holds snapshots
> in RAM, but in the normal use case snapshots are written to disk
> just like any other data you might write to disk.

Ok I just assume I read something wrong it was about lvm, can't find it
anymore, perhaps someone had a problem on reboot (what could happen when
working and experimenting with computers :-) )
But I also think about trying this:
http://linuxsoftware.co.nz/blog/2008/03/11/lvm-snapshot-with-no-free-diskspa
ce
Do you see any problems here (besides that this snapshot will be definitely
lost)? As said the "real changed data" will be on the disk, just the
snapshot is lost ...

>     LVM can be set to maintain a log of backups of the LVM metadata
> in case you had a power failure or other major "oops" in the middle
> of creating a snapshot or something like that.  The tool "vgcfgrestore"
> can restore the LVM configuration to any of your last X valid
> configurations.  I've used that several times when I've done
> something stupid like deleting an important LVM, as I'm doing a
> lot of weird stuff with LVM.

This point is interesting, fortunately I had no problem with lvm. I use
lvmdump -amd [file] to "backup" my lvm (with metadata), never tried to
restore. Not knowing vgcfgrestore before, from the manpage I assume using
vgcfgbackup is the right tool to backup your metadata, right? I thought of
using lvmdump on a regularly basis to get some dumps, I don't know If they
are useful if something happens. 

You said you deleted some lv? Then a vgcfgrestore will restore the vg and
all data (which was there before) will be accessible again?

Thanks again,
Harald
