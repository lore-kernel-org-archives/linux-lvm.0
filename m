Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB14jfI4009625
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 23:45:41 -0500
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB14jVAQ012814
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 23:45:31 -0500
Received: by wyb28 with SMTP id 28so6707566wyb.33
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 20:45:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CF52CA5.1090405@turmel.org>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
	<4CF3F7A0.2080108@rjl.com>
	<AANLkTim67atrgHEzunBRvp4ij+MUDiTg4vu5t6sbgFLq@mail.gmail.com>
	<4CF4A472.20107@rjl.com>
	<AANLkTing5ApAXM2o0M+pxNvg01mHewNgGGBiUXM3aLzZ@mail.gmail.com>
	<4CF4F85C.1020806@turmel.org>
	<AANLkTi=F5Ttrp9-_wto4ZNWiDvY=cPe0_p26BPyzvMDz@mail.gmail.com>
	<4CF52CA5.1090405@turmel.org>
Date: Wed, 1 Dec 2010 11:45:30 +0700
Message-ID: <AANLkTin4f=W69mr923KhSYT_qvFnLiz0fpScWo0w1rfu@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Q: LVM over RAID,
 or plain disks? A:"Yes" = best of both worlds?
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
To: Phil Turmel <philip@turmel.org>
Cc: linux-raid@vger.kernel.org, linux-lvm@redhat.com

On Tue, Nov 30, 2010 at 11:56 PM, Phil Turmel <philip@turmel.org> wrote:

> (Actually, rsync and tar are both hardlink-aware, at least the versions I use.)

My backup filesystems contain so many hardlinks (millions, constantly
growing) that file-level tools choke - this really must be done at the
block device level - see my previous post for more detail.

It's also now clear to me that rsync is the tool to use for this for
all the other LVs without such problematic filesystems, as I know the
tool and trust its error-checking routines.


>> So adapting your suggestion to fit (my perception of) my needs:
>>
>> � - create an LV snapshot
>> � - mount a plain partition on a physical hard disk (preferably on a
>> separate controller?)
>> � - dd the data from the LV snapshot over to the partition
>> � - delete the snapshot
>
> Yep, this is basically what I recommended.

>> So I guess my question becomes:
>>
>> What is the best tool to block-level clone an LV snapshot to a regular
>> disk partition?
>>
>> � - "best" = as close to 100% reliably as possible, speed isn't nearly
>> as important
>
> I would use dd.

OK, that's clear, thanks.


>> Would a COT cloning package (something like Acronis TrueImage) have
>> data reliability advantages (like mdm's) over dd?
>
> Not really. �But they may offer various forms of compression/sparsification/error detection if you wish to store the final backups as files. �Of course, if you do that, you might as well use tar+gzip+md5sum.

No, I'm talking about partition-to-partition cloning operations, which
some of these do support. The error detection is critical, and why I
was looking at mdraid in the first place.


> You want your dismountable disks to be accessible stand-alone, but I don't see why that would preclude setting them up so each is a unique LVM VG.

It doesn't preclude it, but it's a layer of complexity during the data
recovery process I'm trying to avoid.

The ultimate goal is a plain partition on a plain disk that can be
directly mounted on a SATA2 host via a normal recovery/LiveCD by a
user that's never heard of RAID or LVM.


To summarize your feedback:

  - mdraid's sync error-checking routines don't add value over dd to
ensure accurate cloning of a static partition; its metadata is just
useless overhead in this case.

  - dd is reliable enough

One last question (and I do realize it's now OT for here, so I won't
be hurt if it's ignored :)

Does dd already do some sort of "verify after copy"? I will likely
investigate the available COTS partition cloning tools as well.


Thanks for all your help, not least in helping me to clarify my own goals
