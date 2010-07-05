Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o65A6kGJ030303
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 06:06:46 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o65A6Y1H028444
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 06:06:34 -0400
Received: by gwj21 with SMTP id 21so790408gwj.33
	for <linux-lvm@redhat.com>; Mon, 05 Jul 2010 03:06:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
Date: Mon, 5 Jul 2010 03:06:33 -0700
Message-ID: <AANLkTilLuXWENDd_bvUlEbV7Hde13h859SIwjLjjsDqZ@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

> But what bothers me is this message I get when I run e2fsck (which runs
> fsck.ext4):
> "e2fsck: Invalid argument while trying to open
> /dev/mapper/VolGroupX-LogVolX"
>
> Why am I getting that?
> thx for the response.

The lv is available right?

It would be great to see the output from lvdisplay and vgdisplay.

-Bryan
