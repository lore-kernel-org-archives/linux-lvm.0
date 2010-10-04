Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o94JwN0K005288
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 15:58:23 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o94JwEFb024220
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 15:58:14 -0400
Received: by iwn5 with SMTP id 5so9493172iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 12:58:14 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
	<AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Mon, 4 Oct 2010 21:57:52 +0200
Message-ID: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi.

2010/10/4 Tapas Mishra <mightydreams@gmail.com>:
> On Tue, Oct 5, 2010 at 12:00 AM, Alexander Skwar
> <alexanders.mailinglists+nospam@gmail.com> wrote:
>> Okay. In cfdisk, you don't create filesystems. And cfdisk is
>> of no use for dealing with LVM (besides maybe creating
>> partitions which have to be made PVs with pvcreate).
> I created partitions with cfdisk and the one of the partition is
> partition number 83 I made it and another is 82 which is swap space.

Yes. The question was, what filesystem you've put
on the lv. cfdisk is (basically) of no use for LVM. And
even in old style partitioning, cfdisk isn't used for
creating filesystems.

>> Hence the question: What filesystem is on this lv?
> I was searching what is the code 83 corresponds to

-> Linux.

> that I could not find

You're using cfdisk? It shows they types, when you hit
"t" (for Types).

-> http://www.imgzzz.com/pic/1286222062

> because if I remember 83,84 like that it was used for ext3/etx4 but
> when I used cfdisk

83 -> Linux
84 -> OS/2 hidden C: drive

> i could not find a hex code corresponding to ext3,ext4.

Of course not. Partitiontypes don't have that much to
do with filesystem.

>> And I'd
>> like to restate the advice from someone else:
>>
>>   Read the howto!
> Well what exactly ?
>

The LVM howto.

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

---> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
