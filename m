Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t58Mvh2E015469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 8 Jun 2015 18:57:43 -0400
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mx1.redhat.com (Postfix) with ESMTPS id E25C719D075
	for <linux-lvm@redhat.com>; Mon,  8 Jun 2015 22:57:41 +0000 (UTC)
Received: from [192.168.0.31] (unknown [97.123.170.177])
	(Authenticated sender: georges.giralt)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0B75F4B0163
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2015 00:55:25 +0200 (CEST)
Message-ID: <55761DE0.6070204@free.fr>
Date: Mon, 08 Jun 2015 16:57:36 -0600
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <CACaajQvSK0tgLjCCy5Fu-pWFMCWtGUBSnNZFA=NjECRPwBQCgg@mail.gmail.com>
In-Reply-To: <CACaajQvSK0tgLjCCy5Fu-pWFMCWtGUBSnNZFA=NjECRPwBQCgg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm raid1
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

Hello Vassiliy
Do the other way around :
Make an array using mdadm (md0)
Run pvcreate on it and build your VG with this (these) PVs. (pvcreate=20
/dev/md0)
Then build all the LV you want on this VG
Le 08/06/2015 07:33, Vasiliy Tolstov a =EF=BF=BDcrit :
> Hi. I have such hardware:
> /dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf (500Gb ssd)
>
> 1) i want to create raid1 using lvm raid1 personalities with 100Mb
> size on top of this disk
> 2) i want to create lv and format it to ext4/xfs of free space on each di=
sk
>
> If this is not possible with only lvm, how i can do this ? ( simple
> create two lv on each disk and create via mdadm raid1? )
>

--=20
If the only tool you have is a hammer, you tend to see every problem as a n=
ail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.
