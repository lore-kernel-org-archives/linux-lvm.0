Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE321810C
	for <linux-lvm@redhat.com>; Tue, 17 Apr 2018 11:15:42 +0000 (UTC)
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90C6A315008E
	for <linux-lvm@redhat.com>; Tue, 17 Apr 2018 11:15:31 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id 145-v6so9410100itf.5
	for <linux-lvm@redhat.com>; Tue, 17 Apr 2018 04:15:31 -0700 (PDT)
References: <CAJCQCtQ3r16BYYtrx9rVYauh7JeAp9omWidS4zzwxqvhU1bh+g@mail.gmail.com>
	<5425366f-f339-d6f3-26d1-d02c3ba80671@gmail.com>
	<002ab104-82ad-0187-8bd0-b0b55338ab83@youngman.org.uk>
From: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>
Message-ID: <65575762-1c14-e252-a3fd-0003ce82ca36@gmail.com>
Date: Tue, 17 Apr 2018 07:15:25 -0400
MIME-Version: 1.0
In-Reply-To: <002ab104-82ad-0187-8bd0-b0b55338ab83@youngman.org.uk>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Add udev-md-raid-safe-timeouts.rules
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
To: Wol's lists <antlists@youngman.org.uk>, Chris Murphy <lists@colorremedies.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, linux-lvm@redhat.com, Linux-RAID <linux-raid@vger.kernel.org>

On 2018-04-16 11:02, Wol's lists wrote:
> On 16/04/18 12:43, Austin S. Hemmelgarn wrote:
>> On 2018-04-15 21:04, Chris Murphy wrote:
>>> I just ran into this:
>>> https://github.com/neilbrown/mdadm/pull/32/commits/af1ddca7d5311dfc9ed6=
0a5eb6497db1296f1bec=20
>>>
>>>
>>> This solution is inadequate, can it be made more generic? This isn't
>>> an md specific problem, it affects Btrfs and LVM as well. And in fact
>>> raid0, and even none raid setups.
>>>
>>> There is no good reason to prevent deep recovery, which is what
>>> happens with the default command timer of 30 seconds, with this class
>>> of drive. Basically that value is going to cause data loss for the
>>> single device and also raid0 case, where the reset happens before deep
>>> recovery has a chance. And even if deep recovery fails to return user
>>> data, what we need to see is the proper error message: read error UNC,
>>> rather than a link reset message which just obfuscates the problem.
>>
>> This has been discussed at least once here before (probably more=20
>> times, hard to be sure since it usually comes up as a side discussion=20
>> in an only marginally related thread).=20
>=20
> Sorry, but where is "here"? This message is cross-posted to about three=20
> lists at least ...
Oops, didn't see the extra lists listed.  In this case, discussed=20
previously on the BTRFS ML.
>=20
>  =C2=A0Last I knew, the consensus here was
>> that it needs to be changed upstream in the kernel, not by adding a=20
>> udev rule because while the value is technically system policy, the=20
>> default policy is brain-dead for anything but the original disks it=20
>> was i9ntended for (30 seconds works perfectly fine for actual SCSI=20
>> devices because they behave sanely in the face of media errors, but=20
>> it's horribly inadequate for ATA devices).
>>
>> To re-iterate what I've said before on the subject:
>>
> imho (and it's probably going to be a pain to implement :-) there should =

> be a soft time-out and a hard time-out. The soft time-out should trigger =

> "drive is taking too long to respond" messages that end up in a log - so =

> that people who actually care can keep a track of this sort of thing.=20
> The hard timeout should be the current set-up, where the kernel just=20
> gives up.
Agreed, although as pointed out by Roger in his reply to this, it kind=20
of already works this way in some cases.
