Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o94J9I6W014854
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 15:09:18 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o94J93R8026333
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 15:09:03 -0400
Received: by gwj17 with SMTP id 17so2178341gwj.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 12:09:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
Date: Tue, 5 Oct 2010 00:38:59 +0530
Message-ID: <AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
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

On Tue, Oct 5, 2010 at 12:00 AM, Alexander Skwar
<alexanders.mailinglists+nospam@gmail.com> wrote:
> Okay. In cfdisk, you don't create filesystems. And cfdisk is
> of no use for dealing with LVM (besides maybe creating
> partitions which have to be made PVs with pvcreate).
I created partitions with cfdisk and the one of the partition is
partition number 83 I made it and another is 82 which is swap space.


> Hence the question: What filesystem is on this lv?
I was searching what is the code 83 corresponds to that I could not find
because if I remember 83,84 like that it was used for ext3/etx4 but
when I used cfdisk
i could not find a hex code corresponding to ext3,ext4.
> And I'd
> like to restate the advice from someone else:
>
> =EF=BF=BD Read the howto!
Well what exactly ?
