Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8AHRmGw009405
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 13:27:48 -0400
Received: from mail.esperi.org.uk (user26773@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8AHRjiG029594
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 13:27:46 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k8AHRfGE000758
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 18:27:41 +0100
Subject: Re: [linux-lvm] Wrecked Logical Volume with vgreduce --removemissing
References: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com>
From: Nix <nix@esperi.org.uk>
Date: Sun, 10 Sep 2006 18:27:40 +0100
In-Reply-To: <20060904040917.25836.qmail@web30308.mail.mud.yahoo.com> (Tom's
	message of "Sun, 3 Sep 2006 21:09:17 -0700 (PDT)")
Message-ID: <87d5a3iqcz.fsf@hades.wkstn.nix>
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

On Sun, 3 Sep 2006, Tom wondered:
>                                    How does one utilize the LVM
> archive or backup files?  Can't seem to find an answer to this
> problem.

Look up `vgcfgrestore'.

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
