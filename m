Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7FA95FP012148
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2011 06:09:05 -0400
Received: from nm7.bullet.mail.ukl.yahoo.com (nm7.bullet.mail.ukl.yahoo.com
	[217.146.182.248])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p7FA94wo008669
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2011 06:09:04 -0400
Date: Mon, 15 Aug 2011 11:09:02 +0100
From: Stephane Chazelas <stephane_chazelas@yahoo.fr>
Message-ID: <20110815100902.GA4438@yahoo.fr>
References: <4E48E81C.9040504@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E48E81C.9040504@tlinx.org>
Subject: Re: [linux-lvm] dmsetup -split is buggy
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2011-08-15 02:34:20 -0700, Linda A. Walsh:
[...]
> I can hack around the bug, but its surprising that dmsetup doesn't support
> the only official LVM names (/dev/VG/LV).
> 
> Is this bug a 'feature', or is it something that should be fixed?
[...]

dmsetup deals with device-mapper devices. Those in /dev/mapper,
that you can see with "dmsetup table". LVM uses the
device-mapper, and is one of the many subsystems that use it.
You can even create device mapper devices manually and use
whatever convention you like like.

sudo dmsetup table VG-LV | dmsetup create LV@VG

for instance, to make a clone of the VG-LV device (created by LVM from
the VG/LV subvolume) as a LV@VG device.

If there's a bug in dmsetup, it's with providing with a
"splitname" subcommand. I can't think of any good reason why
that is included. IMO, that feature should be provided by LVM,
not dmsetup.

-- 
Stephane
