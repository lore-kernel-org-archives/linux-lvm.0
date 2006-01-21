Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0LHLw127385
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 12:21:58 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0LHLp5A029650
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 12:21:51 -0500
Received: by xproxy.gmail.com with SMTP id h28so751591wxd
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 09:21:51 -0800 (PST)
Message-ID: <bde36b470601210921x3116aa4bs1afcecf35eac084a@mail.gmail.com>
Date: Sat, 21 Jan 2006 11:21:51 -0600
From: Jeff McClure <jeff.mcclure@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] random occasional filesystem corruption
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

This is related to a thead I saw in the archives, but I couldn't
figure out a way to reply to it. A copy of the last message in the
thread is included at the bottom of this email for reference.

I have two ext3 filesystems running on LVM2 on software RAID 1. I am
seeing occasional (three times in about a month), seemingly random
filesystem corruption on both filesystems. It matches the pattern
reported by "Gumby" in the thread below. Here's the log of the latest
one:

Jan 21 09:50:25 castrovalva kernel: attempt to access beyond end of device
Jan 21 09:50:25 castrovalva kernel: dm-0: rw=0, want=7011473768, limit=20971520
Jan 21 09:50:25 castrovalva kernel: attempt to access beyond end of device
Jan 21 09:50:25 castrovalva kernel: dm-0: rw=0, want=26847680, limit=20971520
Jan 21 09:50:25 castrovalva kernel: EXT3-fs error (device dm-0):
ext3_readdir: bad entry in directory #1179649: rec_len is smaller than
minimal - offset=0, inode=0, rec_len=0, name_len=0
Jan 21 09:50:25 castrovalva kernel: Aborting journal on device dm-0.
Jan 21 09:50:25 castrovalva kernel: __journal_remove_journal_head:
freeing b_committed_data
Jan 21 09:50:25 castrovalva kernel: ext3_abort called.
Jan 21 09:50:25 castrovalva kernel: EXT3-fs error (device dm-0):
ext3_journal_start_sb: Detected aborted journal
Jan 21 09:50:25 castrovalva kernel: Remounting filesystem read-only

As with the other occasions, unmounting and running e2fsck recovered
the filesystem.

System is Debian testing, kernel 2.6.15 (but the problem was also seen
on a 2.6.14 kernel).
lvm2 package is 2.01.04-5 (with lvm-common version 1.5.20).
Nothing below the ext3 layer ever reports a problem. There are no LVM,
RAID, or low level hard drive IO errors in the logs.
I use smartmon tools, and all the drives in the system get a SMART
short test run once a day and a long test once a week. The latest long
test happened just a few hours before the log above. There are no
physical problems reported on the hard drives.

The corruption is happening on both of the LVM/RAID filesystems, but
not on any of the non-LVM/RAID filesystems on the system drive. The
two filesystems in question hold very different files. They basically
don't share any applications in common, so I find it very unlikely
that an application is causing the corruption. One of the filesystems
is primarily a maildir mail store. Primary application accessing that
drive is courier-imap. The other filesystem contains MP3s. Samba and
slimserver are the main applications accessing that filesystem.

I haven't been able to bring down the system long enough to run
memtest, but I find RAM to be an unlikely culprit. I've been able to
build at least three 2.6 kernels with all modules turned on with no
problems, which seems improbable with bad RAM. Also, the system drive
never seems to get corrupted.

The problem started after I rebuilt this system with kernel 2.6 and
LVM2. It previously ran for a couple of years on 2.4/LVM1/RAID/ext3
with absolutely no problems.

I have no good reason to point to LVM except that it's one of the
things that changed, and it's in the right place to cause these
symptoms. Does anyone have anything that I can try in order to
confirm/rule out LVM? Is there any more system information I can
provide?

Unless I hear something, my next action will probably be to backup the
data and remove the LVM layer (run ext3 directly over RAID 1). I'll
run with that for a month or two and see if the problem is still
there.

--Jeff

> -----Original Message-----
> From: linux-lvm-bounces redhat com
[mailto:linux-lvm-bounces redhat com]
> On Behalf Of Terry Rigby
> Sent: Friday, December 02, 2005 9:25 AM
> To: linux-lvm redhat com
> Subject: Re: [linux-lvm] Need to keep running fsck on LVM
>
> On December 2, 2005 09:12 am, Erik Ohrnberger wrote:
> > grep /dev/hd /var/log/messages /var/log/syslog | more
>
> Nope, that outputs nothing at all.
>
> I do however see the following in /vavr/log/messages over and over and
> over
> again...
>
> Dec  1 23:12:46 localhost kernel: attempt to access beyond end of
device
> Dec  1 23:12:46 localhost kernel: dm-0: rw=0, want=6444890144,
> limit=905314304

That complaint is from ll_rw_blk.c.  There is probably an application
corrupting your filesystem, or a filesystem bug.
>
> Gumby
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm redhat com


> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO
