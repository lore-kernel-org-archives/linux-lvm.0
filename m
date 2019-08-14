Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF8583083
	for <linux-lvm@redhat.com>; Wed, 14 Aug 2019 07:22:35 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A664306F4BE
	for <linux-lvm@redhat.com>; Wed, 14 Aug 2019 07:22:33 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	x7E7MWU0002850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 14 Aug 2019 09:22:32 +0200 (MEST)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_9dd4400d845e7b78c5710a01f720d1c3"
Date: Wed, 14 Aug 2019 09:22:32 +0200
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
	<7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
Message-ID: <0f1ce51503d454e2068d9e0f65947273@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] dmsetup says "Device does not exist",
	though it exists
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
To: linux-lvm@redhat.com

--=_9dd4400d845e7b78c5710a01f720d1c3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Hello,

>> I have a volume group with 20 logical volumes. Only the last one of=20
>> these volumes has a strange problem with dmsetup, shown by these=20
>> commands and output on the command line:
>>=20
>> root@host:/home/linux# /sbin/dmsetup info -c -o name --noheadings=20
>> /dev/vg/lv20
>> Device does not exist.
>> Command failed
>>=20
>> root@host:/home/linux# lvdisplay -c /dev/vg/lv20
>>  =C2=A0 /dev/vg/lv20:vg:3:1:-1:0:4194304:512:-1:0:-1:253:19
>>=20
>> root@host:/home/linux# mount /dev/vg/lv20 /mnt
>> root@host:/home/linux# ls /mnt
>> lost+found data1 data2
>>=20
>> That is, dmsetup says "Device does not exist" about a logical volume,=20
>> though the volume exists and is operating normally. What is the=20
>> possible problem here?
>>=20

>=20
> Have you tried  strace ?

I attached the relevant lines of the strace output. I am really=20
wondering what is happening there:

1. A stat() on /dev/mapper/lv20 is performed, though I requested=20
/dev/mapper/vg-lv20
2. A stat() on/dev/mapper/vg-lv15-real is performed. What does this have=20
to do with lv20 (after I wrote what is at number 3, I know)
3. I do not even know where /dev/mapper/vg-lv15-real is coming from. I=20
created a logical volume named lv15, but none named lv15-real. And=20
really, 'ls -l /dev/vg/' does not list lv15-real, but 'ls -l=20
/dev/mapper' lists vg-lv15-real and shows that is has the same link=20
target /dev/dm-18 as lv20.
4. Though stat() found /dev/mapper/vg-lv15-real, ioctl() says that this=20
device does not exist.


> Kernel version, lvm version,  distribution... ?

Kernel Debian amd64 4.9.168-1+deb9u2, LVM version 2.03.02(2), Debian 9=20
(stretch)

Regards
   Christoph
--=_9dd4400d845e7b78c5710a01f720d1c3
Content-Transfer-Encoding: base64
Content-Type: text/plain;
 name=strace.txt
Content-Disposition: attachment;
 filename=strace.txt;
 size=1152

aW9jdGwoMywgRE1fVkVSU0lPTiwge3ZlcnNpb249NC4wLjAsIGRhdGFfc2l6ZT0xNjM4NCwgZmxh
Z3M9RE1fRVhJU1RTX0ZMQUd9ID0+IHt2ZXJzaW9uPTQuMzUuMCwgZGF0YV9zaXplPTE2Mzg0LCBm
bGFncz1ETV9FWElTVFNfRkxBR30pID0gMApzdGF0KCIvZGV2L3ZnL2x2MjAiLCB7c3RfbW9kZT1T
X0lGQkxLfDA2NjAsIHN0X3JkZXY9bWFrZWRldigyNTMsIDE4KSwgLi4ufSkgPSAwCnN0YXQoIi9k
ZXYvbWFwcGVyL2x2MjAiLCAweDdmZmQxYjBjZTBkMCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9kZXYvbWFwcGVyIiwgT19SRE9OTFl8T19OT05CTE9DS3xP
X0RJUkVDVE9SWXxPX0NMT0VYRUMpID0gNApmc3RhdCg0LCB7c3RfbW9kZT1TX0lGRElSfDA3NTUs
IHN0X3NpemU9NDYwLCAuLi59KSA9IDAKZ2V0ZGVudHMoNCwgLyogMjMgZW50cmllcyAqLywgMzI3
NjgpICAgID0gOTkyCnN0YXQoIi9kZXYvbWFwcGVyL3ZnLWx2MTUtcmVhbCIsIHtzdF9tb2RlPVNf
SUZCTEt8MDY2MCwgc3RfcmRldj1tYWtlZGV2KDI1MywgMTgpLCAuLi59KSA9IDAKY2xvc2UoNCkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMAppb2N0bCgzLCBETV9ERVZfU1RBVFVT
LCB7dmVyc2lvbj00LjAuMCwgZGF0YV9zaXplPTE2Mzg0LCBuYW1lPSJ2Zy1sdjE1LXJlYWwiLCBm
bGFncz1ETV9FWElTVFNfRkxBR30gPT4ge3ZlcnNpb249NC4zNS4wLCBkYXRhX3NpemU9MTYzODQs
IG5hbWU9InZnLWx2MTUtcmVhbCIsIGZsYWdzPURNX0VYSVNUU19GTEFHfSkgPSAtMSBFTlhJTyAo
Tm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcykKd3JpdGUoMiwgIkRldmljZSBkb2VzIG5vdCBleGlz
dC4iLCAyMkRldmljZSBkb2VzIG5vdCBleGlzdC4pICA9IDIyCndyaXRlKDIsICJcbiIsIDEKKSAg
ICAgICAgICAgICAgICAgICAgICAgPSAxCndyaXRlKDIsICJDb21tYW5kIGZhaWxlZC4iLCAxNUNv
bW1hbmQgZmFpbGVkLikgICAgICAgICA9IDE1CndyaXRlKDIsICJcbiIsIDEKKSAgICAgICAgICAg
ICAgICAgICAgICAgPSAxCmNsb3NlKDMpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9
IDAKZXhpdF9ncm91cCgxKSAgICAgICAgICAgICAgICAgICAgICAgICAgID0gPworKysgZXhpdGVk
IHdpdGggMSArKysK
--=_9dd4400d845e7b78c5710a01f720d1c3--
