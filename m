Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0TA56Us019047
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 05:05:06 -0500
Received: from unix.mvs.co.il (bzq-193-16-147-12.bgp.bezeqint.net
	[193.16.147.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0TA4gTC029594
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 05:04:42 -0500
Received: from beta.mvs.co.il (beta [10.253.0.3])
	by unix.mvs.co.il (8.13.7/8.13.7) with ESMTP id m0TA4ZP7025273
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 12:04:36 +0200
Received: from beta.mvs.co.il (localhost [127.0.0.1])
	by beta.mvs.co.il (8.14.1/8.14.1) with ESMTP id m0TA4Zan030686
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 12:04:35 +0200
Date: Tue, 29 Jan 2008 12:04:35 +0200
Message-Id: <200801291004.m0TA4Zrm030681@beta.mvs.co.il>
From: "Ehud Karni" <ehud@unix.mvs.co.il>
Subject: Re: [linux-lvm] LVM limits?
In-reply-to: <1201566433.30560.65.camel@behemoth.csg.stercomm.com> (message
	from Chris Cox on Mon, 28 Jan 2008 18:27:13 -0600)
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
	<1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
	<200801282338.m0SNcjbP024435@beta.mvs.co.il>
	<1201566433.30560.65.camel@behemoth.csg.stercomm.com>
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


I think this is quiet off topic, so this is my last reply.

On Mon, 28 Jan 2008 18:27:13 Chris Cox wrote:
>
> Let's say you want to make a copy of your 5TB filesystem... how long
> does that take?
>
> My point (washed away in silly talk) is that operations on large
> filesytems can take a VERY long time.  Just looking at the (very)
> trivial examples and not looking that the problem at a whole doesn't
> solve the problem (as much as we'd like to think that it does).

I agree to your basic point, but what is your solution ?
Even if you have distributed FSs, you still have to back it all,
keep its integrity and manage it somehow. I don't see how it is
a lesser problem.

The basic problem is that the data we hold grows faster than the
software/hardware capabilities (or they are unreasonably priced).

Ehud.


--
 Ehud Karni           Tel: +972-3-7966-561  /"\
 Mivtach - Simon      Fax: +972-3-7966-667  \ /  ASCII Ribbon Campaign
 Insurance agencies   (USA) voice mail and   X   Against   HTML   Mail
 http://www.mvs.co.il  FAX:  1-815-5509341  / \
 GnuPG: 98EA398D <http://www.keyserver.net/>    Better Safe Than Sorry
