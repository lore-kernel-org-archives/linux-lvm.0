Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3MJUop24095
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 15:30:50 -0400
Received: from beo.doppingen.nu (1-1-1-36a.gml.gbg.bostream.se [82.182.110.42])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3MJUmKG014339
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 15:30:49 -0400
Date: Thu, 22 Apr 2004 21:30:47 +0200 (CEST)
From: Tomas <tomas@doppingen.nu>
Message-ID: <Pine.LNX.4.43.0404222128210.4766-100000@beo.doppingen.nu>
MIME-Version: 1.0
Subject: [linux-lvm] (no subject)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Ahhhh..... that is the difference after the upgrade. I have added filters
and will probably run devfs later on.

Works much better now. Thanks.

/Tomas

>
> it looks like you are not using devfs, so your dev is filled with a lot
> of device nodes, could you try setting up device filters in
> /etc/lvm/lvm.conf?
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
