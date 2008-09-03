Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8394R9e015158
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 05:04:28 -0400
Received: from sw-gib.mvs.co.il (mvs.co.il [193.16.147.12] (may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8394CSK003765
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 05:04:13 -0400
Received: from beta.mvs.co.il (beta [10.253.0.3])
	by sw-gib.mvs.co.il (8.13.8/8.13.7) with ESMTP id m83949qb027953
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 12:04:10 +0300
Received: from beta.mvs.co.il (localhost [127.0.0.1])
	by beta.mvs.co.il (8.14.1/8.14.1) with ESMTP id m83949Iq010038
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 12:04:09 +0300
Date: Wed, 3 Sep 2008 12:04:09 +0300
Message-Id: <200809030904.m839490W010033@beta.mvs.co.il>
From: "Ehud Karni" <ehud@unix.mvs.co.il>
Subject: Re: [linux-lvm] 15 snapshot limit?
In-reply-to: <1c748a490809021519i294d1d9fp912ce93cbf6f75d2@mail.gmail.com>
	(message from Larry Dickson on Tue, 2 Sep 2008 15:19:53 -0700)
References: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>
	<48B85CB6.1080403@redhat.com>
	<1c748a490808291412w17dd93f9qcd1454979e77c181@mail.gmail.com>
	<1c748a490809020731i39b214ebhc6e76fd964fc75b4@mail.gmail.com>
	<1c748a490809021519i294d1d9fp912ce93cbf6f75d2@mail.gmail.com>
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

On Tue, 2 Sep 2008 15:19:53 -0700, Larry Dickson wrote:
>
> in my case 15 is the max
> snapshot count, not 32.

I followed this thread from the beginning and I have a simple question.
What is your Maximum Logical Volume number ?
Check it with `vgdisplay' at the "MAX LV" line.

If this is the real problem, you can change it with `vgchange'.

Ehud.


--
 Ehud Karni           Tel: +972-3-7966-561  /"\
 Mivtach - Simon      Fax: +972-3-7966-667  \ /  ASCII Ribbon Campaign
 Insurance agencies   (USA) voice mail and   X   Against   HTML   Mail
 http://www.mvs.co.il  FAX:  1-815-5509341  / \
 GnuPG: 98EA398D <http://www.keyserver.net/>    Better Safe Than Sorry
