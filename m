Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAPK6aV13662
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 15:06:36 -0500
Received: from viefep18-int.chello.at (viefep18-int.chello.at [213.46.255.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAPK6OeI020796
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 15:06:30 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep18-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051125200049.VULS15626.viefep18-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 21:00:49 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] Volume group not accessible
Date: Fri, 25 Nov 2005 21:00:49 +0100
References: <200511242342.03081.Matthias.Meyer@gmx.li>
	<43864398.1040402@redhat.com>
In-Reply-To: <43864398.1040402@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511252100.51121.Matthias.Meyer@gmx.li>
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

Am Donnerstag 24 November 2005 23:50 schrieb Josef Whiter:
> Matthias Meyer wrote:
> >And now I'm not sure how to gain access again.
> >
> >Should I try to restore metadata with vgcfgrestore?
> >Is it possible that I lost my data if I try vgcfgrestore?
> >
> >Or should I create a new Volume group and include the device /dev/hdd1
> > to this VG? If I do this, what the way to delete volume group LVM2?
> >
> >Thanks in advance
> >Matthias
>
> Hello,
>
> I'm not sure what the best way to go about fixing this problem is, but a
> vgcfgrestore shouldn't harm your data, it basically just writes over a
> section of your disk that was already being used by the LVM data
> anyway.  Hope that helps.
>
> Josef
vdr:~# vgcfgrestore -n LVM2 /dev/hdd1 -b 2
vdr:~# vgchange -ay
vgchange -- volume group "LVM" already active
vgchange -- volume group "LVM2" successfully activated
vdr:~# mount /dev/LVM2/Media /Media

and my logical volume is online again.

Thanks for making me courage ;-)

-- 
Don't Panic
