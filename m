Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAC7bkV31348
	for <linux-lvm@redhat.com>; Sat, 12 Nov 2005 02:37:46 -0500
Received: from nproxy.gmail.com (nproxy.gmail.com [64.233.182.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAC7betT025688
	for <linux-lvm@redhat.com>; Sat, 12 Nov 2005 02:37:40 -0500
Received: by nproxy.gmail.com with SMTP id k26so185723nfc
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 23:37:39 -0800 (PST)
Message-ID: <62b0912f0511112337q7d94fe1ajd48941d8391af28d@mail.gmail.com>
Date: Sat, 12 Nov 2005 07:37:39 +0000
From: Molle Bestefich <molle.bestefich@gmail.com>
In-Reply-To: <62b0912f0511110516gf83b91eta2098d137f456d51@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <62b0912f0511110516gf83b91eta2098d137f456d51@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Fwd: LVM snapshots: guess *that's* not how it's done
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
To: linux-lvm@redhat.com

Moderator requested 83kB of screenshots be scrapped.  Now it is.
(It's still in this original mail in the dm-devel archives.

---------- Forwarded message ----------
From: Molle Bestefich <molle.bestefich@gmail.com>
Date: Fri, 11 Nov 2005 14:16:22 +0100
Subject: LVM snapshots: guess *that's* not how it's done
To: dm-devel@redhat.com, linux-lvm@redhat.com

Good day,

I just bought a shiny big new box.
Contemplating using Xen + dm snapshots + unionfs + nbd to do various
fun things with it.
Since Fedora Core 4 has a couple of those things already in the
distro, I went with that.

I did this:
1. Install Fedora Core 4
2. Create a snapshot of the root volume with lvcreate

Seems the snapshotting did not go after plan - see attached screenshot....

Is that a serious bug in device-mapper or lvm, or is it just me that's
doing something wrong?

After the lvcreate, nothing works.  A couple things like 'df' does,
but otherwise there's dialogs complaining about missing ELF headers
and non-executable binary files no matter what I click or try to run.

This is the disk layout:

2x300GB SATA with 3 MD RAID1 partitions:
md0: 512MB ext3 --> /boot
md1: 8GB swap
md2: 250GB LVM --> VolGroup0

Dom0Vol: 20GB ext3 LV on VolGroup0
FC4_Install: 10GB snapshot LV of Dom0Vol

Both disks were burn-in tested twice before starting.
