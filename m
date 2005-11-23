Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jANMaoV26883
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 17:36:50 -0500
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jANManiE006929
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 17:36:49 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep12-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051123223641.YVPP3413.viefep12-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 23:36:41 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t resize my lvm
Date: Wed, 23 Nov 2005 23:36:44 +0100
References: <200511211934.13943.Matthias.Meyer@gmx.li>
	<20051122230228.GF30556@redhat.com>
	<200511230210.35979.Matthias.Meyer@gmx.li>
In-Reply-To: <200511230210.35979.Matthias.Meyer@gmx.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511232336.44440.Matthias.Meyer@gmx.li>
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

Am Mittwoch 23 November 2005 02:10 schrieb Matthias Meyer:
>
> vdr:~# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "LVM"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "LVM2" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
>
> You have new mail in /var/mail/root
> vdr:~# vgchange -ay
> vgchange -- volume group "LVM" already active
>
> Hmm, I think I had overwrite my PV with
> vdr:~# vgchange -an LVM2
> vgchange -- volume group "LVM2" successfully deactivated
> vdr:~# pvcreate -vff /dev/hdc1
> as descriped in detail in my mail at November, 21. 23:22

Should I try to restore metadata with vgcfgrestore?
Is it possible that I lost my data if I try vgcfgrestore?

Please help :-)
-- 
Don't Panic
