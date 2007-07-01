Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l61JBQuT006782
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 15:11:26 -0400
Received: from mail.esperi.org.uk (user99069@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l61JBOpF007065
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 15:11:25 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l61JBI9b027467
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 20:11:19 +0100
Subject: Re: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
References: <200707011529.08381.arekm@maven.pl>
	<20070701144829.GI30047@agk.fab.redhat.com>
	<200707011658.00819.arekm@maven.pl>
From: Nix <nix@esperi.org.uk>
Date: Sun, 01 Jul 2007 20:11:18 +0100
In-Reply-To: <200707011658.00819.arekm@maven.pl> (Arkadiusz Miskiewicz's
	message of "Sun, 1 Jul 2007 16:58:00 +0200")
Message-ID: <87lke0ueg9.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 1 Jul 2007, Arkadiusz Miskiewicz stated:
> The other one puts LDFLAGS (linker flags) not CFLAGS (cflags is for 
> compilation, ldflags for linking)

That's sane.

>                                   and changes order so linking will success 
> when using -Wl,--as-needed flag.

There must be more to it than this. I've always built with -Wl,--as-needed
(wired into my GCC specs file), and I've never had a problem with LVM.

I can't see how moving the -o around would change a thing, myself.

What problem does this fix?

-- 
`... in the sense that dragons logically follow evolution so they would
 be able to wield metal.' --- Kenneth Eng's colourless green ideas sleep
 furiously
