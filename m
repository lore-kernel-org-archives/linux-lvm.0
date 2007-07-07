Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l67B5UI5005258
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 07:05:30 -0400
Received: from mail.esperi.org.uk (41-052.adsl.zetnet.co.uk [194.247.41.52])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l67B5S5k014522
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 07:05:28 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l67B5Nop000105
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 12:05:23 +0100
Subject: Re: [linux-lvm] Debugging partial drive failure
References: <Pine.LNX.4.44.0707051242290.8628-100000@bmsred.bmsi.com>
From: Nix <nix@esperi.org.uk>
Date: Sat, 07 Jul 2007 12:05:23 +0100
In-Reply-To: <Pine.LNX.4.44.0707051242290.8628-100000@bmsred.bmsi.com> (Stuart
	D. Gathman's message of "Thu, 5 Jul 2007 12:47:07 -0400 (EDT)")
Message-ID: <87ejjka2z0.fsf@hades.wkstn.nix>
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

On 5 Jul 2007, Stuart D. Gathman uttered the following:
> This could be added to the linux disk driver.  There could be an
> option for a disk module that would pretend that a range of sectors
> got an I/O error from the drive.  This would allow debugging the LVM
> layer.

I think something in /sys or /debug would be more practical. debugfs
seems a better fit.

You really want to be able to change this at runtime without rmmodding
or rebooting.

-- 
`... in the sense that dragons logically follow evolution so they would
 be able to wield metal.' --- Kenneth Eng's colourless green ideas sleep
 furiously
