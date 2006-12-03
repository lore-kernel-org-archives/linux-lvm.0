Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB3LFjoh013770
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:15:45 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB3LFj8i016133
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:15:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 113D5E7CD
	for <linux-lvm@redhat.com>; Sun,  3 Dec 2006 21:15:45 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id M8-Bwlq-DTdi for <linux-lvm@redhat.com>;
	Sun,  3 Dec 2006 21:15:40 +0000 (UTC)
Received: from dsl081-113-044.dfw1.dsl.speakeasy.net
	(dsl081-113-044.dfw1.dsl.speakeasy.net [64.81.113.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id CA0DDE769
	for <linux-lvm@redhat.com>; Sun,  3 Dec 2006 21:15:40 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] LVM problem - how to recover?
Date: Sun, 3 Dec 2006 15:15:40 -0600
References: <200611282115.15335.Richard.Kampmann@freenet.de>
In-Reply-To: <200611282115.15335.Richard.Kampmann@freenet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612031515.40158.krakrjak@volumehost.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday 28 November 2006 14:15, Richard Kampmann wrote:
> Any way to recover the LVs of the old volume group? A vgcfgrestore (YES,
> there was a vgcfgbackup before!) does not work ... bad luck.
What errors do you get using vgcfgrestore?

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
