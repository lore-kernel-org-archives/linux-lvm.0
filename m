Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAUFrktg008608
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 10:53:46 -0500
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAUFraBr000836
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 10:53:37 -0500
Received: by wyb28 with SMTP id 28so6015577wyb.33
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 07:53:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <id35v0$32d$1@taco.int.tagonline.com>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
	<4CF3F7A0.2080108@rjl.com>
	<AANLkTim67atrgHEzunBRvp4ij+MUDiTg4vu5t6sbgFLq@mail.gmail.com>
	<4CF4A472.20107@rjl.com>
	<AANLkTing5ApAXM2o0M+pxNvg01mHewNgGGBiUXM3aLzZ@mail.gmail.com>
	<id35v0$32d$1@taco.int.tagonline.com>
Date: Tue, 30 Nov 2010 22:53:35 +0700
Message-ID: <AANLkTi=sEBr8doKLVGhxAH9d0AQXr9oq4LB=WyqB6Dhg@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 30, 2010 at 10:41 PM, Andrew Gideon <ag2827189@tagmall.com> wrote:
> I'm having some difficulty following this thread, so perhaps I've missed
> some other aspect to this. �But the above makes it seem like you simply
> wish to transport snapshots. �Why not use something as straightforward as
> dd for this rather than RAID1? �RAID1 tools (mdadm, drbd, etc.) have the
> benefit of keeping volumes in sync over time. �But the above process
> describes a synchronization over a single instant (the instant of the
> snapshot being taken). �So why bother with the extra work/capability/
> complexity?

Our posts must have crossed in the mail - please see my message
immediately prior to this one.

> I'm also puzzled by something you wrote in your very first message on
> this thread: "the hard-linked filesystems on FILER-B require full
> filesystem cloning with block-level tools rather than file-level copying
> or sync'ing." �Why? �rsync -H handles cloning of hard links (though at a
> performance cost).

The performance cost becomes unworkable when you are talking about a
filesystem with literally millions of hardlinks, as any reasonably
well-used rsnapshot/rdiff-backup/BackupPC installation will create.
Perhaps my current problem will be overcome by adding 64GB of RAM to
my host, but as the number of hardlinks grows. . .

It is precisely this problem I'm trying to address.
http://www.google.co.th/search?hl=en&q=backuppc+pool+rsync+hard-link
