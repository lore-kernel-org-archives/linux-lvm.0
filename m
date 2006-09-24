Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8OHJ9lm002291
	for <linux-lvm@redhat.com>; Sun, 24 Sep 2006 13:19:09 -0400
Received: from mail.esperi.org.uk (user41673@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8OHJ7Yt001764
	for <linux-lvm@redhat.com>; Sun, 24 Sep 2006 13:19:08 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k8OHJ40A011168
	for <linux-lvm@redhat.com>; Sun, 24 Sep 2006 18:19:05 +0100
Subject: Re: [linux-lvm] LVM on RAID
References: <20060919220325.4A5BA12EDE@bluewhale.planbit.co.uk>
From: Nix <nix@esperi.org.uk>
Date: Sun, 24 Sep 2006 18:19:03 +0100
In-Reply-To: <20060919220325.4A5BA12EDE@bluewhale.planbit.co.uk> (Roger
	Lucas's message of "Tue, 19 Sep 2006 23:03:11 +0100")
Message-ID: <87lko9rxmg.fsf@hades.wkstn.nix>
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

On Tue, 19 Sep 2006, Roger Lucas said:
> and boot directly into an LVM root partition with initrd.

I do exactly the same thing, with multiple RAID-5 arrays and an LVM
image striped over all of them at once. It works fine.

(I use initramfs for booting instead of initrd: my current boot
setup is at <http://linux-raid.osdl.org/index.php/RAID_Boot>.)

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
