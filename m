Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n03Ia8Vm017038
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 13:36:08 -0500
Received: from mail-bw0-f20.google.com (mail-bw0-f20.google.com
	[209.85.218.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n03IZqi0022149
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 13:35:52 -0500
Received: by bwz13 with SMTP id 13so18555458bwz.3
	for <linux-lvm@redhat.com>; Sat, 03 Jan 2009 10:35:50 -0800 (PST)
Message-ID: <68c491a60901031035q43ab16f4td3c3e6856ece91fa@mail.gmail.com>
Date: Sat, 3 Jan 2009 19:35:50 +0100
From: "=?ISO-8859-1?Q?Martin_Schr=F6der?=" <martin@oneiros.de>
Sender: pdftex@gmail.com
Subject: Re: [linux-lvm] LVM mapper and device names
In-Reply-To: <20090103182852.GG11060@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <b08d3e870901030855i7d8f7d25x4dee43a6fc93a397@mail.gmail.com>
	<20090103182852.GG11060@agk.fab.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2009/1/3 Alasdair G Kergon <agk@redhat.com>:
>> When I now have a mounted filesystem, how can I
>> determine reliably which is the original lv I've used ?
>
> lvs -o vg_name,name /dev/mapper/datavg-work

Volume group "mapper" not found

> sudo /sbin/lvs --version
  LVM version:     2.02.13 (2006-10-27)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.7.0

Best
   Martin
