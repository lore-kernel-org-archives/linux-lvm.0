Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAMMQSV09011
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 17:26:28 -0500
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAMMQQD7012269
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 17:26:26 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep13-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051122222615.KBGU11640.viefep13-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 23:26:15 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t resize my lvm
Date: Tue, 22 Nov 2005 23:26:13 +0100
References: <200511211934.13943.Matthias.Meyer@gmx.li>
	<200511212322.52680.Matthias.Meyer@gmx.li>
	<20051122095820.GE30556@redhat.com>
In-Reply-To: <20051122095820.GE30556@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511222326.13555.Matthias.Meyer@gmx.li>
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

Am Dienstag 22 November 2005 10:58 schrieb Heinz Mauelshagen:
> Matthias,
>
> you don't need to deactivate your VG in order to grow it.
>
> That's the whole point behind LVM: be able to adjust your changing
> storage requirements online.
>
> Do "vgchange -ay", "vgextend LVM2 /dev/hdc1" and you'll have your
> VG online with extended capacity to grow your LV and FS in another step.
>
> Regards,
> Heinz    -- The LVM Guy --
>
Thanks for your hint.
But:
vdr:~# vgchange -ay LVM2
vgchange -- volume group "LVM2" does not exist

-- 
Don't Panic
