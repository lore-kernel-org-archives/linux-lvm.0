Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22JQVK28236
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:26:31 -0500
Received: from pastinakel.tue.nl (pastinakel.tue.nl [131.155.2.7])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22JQNWK019179
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:26:23 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by pastinakel.tue.nl (Postfix) with ESMTP id A38CB14BD7D
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:26:22 +0100 (CET)
Received: from [131.155.224.41] (t-26-41.athome.tue.nl [131.155.224.41])
	by iris.tue.nl (Postfix) with ESMTP id 86C9E10C0C5
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:26:22 +0100 (CET)
Message-ID: <4226135E.9060303@are-b.org>
Date: Wed, 02 Mar 2005 20:26:22 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org>
	<20050302174819.GN17589@lug-owl.de>	<4225FEBC.2060505@are-b.org>
	<20050302180537.GO17589@lug-owl.de>	<42260F1B.2030803@are-b.org>
	<1109791034l.28794l.3l@tangerine>
In-Reply-To: <1109791034l.28794l.3l@tangerine>
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

Thanks! However the partition is fine and fit so I should be able to dd=20
everything off of it.

The output of gpart was the following:
root@enterprise:~# gpart -w hmlvm,1.5 /dev/hde

Begin scan...
Possible partition(ReiserFS filesystem), size(50431mb), offset(14mb)

* Warning: short read near sector(120103011), 64512 bytes instead of=20
66048. Skipp
ing...
End scan.

Checking partitions...
Partition(Linux ext2 filesystem): primary
Ok.

Guessed primary partition table:
Primary partition(1)
   type: 131(0x83)(Linux ext2 filesystem)
   size: 50431mb #s(103284656) s(29799-103314454)
   chs:  (29/9/1)-(1023/15/63)d (29/9/1)-(102494/7/62)r

Primary partition(2)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
<snip> part 3 and 4 where 'unused'.

Now gpart found something, however not the missing LVM PV i was hoping.=20
Or atleast, I don't think so. I will google around to see how to make a=20
1 on 1 copy of this disk, and then try to write it. I'll report back. In=20
the mean time, keep those ideas comming : )



Jean-Luc Coulon (f5ibh) wrote:

> Le 02.03.2005 20:08:11, oliver a =EF=BF=BDcrit :
>
>> I do have an empty 120GB hdd available to dump the entire contence =20
>> on. I guess dd will do the trick?
>
>
> ddrescue the weapon of the last chance ...
>
> J-L
>
>>
>> Jan-Benedict Glaw wrote:
>
>
>
>>
>>> On Wed, 2005-03-02 18:58:20 +0100, oliver <oliver@are-b.org>
>>> wrote in message <4225FEBC.2060505@are-b.org>:
>>>
>>>> When i do a less -f /dev/hde I can see a lot of data.
>>>>
>>>> E.g. I see a string looking a lot like ReiserFS and scrolling down =20
>>>> further I see /dev/vg00/<nameofparts created> so I'm sure a LOT is =20
>>>> still there. I'll give it a shot. Any other ideas are still welcome!
>>>>
>>>
>>> So let gpart guess and re-install a partition record. Though, you'd
>>> better prepare a backup of that given HDD...
>>>
>>> MfG, JBG
>>>
>>>
>>> -----------------------------------------------------------------------=
-=20
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
