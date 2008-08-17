Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7HHbdIX012240
	for <linux-lvm@redhat.com>; Sun, 17 Aug 2008 13:37:39 -0400
Received: from smtp6-g19.free.fr (smtp6-g19.free.fr [212.27.42.36])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7HHbQTb008728
	for <linux-lvm@redhat.com>; Sun, 17 Aug 2008 13:37:26 -0400
Received: from smtp6-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp6-g19.free.fr (Postfix) with ESMTP id DC3EC17279
	for <linux-lvm@redhat.com>; Sun, 17 Aug 2008 19:37:25 +0200 (CEST)
Received: from [192.168.1.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp6-g19.free.fr (Postfix) with ESMTP id B27B91722D
	for <linux-lvm@redhat.com>; Sun, 17 Aug 2008 19:37:25 +0200 (CEST)
Message-ID: <48A861D5.5000106@free.fr>
Date: Sun, 17 Aug 2008 19:37:25 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mirroring an LV?
References: <f64d94760808162154ifc69bd5p93ad409f104e35a6@mail.gmail.com>
	<20080817171618.GB13912@us.ibm.com>
In-Reply-To: <20080817171618.GB13912@us.ibm.com>
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

malahal@us.ibm.com a =EF=BF=BDcrit :
> Mirror needs at least 3 PVs (2 for legs and 1 for dirty log) and you
> don't have 3 PVs in that volume group!
>=20
> --Malahal.
>=20
> Gordon McLellan [gordonthree@gmail.com] wrote:
>> I'm pulling my hair out trying to setup a mirrored logical volume.
>>
>> lvconvert tells me I don't have enough free space, even though I have
>> hundreds of gigabytes free on both physical volumes.
>>
>> Command: lvconvert -m1 /dev/vg1/iscsi_deeds_data
>> Insufficient suitable allocatable extents for logical volume : 10240
>> more required
>>
>> Any ideas?
>>
>> Thanks!,
>>
>> Gordon
>>
>> Here's the output from the lvconvert with verbose and debugging turned o=
n:
>>
>> # lvconvert -vvv -d -m1 /dev/vg1/iscsi_deeds_data
........................snip.........................;;
Hi !
IMHO, you would be good when using soft mirror (md) to mirror your 2 PV=20
and then make a vg on the md and then lv into it...
I use 3 disks to mirror my VG/LV and it is a waste. At next major system=20
upgrade I'll convert it to MD/VG and reclaim a disk.
Hope this helps !

--=20
If the only tool you have is a hammer, you tend to see every problem as=20
a nail.
                 Abraham Maslow
