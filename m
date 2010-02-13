Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1D7DZJT030210
	for <linux-lvm@redhat.com>; Sat, 13 Feb 2010 02:13:36 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o1D7DMLH018863
	for <linux-lvm@redhat.com>; Sat, 13 Feb 2010 02:13:22 -0500
From: "Harald Heigl" <Harald_Heigl@gmx.at>
References: <002801caac02$3556e640$a004b2c0$@at> (from Harald_Heigl@gmx.at	on
	Fri Feb 12 10:41:21 2010)
	<1266002536.24951.1@raydesk1.bettercgi.com>
In-Reply-To: <1266002536.24951.1@raydesk1.bettercgi.com>
Date: Sat, 13 Feb 2010 08:13:16 +0100
Message-ID: <002f01caac7c$03ceb100$0b6c1300$@at>
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

> > But I also think about trying this:
> > http://linuxsoftware.co.nz/blog/2008/03/11/lvm-snapshot-with-no-free-
> diskspa
> > ce
> > Do you see any problems here (besides that this snapshot will be
> > definitely
> > lost)? As said the "real changed data" will be on the disk, just the
> > snapshot is lost ...
> 
>    That's an interesting idea, to use ramdisk to hold the
> snapshot while taking a backup if no disk space is available....

Perhaps I give it a try, vgcfgrestore should do the trick or reactivating
the ramdisk should do it too. Without it the extended vg isn't complete that
seems logical to me. Depending on the type of data you will need a
rescuesystem, but I hold an pxeboot "rescuecd" on my router, so this is no
great problem.

>     It seems that vgcfgbackup is for creating backups and lvmdump
> is for diagnostic purposes.  However, lvm automatically creates
> backups before and after every change (by default?).  See:

I looked throught the lvm.conf and also the respecting man page:
archive - Whether or not tools  automatically  archive  existing
              metadata  into archive_dir before making changes to it.
backup - Whether or not tools  make  an  automatic  backup  into
              backup_dir  after  changing  metadata.
So for my fedora the default is 10 archives (minimum 30 days), archive and
backup activated.
So before a change an archive of the metadata seems to go into
/etc/lvm/archive and after the change new metadata goes into /etc/lvm/backup
A vgcfgbackup saves the files in /etc/lvm/backup too, if no parameter is
given.
So It seems a backup of /etc (what I just do regularly) should be fine.

>     Note - I am not an LVM developer or expert.
No problem, I use lvm just normal since fedora 8 (must be two years or so)
and never had a problem, did some little resizes of lv before, but nothing
more. Did understand the general concept of lvm but for know I wanted to dig
somehow deeper and explore all the possibilities I have. Doing also
sometimes weird stuff :-), not only with lvm. An extensive user like you is
just welcome. I think I have to do a little more tests. Thanks again.
