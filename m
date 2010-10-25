Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9PJGiBq015435
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 15:16:44 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9PJGVnS009333
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 15:16:32 -0400
Received: by wyf28 with SMTP id 28so3798477wyf.33
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 12:16:31 -0700 (PDT)
From: Stephane Chazelas <stephane.chazelas@googlemail.com>
In-Reply-To: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
Message-ID: <1288034225.4299.14.camel@sc.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Determine boot disk device name...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Mon, 25 Oct 2010 19:16:49 -0000
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2010-10-23 at 22:58 -0400, Jon Price wrote:
> 
> Hi,
> For starters, how can I determine the physical device name of
> current/active boot disk in Linux?
[...]

Please clarify what you mean by "physical device" and "boot disk"
especially when refered to as "current/active".

Note that Linux can start on disk-less machines. "boot"ing generally
means the process that kick-starts an operating system, so there's
nothing "current" of "active" about it, it's something that happens once
and is over by the time the system is running.

If you mean where the root filesystem reside, you can do a stat(2) on /
and look at M=major(st.st_dev) and m=minor(st.st_dev).

You can look-up M in /proc/devices.

For LVM, you'll find it's "device-mapper".

You can do a dmsetup table /dev/dm-<m> to see how that is configured.

You may find for instance that it's a mirror on two scsi drives, or that
it's a raid0 on 2 loop devices. You may then use losetup to see which
files they loop on. Then do a stat(2) again on those, and you may find
that they are on network blocks which are themselves shared by another
machine from a file shared over NFS off a 3rd machine, which is virtual
and has its backend stored in a qcow2 virtual drive itself stored on a
dm-raid and with copy-on-write on another file somewhere else, at which
point you might be able to find out about the serial number of the hard
drives they're on if that's what you're after...

-- 
Stephane
