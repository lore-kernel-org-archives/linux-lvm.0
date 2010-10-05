Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o952fCks029365
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 22:41:12 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o952evAW022647
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 22:40:57 -0400
Received: by iwn5 with SMTP id 5so10002127iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 19:40:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
	<AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
	<AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
Date: Tue, 5 Oct 2010 08:10:57 +0530
Message-ID: <AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 5, 2010 at 1:27 AM, Alexander Skwar
<alexanders.mailinglists+nospam@gmail.com> wrote:
>
> Yes. The question was, what filesystem you've put
> on the lv. cfdisk is (basically) of no use for LVM. And
> even in old style partitioning, cfdisk isn't used for
> creating filesystems.
Are you referring to ext3/ext4 type of file system.
>>>
>>> =EF=BF=BD Read the howto!
>> Well what exactly ?
>>
>
> The LVM howto.
I have read it but what I am asking is not mentioned.
I am breaking an LVM which is not having any filesystem on it into 2 parts.
One will be used as root of type ext4 and another part will be used as
swap filesystem.
How can this be done.
mkfs.ext3 and mkswapfs commands exist but how to I break the LVM in to 2 pa=
rts.
I am not asking to extend or move or resize or taking snapshot of the
LVM which is given in your LVM Howto.
If you used virt-manager it does that
any user space program will show you one LVM but inside it will be
having ext3 and swap partition within same LVM.
I do not want to have different LVM for swap and ext3.
I want both these filesystems to co exist.
This thing is not mentioned in the LVM How to.
