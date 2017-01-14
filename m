Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0E9QAOM001075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 04:26:10 -0500
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 722ED3F1E7
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 09:26:09 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id c206so104069030wme.0
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 01:26:08 -0800 (PST)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102]) by smtp.gmail.com with ESMTPSA id
	g197sm11265069wmd.15.2017.01.14.01.26.05 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jan 2017 01:26:05 -0800 (PST)
References: <3f1173f8-9bd0-34c8-fb44-a799b0db276e@knebb.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <e886dc5f-d68f-781b-ad5b-16e665086eee@gmail.com>
Date: Sat, 14 Jan 2017 10:26:04 +0100
MIME-Version: 1.0
In-Reply-To: <3f1173f8-9bd0-34c8-fb44-a799b0db276e@knebb.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Again: duplicate PVs - filter rules
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 14.1.2017 v 06:41 knebb@knebb.de napsal(a):
> Hi all,
>
> I thought my filter rules where fine now. But they are not.
>
> I have in /etc/lvm/lvm.conf:
>
>  filter = [ "r|/dev/sdb|","r|/dev/sdc|" ]
>
> I scan my PVs:
>
> [root@backuppc ~]# pvscan --cache
>   WARNING: PV AvK0Vn-vAdJ-K4nf-0N1x-u1fR-dlWG-dJezdg on /dev/sdc was
> already found on /dev/drbd1.
>   WARNING: Disabling lvmetad cache which does not support duplicate PVs.
>   WARNING: Not using lvmetad because duplicate PVs were found.
> [root@backuppc ~]# pvscan
>   WARNING: PV AvK0Vn-vAdJ-K4nf-0N1x-u1fR-dlWG-dJezdg on /dev/sdc was
> already found on /dev/drbd1.
>   WARNING: Disabling lvmetad cache which does not support duplicate PVs.
>   WARNING: Not using lvmetad because duplicate PVs were found.
>   PV /dev/sda2    VG cl              lvm2 [15,00 GiB / 0    free]
>   PV /dev/drbd1   VG test            lvm2 [3,00 GiB / 0    free]
>   Total: 2 [17,99 GiB] / in use: 2 [17,99 GiB] / in no VG: 0 [0   ]
>
> So question again, why does it accept my /dev/sdc as PV discarding
> filter rules?

'pvscan --cache' is different from other lvm commands - it controls filling
of 'lvmetad' from udev rules.

So if you plan to use lvmetad - you need to have uniqueness on 'global' level.

So that's why there is global_filter.

So you should copy  your filter  to  global_filter.

Regards


Zdenek
