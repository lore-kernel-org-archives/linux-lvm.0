Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAQApkV03436
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 05:51:46 -0500
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAQApYj4016541
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 05:51:34 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep14-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051126105119.TXLC9812.viefep14-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 11:51:19 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: AW: [linux-lvm] Activation problem with vgremove
Date: Sat, 26 Nov 2005 11:51:27 +0100
References: <AE41C3C123D61B45B457F3037275842F1E03E2@DC-EX-001.evendi.local>
	<AE41C3C123D61B45B457F3037275842F151FFC@DC-EX-001.evendi.local>
In-Reply-To: <AE41C3C123D61B45B457F3037275842F151FFC@DC-EX-001.evendi.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511261151.27572.Matthias.Meyer@gmx.li>
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
To: linux-lvm@redhat.com

Am Samstag 26 November 2005 09:13 schrieb Marcus Franke:
> Hello,
>
> Ok, had my timeframe, rebooted the server but still the volumegroup
> is marked as active. I cannot remove it :(
>
> How can this be and how can I change this? I need to remove the lvm
> from the drive. And I want it to happen the clean way.
>
> Not just fdisking it from the drive and let the informations of the lvm
> remain somewhere in the config..
>
>
> Marcus
Did you try "vgchange -an <volumegroup>"?
-- 
Don't Panic
