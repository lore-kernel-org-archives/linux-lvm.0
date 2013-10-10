Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9AF4TEu021377
	for <linux-lvm@redhat.com>; Thu, 10 Oct 2013 11:04:29 -0400
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9AF4Rl1007374
	for <linux-lvm@redhat.com>; Thu, 10 Oct 2013 11:04:28 -0400
Message-ID: <5256C1EA.8080805@tekcomms.com>
Date: Thu, 10 Oct 2013 10:04:10 -0500
From: Joe Harvell <joe.harvell@tekcomms.com>
MIME-Version: 1.0
References: <5255CAB1.5050606@tekcomms.com>
	<1381356552.67129.YahooMailNeo@web181504.mail.ne1.yahoo.com>
	<5255D815.1090704@tekcomms.com>
	<1381361455.80237.YahooMailNeo@web181502.mail.ne1.yahoo.com>
In-Reply-To: <1381361455.80237.YahooMailNeo@web181502.mail.ne1.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com
Cc: matthew patton <pattonme@yahoo.com>

Le 09/10/2013 18:30, matthew patton a =EF=BF=BDcrit :
>> So I should set 'obtain_device_list_from_udev' to 0, then pvscan, vgscan
>> and lvscan?
>
> worth a shot. have you confirmed that udev has all the basic disk devices=
 created?
>
I tried that to no avail.  Yes, all the block devices were present in=20
/dev, both for the raw partitions and the RAID ones.

Does anyone know the algorithm LVM uses to determine whether PVs are=20
present?  Also, I'd really like an LVM tool that reads the PV label off=20
of a PV and displays it...I want to see what UUID label is actually on=20
each PV.
