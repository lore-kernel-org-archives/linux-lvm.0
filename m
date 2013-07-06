Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r66HggUK023346
	for <linux-lvm@redhat.com>; Sat, 6 Jul 2013 13:42:42 -0400
Received: from nm4.access.bullet.mail.gq1.yahoo.com
	(nm4.access.bullet.mail.gq1.yahoo.com [216.39.62.35])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r66Hgdun006063
	for <linux-lvm@redhat.com>; Sat, 6 Jul 2013 13:42:40 -0400
References: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
	<1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
	<51D4222E.1020809@deriva.de>
	<1372859936.18752.YahooMailNeo@web181505.mail.ne1.yahoo.com>
	<51D811EF.7070102@deriva.de>
Message-ID: <1373132415.9586.YahooMailNeo@web181505.mail.ne1.yahoo.com>
Date: Sat, 6 Jul 2013 10:40:15 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <51D811EF.7070102@deriva.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is cLVM necessary when accessing different logical
	volumes on a shared iSCSI target?
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

> (either hard-coded or using tags) is *necessary* to make things working or if it�

> is just *adviseable* to prevent using a volume simultaneously from both clients?

You could probably make a case for saying it's adviseable but why do you want to play roulette with your data? Force it to do the right thing and you won't have to run the risk of it doing something unintended. Why the trepidation to doing it correctly?

> logical values are found by vgscan / lvscan, but I cannot access it. Is this the�
> expected behavior? Is there any chance (besides rebooting the client machine) to 
> recover from such a situation?

How did you disconnect from iSCSI? Did you gracefully log out of the client session? However you did it, it seems the kernel believes the device was just yanked offline and after repeated I/O failures marked it bad. Re-introducing the device doesn't magically clear the error state. Then again maybe it's as simple as you not bringing it fully online with a 'vgchange -ay <vg>' and an 'lvchange -ay <lv>'.
