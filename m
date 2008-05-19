Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JFJxOj017757
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 11:19:59 -0400
Received: from gruber.hi.inet (31.Red-213-96-98.staticIP.rima-tde.net
	[213.96.98.31])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m4JFJmiK019978
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 11:19:49 -0400
Message-ID: <48319A66.4030107@gfi-info.com>
Date: Mon, 19 May 2008 17:19:02 +0200
From: =?ISO-8859-1?Q?Raquel_Real_L=F3pez?= <rreal@gfi-info.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Kernel panic - not syncing: No init found. Try	passing
	init= option to,kernel
References: <483135CF.1080809@gfi-info.com> <20080519124014.GA5134@redhat.com>
In-Reply-To: <20080519124014.GA5134@redhat.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Hello!

Thank you for your reply

Heinz Mauelshagen escribi=EF=BF=BD:
>
> Any indication that the disk turned bad from before ?
>  =20
Reboot and then the system crashed
> Looks like it either did and your single copy of the LVM1 metadata
> went south
> -or-
> the metadata got corrupted somehow differently.
>
>  =20
>> And then:
>>
>> Kernel panic - not syncing: No init found. Try passing init=3D option to
>> kernel.
>>    =20
>
> Expected kernel behaviour w/o root fs.
>
>  =20
>> If I boot with a rescue disk and I type "lvdisplay", LV UUID is=20
>> "000000-00....".
>>    =20
>
> LVM1 didn't have UUIDs on LVs, that's why.
> Can you access the VG from the rescue disk and access your data alright ?
>  =20
Yes, I can access.

>> How can I recover the system?
>>    =20
>
> If the disk's intact, and you better prove that by running access tests
> on /dev/sda from your rescue disk, you have to restore the metadata from
> backup using pvcreate+vgcfgrestore. See man vgcfgrestore for details.
>
>  =20
If I type "pvcreate /dev/sda2", can I lose the data?

Thanks
