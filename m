Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6QG3adn014076
	for <linux-lvm@redhat.com>; Wed, 26 Jul 2006 12:03:36 -0400
Received: from unix.mvs.co.il (bzq-193-16-147-12.bgp.bezeqint.net
	[193.16.147.12])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6QG3TDx029275
	for <linux-lvm@redhat.com>; Wed, 26 Jul 2006 12:03:33 -0400
Received: from beta.mvs.co.il (beta [10.253.0.3])
	by unix.mvs.co.il (8.13.6/8.13.6) with ESMTP id k6QG3M6r020570
	for <linux-lvm@redhat.com>; Wed, 26 Jul 2006 19:03:22 +0300
Received: from beta.mvs.co.il (localhost [127.0.0.1])
	by beta.mvs.co.il (8.13.6/8.13.6) with ESMTP id k6QG3M2k009457
	for <linux-lvm@redhat.com>; Wed, 26 Jul 2006 19:03:22 +0300
Date: Wed, 26 Jul 2006 19:03:22 +0300
Message-Id: <200607261603.k6QG3M9Y009452@beta.mvs.co.il>
From: "Ehud Karni" <ehud@unix.mvs.co.il>
Subject: Re: [linux-lvm] fc4 lvm2 snapshot problem
In-reply-to: <20060725220410.GE4633@soda.linbit> (linux-lvm@linbit.com)
References: <8e3c40600607250434p6ab2936er3986b6e9a4da4e29@mail.gmail.com>
	<20060725220410.GE4633@soda.linbit>
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

On Wed, 26 Jul 2006 00:04:10 +0200, linux-lvm@linbit.com wrote:
> >
> > My best guess is udev that is messing about. I don't know whether I can safely
> > disable udev on a production server. But more importantly: what can I
> > do to get this properly fixed? Am I missing an important update? Are
> > there any known conflicts with other packages or third party software
> > (such as roxen)? Is there anyone who has similar problems?
>
> maybe its the same problem?
> excerpt from my /etc/udev/udev.rules:
>
> # device mapper creates its own device nodes, so ignore these
> #lge: see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=343671
> #KERNEL=="dm-[0-9]*",           NAME=""
> KERNEL=="dm-[0-9]*",            OPTIONS+="ignore_device"
> KERNEL=="device-mapper",        NAME="mapper/control"

It must be this problem. And it is fixed by the line:
    KERNEL=="dm-[0-9]*",            OPTIONS+="ignore_device"
but in FC4/FC5 it should be in /etc/udev/rules.d/50-udev.rules .

Ehud.


--
 Ehud Karni           Tel: +972-3-7966-561  /"\
 Mivtach - Simon      Fax: +972-3-7966-667  \ /  ASCII Ribbon Campaign
 Insurance agencies   (USA) voice mail and   X   Against   HTML   Mail
 http://www.mvs.co.il  FAX:  1-815-5509341  / \
 GnuPG: 98EA398D <http://www.keyserver.net/>    Better Safe Than Sorry
