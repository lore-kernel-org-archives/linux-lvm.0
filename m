Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1OCHhrx030861
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 07:17:43 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1OCHfBn021202
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 07:17:42 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 13C5620041F
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:17:40 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id X5Dbe3glrthX for <linux-lvm@redhat.com>;
	Mon, 24 Feb 2014 13:17:39 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id C7A7520041C
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:17:39 +0100 (CET)
Message-ID: <530B3863.8090504@mglug.de>
Date: Mon, 24 Feb 2014 13:17:39 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <530A77EC.5090900@mglug.de> <530B059F.3060502@redhat.com>
In-Reply-To: <530B059F.3060502@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unwanted autocreation of /dev/mapper/ entries while
 using parted on lvm devices
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
To: linux-lvm@redhat.com

Hi Peter,

thanks for your reply!

Am 24.02.2014 09:41, schrieb Peter Rajnoha:
> On 02/23/2014 11:36 PM, Oliver Rath wrote:
>> [..]
> The parted itself creates a new device-mapper mapping that represents
> the partition. Then it's like any other device-mapper device and so
> the /dev content is created by 10-dm-disk.rules (the /dev/mapper
> content) and 13-dm-disk.rules (the /dev/disk content).
>
> Parted has this functionality integrated so there's no need to call
> kpartx in addition.
>

Ist it possible to avoid this /dev/mapper-generation, if I partitioning
lvm-devices? My problem ist, that Im not able to export the whole device
i.e. as iscsi, if some sub-device is mapped in /dev/mapper/... (says,
its busy then ..).

At the moment I always have to delete these subdevices via kpartx -d
/dev/myvg/.. (or dmsetup remove ..) before exporting it, which is a bit
annoying.

I took a look into 10-dm.rules, but have no idea, what to do.

Regards,
Oliver
