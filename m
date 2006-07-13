Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DGF4PR007846
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 12:15:04 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DGF2VO008118
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 12:15:02 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id E32401F423D
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 18:14:56 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14207-01 for <linux-lvm@redhat.com>;
	Thu, 13 Jul 2006 18:14:48 +0200 (CEST)
Message-ID: <44B67177.4050404@conterra.de>
Date: Thu, 13 Jul 2006 18:14:47 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 volumes not available on boot
References: <44B66C49.90500@cse.yorku.ca>
In-Reply-To: <44B66C49.90500@cse.yorku.ca>
Content-Transfer-Encoding: 7bit
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

Jason Keltz wrote:
> I have what is probably a very simple question concerning lvm2.    If I
> create an lvm2 volume, and reboot, I no longer see the volume.  The
> system startup scripts do "vgchange -a y", but if I do this by hand, I get:
> 
> No volume groups found

I observed this for my SuSE system, too. I found, LVM was compiled as
a module, but it was not loaded when system startup initialized lvm :-(
I managed to push loading of LVM into initrd. Thus it gets loaded
very early and even may mount root from LVM. Either start mkinitrd
manually with the informations to load LVM, or declare the LVM module
within some config file to get it into initrd.

For SuSE it's in: /etc/sysconfig/kernel.

Dieter.
