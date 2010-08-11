Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7BH3oCA018709
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 13:03:50 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7BH3d36031193
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 13:03:40 -0400
Received: by wwb18 with SMTP id 18so320313wwb.27
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 10:03:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281507031.21952.1@raydesk1.bettercgi.com>
References: <AANLkTinkg_uy8YdHtKGHrZZW4qCzERQGNXMA4fn4y=_S@mail.gmail.com>
	<1281507031.21952.1@raydesk1.bettercgi.com>
Date: Wed, 11 Aug 2010 12:03:39 -0500
Message-ID: <AANLkTimUB-xWqJEteT6mvpLQ2Y4y1qGdGYK1LTz-bh=F@mail.gmail.com>
From: Rahul Nabar <rpnabar@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] calculating free capacity from pvdisplay and
	lvdisplay
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Aug 11, 2010 at 1:10 AM, Ray Morris <support@bettercgi.com> wrote:

Thanks Giorgio and Ray! That helps!
>
> df shows that your LVs take up 8.6TB: 6TB + 600 GB + 2 TB.
> Therefore, you are using 8.6TB of disk space for those LVs.
> Some of the space WITHIN each LV might not be used for files,
> but it has been dedicated to that LV.

Makes sense! The only reason that I was confused was why 3 of my PV's
say "yes (but full)" and the other three not. How does one explain
that?

1.63x3=4.89 still less than 8.6.

Has the VG spanned across the first 3 PVs fully and then utilized the
remaining 3 partially?


> I'm not good at explaining things, so sometimes I try explaining three
> different ways. �I have six cereal boxes, each half empty. �I put the
> boxes in a bag. �The bag is now full. �The cereal boxes may not be full,
> but they fill up the bag. �The cereal boxes are your half empty LVs and
> the bag is your drives.

Food based analogies are always good! :)

Giorgio:

The vgs output is exactly as you say:

[root@eustorage ~]# vgs
  VG                      #PV #LV #SN Attr   VSize VFree
  euclid_highperf_storage   6   3   0 wz--n- 9.80T 1.22T

-- 
Rahul
