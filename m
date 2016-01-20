Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0KIIGEC021073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 13:18:16 -0500
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mx1.redhat.com (Postfix) with ESMTPS id C9A5618E3C7
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 18:18:14 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id oh2so9929095lbb.3
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 10:18:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJbEnTyXh8t6o5de6dFfWqSBLuemHE3rkJkA5StQR27f1NOvkA@mail.gmail.com>
References: <CAJbEnTyXh8t6o5de6dFfWqSBLuemHE3rkJkA5StQR27f1NOvkA@mail.gmail.com>
From: Fran Garcia <franchu.garcia@gmail.com>
Date: Wed, 20 Jan 2016 19:17:43 +0100
Message-ID: <CAD+pdNf6KfT_Kb7uG8S7gv-L+COgUMGXvQneQ6MxKHdOfcdr9Q@mail.gmail.com>
Subject: Re: [linux-lvm] -l 100%FREE doesn't work with RAID1
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

On 20 January 2016 at 13:19, Bryan Larsen <bryan@larsen.st> wrote:
> I'm setting up some provisioning scripts, so I don't know the actual sizes
> of the hard drives
>
> $ sudo lvcreate --type raid1 -m 1 -l 100%FREE -n backups hdd_vg
>   Insufficient free space: 781320 extents needed, but only 390658 available
> $ sudo lvcreate --type raid1 -m 1 -l 50%FREE -n backups hdd_vg
>   Insufficient free space: 390662 extents needed, but only 390658 available

the quick and dirty solution... :

EXTENTS=$(sudo vgs -o vg_all --noheadings hdd_vg | awk '{print $12/2}')
lvcreate --type raid1 -m 1 -l $EXTENTS -n backups hdd_vg

:-)
