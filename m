Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1BLxUnk031021
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 16:59:30 -0500
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1BLwHIY007329
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 16:58:18 -0500
Received: by bwz4 with SMTP id 4so626067bwz.3
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 13:58:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
Date: Wed, 11 Feb 2009 21:58:16 +0000
Message-ID: <b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
Subject: Re: [linux-lvm] About fstab and fsck
From: David Robinson <zxvdr.au@gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> I recently added a new disk ( secondary 750G) and added it into a VG  and
> then increased the size of the LV.
>
> Can you please advise of the following q:
>
> 1) Do we need to change anything in  /etc/fstab or the second disk will be
> automatically mounted on reboot?

You said you increased the size of a LV, not added a new LV. If you
added a new LV and created a filesystem on it you'd want to add it to
fstab, but if you're growing an existing LV and filesystem you
wouldn't need to change anything - the filesystem you grew would
already be listed in fstab. You did grow the filesystem too, right?
Why do you think you need to reboot?

> 2)  For 1.3 TB , fsck is going to take a long time
>
> Is it good idea disable fsck completely on reboot and or  do scheduled
> manual fsck.  Due to the nature of data , even manual fsck is not preffered
> though, but with tight budget, other things are not possible

Usually you'd want to have fsck enabled for your root filesystem, but
by the looks of it the LV and filesystem you grew _is_ your root
filesystem... so considering its size, I'd turn it off. Hopefully the
"fsck takes _forever_" problem will die when btrfs becomes the
standard filesystem.

--Dave
