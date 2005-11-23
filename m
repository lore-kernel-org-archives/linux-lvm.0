Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAN1AiV18363
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 20:10:44 -0500
Received: from viefep18-int.chello.at (viefep18-int.chello.at [213.46.255.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAN1Adui030930
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 20:10:40 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep18-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051123011031.VZNI5342.viefep18-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 02:10:31 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t resize my lvm
Date: Wed, 23 Nov 2005 02:10:35 +0100
References: <200511211934.13943.Matthias.Meyer@gmx.li>
	<200511222326.13555.Matthias.Meyer@gmx.li>
	<20051122230228.GF30556@redhat.com>
In-Reply-To: <20051122230228.GF30556@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511230210.35979.Matthias.Meyer@gmx.li>
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

Am Mittwoch 23 November 2005 00:02 schrieb Heinz Mauelshagen:
> On Tue, Nov 22, 2005 at 11:26:13PM +0100, Matthias Meyer wrote:
> > Am Dienstag 22 November 2005 10:58 schrieb Heinz Mauelshagen:
> > > Matthias,
> > >
> > > you don't need to deactivate your VG in order to grow it.
> > >
> > > That's the whole point behind LVM: be able to adjust your changing
> > > storage requirements online.
> > >
> > > Do "vgchange -ay", "vgextend LVM2 /dev/hdc1" and you'll have your
> > > VG online with extended capacity to grow your LV and FS in another
> > > step.
> > >
> > > Regards,
> > > Heinz    -- The LVM Guy --
> >
> > Thanks for your hint.
> > But:
> > vdr:~# vgchange -ay LVM2
> > vgchange -- volume group "LVM2" does not exist
>
> Hrm, run vgscan and 'vgchange -ay' afterwards.
> You haven't overwritten your PV, have you ?
>
vdr:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "LVM"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "LVM2" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
groups

You have new mail in /var/mail/root
vdr:~# vgchange -ay
vgchange -- volume group "LVM" already active

Hmm, I think I had overwrite my PV with
vdr:~# vgchange -an LVM2
vgchange -- volume group "LVM2" successfully deactivated
vdr:~# pvcreate -vff /dev/hdc1
as descriped in detail in my mail at November, 21. 23:22
-- 
Don't Panic
