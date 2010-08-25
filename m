Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7PCdZii031280
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 08:39:35 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7PCdP4g021572
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 08:39:25 -0400
Received: by iwn5 with SMTP id 5so697822iwn.33
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 05:39:25 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <4C74FCA2.603@redhat.com>
References: <loom.20100825T100856-592@post.gmane.org> <4C74FCA2.603@redhat.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Wed, 25 Aug 2010 14:08:05 +0200
Message-ID: <AANLkTinTpHB=QzTCdSXHSR=biHpdzbOi-_va2e9A3ym0@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can't remove snapshot at first
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
Content-Type: text/plain; charset="utf-8"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi.

2010/8/25 Peter Rajnoha <prajnoha@redhat.com>
>
> On 08/25/2010 10:12 AM +0100, Alexander Skwar wrote:
> > --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot
> >   Can't remove open logical volume "Home-Backup_Snapshot"
> >
> > --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot
> > Do you really want to remove active logical volume Home-Backup_Snapshot? [y/n]:
> >
> > Between those two commands, I did not do anything at all! I ran the
> > commands directly after each other in like 5 seconds or so.
> >
> > Why's that so?
> >
>
> Do you have "udisks" installed?

TBH, I don't know what udisks is, but, yes, it's installed.

--($ /.backup/lib)-- pacman -Q udisks
udisks 1.0.1-5

And it's running as well...

root      9604  0.0  0.1  13708  3088 ?        Sl   07:47   0:10
/usr/lib/udisks/udisks-daemon


> There's a problem we track already and
> this seems to be the same:
>
>  https://bugzilla.redhat.com/show_bug.cgi?id=577798

I removed that line from the udev rule, and now the problem seems
to be gone.

Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
