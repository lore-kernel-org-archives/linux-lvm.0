Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BBHGxV028497
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 06:17:16 -0500
Received: from mail-wg0-f66.google.com (mail-wg0-f66.google.com [74.125.82.66])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BBHDkD008898
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 06:17:14 -0500
Received: by mail-wg0-f66.google.com with SMTP id l18so1009772wgh.1
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 03:17:13 -0800 (PST)
MIME-Version: 1.0
Sender: hofman.catsystem@gmail.com
In-Reply-To: <CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
Date: Wed, 11 Feb 2015 11:17:13 +0000
Message-ID: <CAKPhfZOe2=qPCr4kHeVXw-vrRY5LG4SRLa1KjUW795tQJun3tQ@mail.gmail.com>
From: service hofman <service.hofman@googlemail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

dd if=3D/dev/sda of=3D/boor/sda.mbr bs=3D512 count=3D4000
mcedit -e /dev/sda

look lvm list in bootrecord


eric hofman

service.hofman@gmail.com









2015-02-09 16:37 GMT, Marcos Dutra <macdutra@gmail.com>:
> Hi Zdenek,
>
> I attached 2 files, one with missing status and another my backup today. I
> restored my vg from backup but I still have problem, if I create some new
> lv volumes, vg status come back with missing status, I don't know why.
> Since saturday night I don't create any volumes in this vg and I don't ha=
ve
> any missing status until now, but I would like come back to create new lv
> in this volume.
> My server is centos-6.6 with lastest updates.
>
> Thanks
>
> Marcos Dutra
>
> 2015-02-09 7:34 GMT-02:00 Zdenek Kabelac <zkabelac@redhat.com>:
>
>> Dne 7.2.2015 v 16:47 Marcos Dutra napsal(a):
>>
>>> Hi everybody,
>>>
>>> Yesterday some storage discs of my VG was with missing status
>>> /dev/mapper/plt-01                                        platinum
>>>  lvm2
>>> a-m  500.00g   24.95g
>>>    /dev/mapper/plt-02                                        platinum
>>> lvm2 a-m  500.00g   12.93g
>>>
>>> I tried recover the discs and I used the command:
>>> # vgextend --restoremissing platinum /dev/mapper/plt-01
>>>
>>> It worked, removing missing status, but I did a big mistake, i tried to
>>> run
>>> this command with multiple discs:
>>> # vgextend --restoremissing platinum /dev/mapper/plt-0[2-9]
>>>
>>> After that when I ran pvs command the output shows me checksum error:
>>>    /dev/mapper/plt-04: Checksum error
>>>    /dev/mapper/plt-06: Checksum error
>>>    /dev/mapper/plt-01: Checksum error
>>>    Couldn't read volume group metadata.
>>>    /dev/mapper/plt-02: Checksum error
>>>    Couldn't read volume group metadata.
>>>    /dev/mapper/plt-03: Checksum error
>>>
>>> I tried restore metadata without success:
>>> # vgcfgrestore -f platinum_02336-1600706364.vg
>>> <http://platinum_02336-1600706364.vg> platinum
>>>
>>
>>
>> Without having access to your current metadata - it's hard to give
>> proper advice.
>>
>>
>> So please attach  'vgcfgbackup' of your current setup.
>>
>> Have you tried to 'extend' your existing vg   'plt' with referencing LVs
>> from itself???
>> Is 'plt' VG ?
>>
>> Zdenek
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>


--=20
ComputerAlarmTechnologySystem=C2=A9

http://plus.google.com/105013137826111836446
+44 77 04 24 74 00
