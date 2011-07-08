Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p68GWKlG031833
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 12:32:20 -0400
Received: from mail-yi0-f46.google.com (mail-yi0-f46.google.com
	[209.85.218.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p68GW47w009705
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 12:32:19 -0400
Received: by mail-yi0-f46.google.com with SMTP id 27so1117351yia.33
	for <linux-lvm@redhat.com>; Fri, 08 Jul 2011 09:32:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DB44B37.6000501@cox.net>
References: <4DB44B37.6000501@cox.net>
Date: Fri, 8 Jul 2011 18:32:19 +0200
Message-ID: <CACVpCE7D9VqOj_dV3KFavTyevx95ZZDfdG2N2cCrZgGu1U7kAg@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Brodacki?= <pawel.brodacki@googlemail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Insufficient suitable allocatable extents for
	logical volume
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

2011/4/24 Ron Johnson <ron.l.johnson@cox.net>:
> Why does this happen?  I think it has something to do with the fact that I
> set the lv to striped.
>
> TIA,
> Ron

From Red Hat's LVM Administrator's Guide:
"Striped logical volumes can be extended by concatenating another set
of devices onto the end of
the first set. In order extend a striped logical volume, however,
there must be enough free space on
the underlying physical volumes that make up the volume group to
support the stripe. For example,
if you have a two-way stripe that uses up an entire volume group,
adding a single physical volume
to the volume group will not enable you to extend the stripe. Instead,
you must add at least two
physical volumes to the volume group."

So yes, the fact that you set the LV to stripped matters. Read the
manual http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/pdf/Logical_Volume_Manager_Administration/Red_Hat_Enterprise_Linux-6-Logical_Volume_Manager_Administration-en-US.pdf,
it contains a section on extending striped logical volumes.

Regards,
Paweł
