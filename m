Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22KA6K09996
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 15:10:06 -0500
Received: from kweetal.tue.nl (kweetal.tue.nl [131.155.3.6])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22KA0Gq026869
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 15:10:00 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by kweetal.tue.nl (Postfix) with ESMTP id A382F13B7EB
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 21:09:54 +0100 (CET)
Received: from [131.155.224.41] (t-26-41.athome.tue.nl [131.155.224.41])
	by iris.tue.nl (Postfix) with ESMTP id 8483310C111
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 21:09:54 +0100 (CET)
Message-ID: <42261D92.2050205@are-b.org>
Date: Wed, 02 Mar 2005 21:09:54 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org>
	<20050302174819.GN17589@lug-owl.de>	<4225FEBC.2060505@are-b.org>
	<20050302180537.GO17589@lug-owl.de>	<42260F1B.2030803@are-b.org>
	<1109791034l.28794l.3l@tangerine>	<4226135E.9060303@are-b.org>
	<1109792034l.28794l.4l@tangerine>
In-Reply-To: <1109792034l.28794l.4l@tangerine>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Well that's one of the things I need to know. How do I recover the=20
partition. Only the first few bytes are missing from what I can tell.

'normally' an LVM disk would say that it didn't contain a valid=20
partition.  That part is missing from the disk and needs to be recoverd.

I've read that one could try pvcreate; vgcfgrestore.

I'm firstly making a backup of the disk with dd if=3D/dev/hde=20
of=3D/mnt/hd/hde_raw_dump to ensure i can always 'go back' when I mess up.

gpart found my reiserfs partition (from the VG) so I suspect that all=20
the data is still AOK. I'm just a little 'scared' to run pvcreate;=20
vgcgrestore because when I want to 'list' my vgcgrestore I get the=20
following error:

root@enterprise:/mnt/hd# vgcfgrestore -n vg00 -l
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vg00.conf"
vgcfgrestore -- ERROR: different structure size stored in=20
"/etc/lvmconf/vg00.conf" than expected in file vg_cfgrestore.c [line 120]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "vg00"

I suppose this could be because of the missing PV and it won't work=20
untill I have all three PV's up again. However 'listing' should be fine?

Jean-Luc Coulon (f5ibh) wrote:

> Le 02.03.2005 20:26:22, oliver a =EF=BF=BDcrit :
>
>> Thanks! However the partition is fine and fit so I should be able to =20
>> dd everything off of it.
>>
>> The output of gpart was the following:
>> root@enterprise:~# gpart -w hmlvm,1.5 /dev/hde
>>
>> Begin scan...
>> Possible partition(ReiserFS filesystem), size(50431mb), offset(14mb)
>>
>> * Warning: short read near sector(120103011), 64512 bytes instead of =20
>> 66048. Skipp
>> ing...
>> End scan.
>>
>> Checking partitions...
>> Partition(Linux ext2 filesystem): primary
>> Ok.
>>
>> Guessed primary partition table:
>> Primary partition(1)
>>   type: 131(0x83)(Linux ext2 filesystem)
>>   size: 50431mb #s(103284656) s(29799-103314454)
>>   chs:  (29/9/1)-(1023/15/63)d (29/9/1)-(102494/7/62)r
>>
>> Primary partition(2)
>>   type: 000(0x00)(unused)
>>   size: 0mb #s(0) s(0-0)
>>   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
>> <snip> part 3 and 4 where 'unused'.
>>
>> Now gpart found something, however not the missing LVM PV i was =20
>> hoping. Or atleast, I don't think so. I will google around to see=20
>> how  to make a 1 on 1 copy of this disk, and then try to write it.=20
>> I'll  report back. In the mean time, keep those ideas comming : )
>>
>
> Just an idea, be careful, it is not the *truth* as I have not tested=20
> it  yet.
>
> Here is what I *think* :
> The partition type is no matter for lvm.
> Recover the partition as you like then do a fdisk to change the =20
> partition type to 8E ... and see (or pray)
>
> J-L
>
> ( ... ]
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
