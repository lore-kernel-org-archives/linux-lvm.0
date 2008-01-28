Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SI1WLF019052
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 13:01:32 -0500
Received: from unix.mvs.co.il (bzq-193-16-147-12.bgp.bezeqint.net
	[193.16.147.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SI18VJ014807
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 13:01:09 -0500
Received: from beta.mvs.co.il (beta [10.253.0.3])
	by unix.mvs.co.il (8.13.7/8.13.7) with ESMTP id m0SI11gS012962
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 20:01:01 +0200
Received: from beta.mvs.co.il (localhost [127.0.0.1])
	by beta.mvs.co.il (8.14.1/8.14.1) with ESMTP id m0SI11I9010202
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 20:01:01 +0200
Date: Mon, 28 Jan 2008 20:01:00 +0200
Message-Id: <200801281801.m0SI10Xi010185@beta.mvs.co.il>
From: "Ehud Karni" <ehud@unix.mvs.co.il>
Subject: Re: [linux-lvm] LVM limits?
In-reply-to: <1201541894.30560.24.camel@behemoth.csg.stercomm.com> (message
	from Chris Cox on Mon, 28 Jan 2008 11:38:14 -0600)
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
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
To: linux-lvm@redhat.com

On Mon, 28 Jan 2008 11:38:14 Chris Cox wrote:
>
> Ok.  But it's really impractical to have large multi-terabyte
> single filesystem today.  What are you wanting to do?  Ever fsck a
> 2TB filesystem?  Consider yourself warned.

Just last night I ran fsck on my home 1.5 TB file server (it is software
RAID-5 - mdadm, built on 7200 RPM, 500GB SATA2 x 4, ext3 without LVM).
It has went 191 days without fsck so when I booted the machine (I just
upgraded to 2.6.18-53.1.6.el5) it did the fsck automaticaly.

It took less then 90 minutes.

Ehud.


--
 Ehud Karni           Tel: +972-3-7966-561  /"\
 Mivtach - Simon      Fax: +972-3-7966-667  \ /  ASCII Ribbon Campaign
 Insurance agencies   (USA) voice mail and   X   Against   HTML   Mail
 http://www.mvs.co.il  FAX:  1-815-5509341  / \
 GnuPG: 98EA398D <http://www.keyserver.net/>    Better Safe Than Sorry
