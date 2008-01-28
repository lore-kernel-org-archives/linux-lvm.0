Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SNdJ9b002090
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 18:39:19 -0500
Received: from unix.mvs.co.il (bzq-193-16-147-12.bgp.bezeqint.net
	[193.16.147.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SNctvr000834
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 18:38:55 -0500
Date: Tue, 29 Jan 2008 01:38:45 +0200
Message-Id: <200801282338.m0SNcjbP024435@beta.mvs.co.il>
From: "Ehud Karni" <ehud@unix.mvs.co.il>
Subject: Re: [linux-lvm] LVM limits?
In-reply-to: <1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
	(message from Joseph L. Casale on Mon, 28 Jan 2008 14:52:20 -0700)
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
	<1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: ehud@unix.mvs.co.il,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: jcasale@ActiveNetwerx.com
Cc: linux-lvm@redhat.com

On Mon, 28 Jan 2008 14:52:20 Joseph L. Casale wrote:
>
> >It took less then 90 minutes.
>
> 90 Minutes, how "enterprisable" is that? Just cause you can, doesn't
> mean you should: What if that server tanked during working hours at
> the corp? You would have to sit and wait for it to come back up.
> Worse than that are the rebuild times for degraded arrays. Try to
> rebuild a **huge** array on **huge** discs during production with
> lots of IO and hope you don't lose another disc. There are practical
> alternatives with thoughtful management to circumvent the need for
> and 8EB or larger array, but YMMV :)

First, that's on my home machine (the whole machine, including the
disks and controller, cost me about $1100).

At work I have 1.75 TB VG (RAID-5 using 3ware, 320 GB SATA-2 x 7, with
1 spare), but it is split into 3 LVs the largest of them is 700 GB.
I had several rebuilds, It takes about 14 hours with no disturbance
at all to the work.

The fsck problem can be dealt in various ways. Changing the FS may be
one of them but I have no experience in this way. Another, more ready
way is to tunefs the FSs (all ext3 in my case) so it will never occurs
automatically, and do scheduled fsck once or twice a year.

I think that when we'll have much larger arrays, their speed will also
be larger. For those who interested in ancient history, I recall that
12-13 years ago, I had a Clariion at work with just 40 GB (it was 10
scsi disks of 4GB) and the fsck (on Aviion DGIX) took more then 50
minutes. Morale - the advancement of technology work for us.

Ehud.


--
 Ehud Karni           Tel: +972-3-7966-561  /"\
 Mivtach - Simon      Fax: +972-3-7966-667  \ /  ASCII Ribbon Campaign
 Insurance agencies   (USA) voice mail and   X   Against   HTML   Mail
 http://www.mvs.co.il  FAX:  1-815-5509341  / \
 GnuPG: 98EA398D <http://www.keyserver.net/>    Better Safe Than Sorry
