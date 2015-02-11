Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BERSjt027479
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 09:27:28 -0500
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BERLjW013661
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 09:27:23 -0500
Received: by mail-wg0-f48.google.com with SMTP id l18so695615wgh.7
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 06:27:21 -0800 (PST)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102])
	by mx.google.com with ESMTPSA id bd8sm1503329wjc.21.2015.02.11.06.27.20
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 06:27:20 -0800 (PST)
Message-ID: <54DB66C7.5080809@gmail.com>
Date: Wed, 11 Feb 2015 15:27:19 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
In-Reply-To: <CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Volume group inconsistent
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

Dne 9.2.2015 v 17:37 Marcos Dutra napsal(a):
> Hi Zdenek,
>
> I attached 2 files, one with missing status and another my backup today. I
> restored my vg from backup but I still have problem, if I create some new lv
> volumes, vg status come back with missing status, I don't know why. Since
> saturday night I don't create any volumes in this vg and I don't have any
> missing status until now, but I would like come back to create new lv in this
> volume.
> My server is centos-6.6 with lastest updates.
>


What are those  /dev/mapper/plt-XX  devices ?

It seems like the lvm2 command cannot write to this place properly?

Checksum error looks like serious problem.

 From attached output - all your PVs were properly markes as not missing,
however the lvm2 cannot read back proper crc code.

So what are those 0.5GB devices - are they properly writable ?
(especially in the disk header)

Note - there are special type of block devices like DASD devices
that must be first properly configured by IBM storage manager to provide 
regular devices.

Regards

Zdenek
