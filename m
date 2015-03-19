Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2JJ6SOi017577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 15:06:28 -0400
Received: from mail.gathman.org (unknown [50.248.53.218])
	by mx1.redhat.com (Postfix) with ESMTPS id EEEC9B5E92
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 19:06:25 +0000 (UTC)
Received: from elissa.gathman.org (elissa.gathman.org
	[IPv6:2001:470:8:809:11::1009]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id t2JJ6JKt032123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 15:06:21 -0400
Message-ID: <550B1E2D.2030206@gathman.org>
Date: Thu, 19 Mar 2015 15:06:21 -0400
From: Stuart Gathman <stuart@gathman.org>
MIME-Version: 1.0
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>	<54743766.7020502@redhat.com>	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>	<5474933E.8070007@redhat.com>	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
	<CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
In-Reply-To: <CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 03/19/2015 02:34 PM, MegaBrutal wrote:
> Now I think I figured out what's going on. It seems to be
> Debian/Ubuntu specific, but I post here, maybe Debian/Ubuntu devs are
> here and see this.
>
> Bug report:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396213
>
> What actually makes the VG activation so long is that I have a
> snapshot. Activating the snapshot takes very long, and bringing up the
> entire VG takes about 5 minutes. This wouldn't be such a big problem,
> as I could just patiently wait for the activation (with rootdelay).
> But it seems something (maybe some kind of watchdog) kills vgchange
> before it could finish bringing up all VGs. I had the fortune to boot
> a developmental Vivid, and I've seen some 'watershed' messages stating
> that 'vgchange' was killed because it was taking "too long". If we'd
> let 'vgchange' to finish properly, I had the 2nd VG activated
> properly, which contains my root FS.
>
> It's a server. If it has a long boot time, so be it, it doesn't get
> rebooted often anyway during normal circumstances. But it is required
> to boot up without user interaction, e.g., when I issue a reboot
> remotely. The main problem is that currently, user interaction is
> necessary to pass initrd (as the root VG needs to be manually
> activated), which means, I can only reboot the server when I'm
> physically near.
I've had the same problem on Fedora - so it is not ubuntu specific. On 
Fedora, systemd has a timeout for VG activation.  That can be 
increased.  However, you can flag the snapshot to *not* be activated 
automatically (Skip activation: -k) at volume group activation. That 
allows the system to boot (remote reboot), and then you can manually 
activate the big snapshot (or automatically in a later script) - waiting 
the requisite 5 or 10 minutes.
