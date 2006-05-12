Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CExNZY015020
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 10:59:23 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CExMTm004476
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 10:59:22 -0400
Message-ID: <4464A274.3090808@gmx.net>
Date: Fri, 12 May 2006 16:57:56 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl> <44647CA0.3010509@redhat.com>
	<4464A0BE.7070509@neuroweave.nl>
In-Reply-To: <4464A0BE.7070509@neuroweave.nl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Joep Blom schrieb:
> Patrick Caulfield wrote:
>=20
>> Joep Blom wrote:
>> =20
>>
>>> Hi,
>>> I'm new to the list and new to the use of LVM. I have read the manuals
>>> (which mainly are for LVM1) and am using LVM2.
>>> I have one question. I just created a new volumegroup on an USB external
>>> disk.
>>>
>>>  =20
>>
>>
>> It's fantastically unlikely that a single 'vgcreate VG0' command would
>> create
>> two VGs.
>>
>> What is much more likely is that VolGroup00 already existed and you just
>> didn't notice it. That's the default name for a volume group created by a
>> Fedora install BTW
>>
>> patrick
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> =20
>>
> Patrick,
> Thanks for the quick reply. However, this is external USB disk (250Gb
> and I just added it to the system as a backup disk. FC5 was running and
> before I did anything the disk was formatted as a FAT32 disk I then did
> a pvcreate. When I checked the disk was empty (as was expected). The
> vgcreate did the strange thing, which is a problem as I cant remove this
> VolGroup00 as there exists one on the other (2) disks and when I asses
> VolGroup00 it rightly goes to the original VolGroup00, which I cannot
> delete.
> I think the only solution is fdisk and see if it will free the whole
> disk. But any other ideas?
> Joep
Hi Joep,

well, what Patrick meant is, that your system (forget that USB drive in
this moment) already has a VG called VolGroup00 on your internal disk.
The modern FC distros use it as default (i think, i'm using SuSE ;-) ).
Before messing up more using fdisk, just provide us with the output of a
vgdisplay -a ;-) get an impression of the 'disaster' :-).

Btw. the volume group your wanted to create has the name VG0, not
VolGroup00 ;-) ..

Ciao
Klaus

--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
