Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5OFhTZW007369
	for <linux-lvm@redhat.com>; Sun, 24 Jun 2007 11:43:29 -0400
Received: from mail.esperi.org.uk (user88897@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5OFhREe027344
	for <linux-lvm@redhat.com>; Sun, 24 Jun 2007 11:43:28 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l5OFhN9V023358
	for <linux-lvm@redhat.com>; Sun, 24 Jun 2007 16:43:24 +0100
Subject: Re: [linux-lvm] Does pv failure effect whole vg?
References: <200706220314.XAA27738@out-of-band.media.mit.edu>
From: Nix <nix@esperi.org.uk>
Date: Sun, 24 Jun 2007 16:43:22 +0100
In-Reply-To: <200706220314.XAA27738@out-of-band.media.mit.edu>
	(f-lvm@media.mit.edu's message of "Thu,
	21 Jun 2007 23:14:57 -0400 (EDT)")
Message-ID: <87wsxt5pet.fsf@hades.wkstn.nix>
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

On 22 Jun 2007, f-lvm@media.mit.edu said:
> (Yes, it'd probably be possible to make my own initrd that did
> everything the normal one does but supplies --partial in the right
> place, but that'd be a total pain to keep up-to-date across every
> automatic kernel update, etc.

The solution there is to use an initramfs instead, which can be built
automatically by the kernel build system and linked into the kernel.
Therefore, there are very few kernel-up-to-date woes left (basically
none): the kernel and everything needed to mount / is a self-contained
entity again.

-- 
`... in the sense that dragons logically follow evolution so they would
 be able to wield metal.' --- Kenneth Eng's colourless green ideas sleep
 furiously
