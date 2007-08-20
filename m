Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7KNeS49006343
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 19:40:28 -0400
Received: from mail9.dslextreme.com (mail9.dslextreme.com [66.51.199.94])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l7KNeLXp028818
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 19:40:21 -0400
Message-Id: <6.0.3.0.1.20070820152043.03b69eb0@mail.ecis.com>
Date: Mon, 20 Aug 2007 16:40:14 -0700
From: "A.Lizard" <alizard@ecis.com>
Subject: Re: [linux-lvm] Altering a Physical Volume's UUID on SATA
In-Reply-To: <46CA9EEE.3538.117A38D5@mikes.kuentos.guam.net>
References: <20070820144843.922B973191@hormel.redhat.com>
	<6.0.3.0.1.20070820124701.033c7b10@mail.ecis.com>
	<46CA9EEE.3538.117A38D5@mikes.kuentos.guam.net>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

At 03:14 PM 8/20/07, you wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On 20 Aug 2007 at 12:55, A.Lizard wrote:
>
>Date sent:              Mon, 20 Aug 2007 12:55:59 -0700
>To:                     linux-lvm@redhat.com
>From:                   "A.Lizard" <alizard@ecis.com>
>Subject:                Re: [linux-lvm] Altering a Physical Volume's UUID on
>SATA
>Send reply to:          LVM general discussion and development <linux-
>lvm@redhat.com>
>         <mailto:linux-lvm-
>request@redhat.com?subject=unsubscribe>
>         <mailto:linux-lvm-
>request@redhat.com?subject=subscribe>
>
> > At 07:48 AM 8/20/07, you wrote:
> > While you probably describe a better solution, this was written to provide
> > a general solution to the "change uuid" problem to the community that
> > actually works on SATA and to provide a how-to reference for LVM 
> filesystem
> > cloning in the context of the "how to set up a mirror drive quickly and
> > easily" section of an article in progress written for novices on how to
> > transition from an IDE to SATA drive in a Linux workstation.
> >
> > dd + changing uuid + vgrename appears to be the quickest and easiest
> > solution for LVM drive cloning, since the user won't have to worry about
> > setting up drive partitions or creating a MBR or setting up an LVM
> > filesystem manually.
> >
>
>I must be missing something hear. I currently handle the g4l (ghost for 
>linux) project,

NOW I find out about this? Thanks for letting me know, I'll look into the 
project.

>  which does disk and partitioning images using dd with ftp and
>compression or can also do images to local drives or can clone disks.

I used dd between a pair of identical HDs.

>Usually this is to the same size or larger disk, and I am aware of a 
>problem if cloning from an IDE drive to an SATA drive. The system will not 
>mount since the initrd doesn't include the SATA support.

Debian Etch (final) *does* support SATA, presumably including proper initrd 
setup. Installers before Etch beta-4 don't.
http://www.linuxhowtos.org/System/raid.htm

Thanks for writing this post, that is something I should have made clear in 
my article-in-progress and ... now have.

I did the initial drive setup by doing a minimal install of Debian Etch to 
the new disk to create partitions and the MBR and then opening a Live CD 
and rsyncing (in overwrite mode) hda1 > sda1 and hda5 > sda5, then changing 
the /boot/grub/device.map entry as follows:
(hd0)   /dev/hda

from /dev/hda to /dev/sda

As soon as I did this, and changed /dev/hda5 to /dev/sda5 in /etc/fstab, 
the system booted and operated normally. I am using that system to run the 
e-mail client in which I am writing this post right now. (Windows is 
running via a VMware Server guest)

For regular backup, I simply rsync from a modified Knoppix LiveCD with 
rsync and dar scripts that automatically mount the drive partitions and 
send the changes to a backup drive.

>In my case, I upgraded a system from a failing IDE drive to a new much 
>larger SATA drive. It did not work at first because of tha problem. After 
>finding the problem, I was able to go back to the original drive, and I 
>used a process I would have to look for to create
>and initrd with the support. Then just placed it in the boot directory, 
>and the
>system worked fine.
>
>I use the g4l to image my lab system that include 98, XP and Fedora with
>LVM partitions. We did use Norton Ghost in the past, but it failed with LVM
>partitions. (Actually, it would backup the LVM, but something in the boot
>partition would cause it to crash, and could get no support from Norton).
>Then I found g4u, and later g4l.
>
>
>
>
> > There are several solutions to drive cloning for experienced users and
> > admins, but for the newbie, quick, easy, and as few steps as possible are
> > in order.
> >
> > A.Lizard
> >
> > >Message: 6
> > >Date: Sun, 19 Aug 2007 19:51:49 -0400 (EDT)
> > >From: "Stuart D. Gathman" <stuart@bmsi.com>
> > >Subject: Re: [linux-lvm] Altering a Physical Volume's UUID on SATA
> > >         hard drives     [solved]
> > >To: LVM general discussion and development <linux-lvm@redhat.com>
> > >Message-ID: <Pine.LNX.4.44.0708191740520.2161-100000@bmsred.bmsi.com>
> > >Content-Type: TEXT/PLAIN; charset=US-ASCII
> > >
> > >On Sat, 18 Aug 2007, A.Lizard wrote:
> > >
> > > > I bit-copied a backup LVM disk using dd from a Knoppix LiveCD (based on
> > > > Debian) and wound up with duplicate volume and uuids, meaning I 
> couldn't
> > > > mount both the main and backup volumes simultaneously at the same 
> time for
> > > > subsequent backups. Of course, vgrename is ineffective to allow
> > > > simultaneous mounting without changing the uuids.
> > >
> > >I would suggest copying (bitwise if desired) each LV individually to 
> another
> > >volume group with a different name (and UUID).  This gives you a lot more
> > >flexibility with physical storage for primary vs backup volume groups.
> > >Furthermore, your LV backup procedure can take snapshots of each LV first.
> > >
> > >--
> > >               Stuart D. Gathman <stuart@bmsi.com>
> > >     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 
> 591-6154
> > >"Confutatis maledictis, flammis acribus addictis" - background song for
> > >a Microsoft sponsored "Where do you want to go from here?" commercial.
> >
> > member The Internet Society (ISOC), The HTML Writers Guild.
> > "You can't have in a democracy various groups with arms - you have to have
> > the state with a monopoly on power." Condoleeza Rice, US Secretary of State
> > Personal Website http://www.ecis.com/~alizard
> > business Website http://www.reptilelabs.com
> > backup address (if ALL else fails) alizard@gmail.com
> > PGP 8.0 key available by request or keyserver. Download PGP from:
> > http://www.pgpi.org for e-mail privacy.
> > Disaster prep info: http://www.ecis.com/~alizard/y2k.html
> > ***Looking for INTELLIGENT new technology public policy
> > alternatives?***               http://www.ecis.com/~alizard/technology.html
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>+----------------------------------------------------------+
>   Michael D. Setzer II -  Computer Science Instructor
>   Guam Community College  Computer Center
>   mailto:mikes@kuentos.guam.net
>   mailto:msetzerii@gmail.com
>   http://www.guam.net/home/mikes
>   Guam - Where America's Day Begins
>+----------------------------------------------------------+
>
>http://setiathome.berkeley.edu (Original)
>Number of Seti Units Returned:  19,471
>Processing time:  32 years, 290 days, 12 hours, 58 minutes
>(Total Hours: 287,489)
>
>BOINC@HOME CREDITS
>SETI 3,499,710.445815 | EINSTEIN 1,053,218.871121 | ROSETTA
>195,293.359932
>
>
>-----BEGIN PGP SIGNATURE-----
>Version: PGP 6.5.8 -- QDPGP 2.61c
>Comment: http://community.wow.net/grt/qdpgp.html
>
>iQA/AwUBRsmFryzGQcr/2AKZEQLcigCfaZ9TCHdTJLClJmVaHE6aI09kJDkAoMJ2
>Imz2hDK5+8I8DFu7dwKrfH0U
>=kB/j
>-----END PGP SIGNATURE-----

member The Internet Society (ISOC), The HTML Writers Guild.
"You can't have in a democracy various groups with arms - you have to have 
the state with a monopoly on power." Condoleeza Rice, US Secretary of State
Personal Website http://www.ecis.com/~alizard
business Website http://www.reptilelabs.com
backup address (if ALL else fails) alizard@gmail.com
PGP 8.0 key available by request or keyserver. Download PGP from:
http://www.pgpi.org for e-mail privacy.
Disaster prep info: http://www.ecis.com/~alizard/y2k.html
***Looking for INTELLIGENT new technology public policy 
alternatives?***               http://www.ecis.com/~alizard/technology.html
