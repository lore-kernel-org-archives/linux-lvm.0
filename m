Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1NA7ajw007332
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 05:07:36 -0500
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1NA7ZUb003239
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 05:07:35 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp18so33958194obc.8
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 02:07:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAF0z+n1UQXryRYMjCLzjtO07Q+ErJtW_+YFFKwmAyipkBhm_WQ@mail.gmail.com>
References: <CAF0z+n1UQXryRYMjCLzjtO07Q+ErJtW_+YFFKwmAyipkBhm_WQ@mail.gmail.com>
Date: Mon, 23 Feb 2015 11:07:34 +0100
Message-ID: <CAE7pJ3DF=Z_dcY+bCv16+3KbbmvuakPCLSeC1qh2tEBTSR0gxQ@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Subject: Re: [linux-lvm] Combine multiple physical volumes onto a larger
	device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

yes, you can move the smaller in larger drives.

2015-02-22 4:05 GMT+01:00 Greg Zartman <gregzartman@gmail.com>:
> I'm sure this has been asked and answered before, but after a fair bit of
> googleing I'm not coming up with an answer.
>
> I have a fairly old volume group that is made of 9 x 620GB PVs.  I'd like to
> move this volume group off these devices onto a couple larger drives.  What
> is the best way to do this?  I've read that you can vgextend the new drives
> into the volume group and the use pvmove to move data off one PV to another,
> but I don't know if you can pvmove smaller pvs onto a larger disk and they
> will all be combined.
>
> Maybe there is a better way to move the entire VG?    I want to maintain the
> current VG and LV names from my old setup, this my desire to just move the
> entire lot at once instead of rsyncing or something.
>
> Thanks,
>
> Greg
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
esta es mi vida e me la vivo hasta que dios quiera
