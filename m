Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0IKhuO32501
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 15:43:56 -0500
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.242])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0IKhoDb008339
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 15:43:50 -0500
Received: by mproxy.gmail.com with SMTP id q44so597033cwc
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 12:43:44 -0800 (PST)
Message-ID: <dff375270501181243c58f4d2@mail.gmail.com>
Date: Tue, 18 Jan 2005 15:43:44 -0500
From: Kristina Clair <kclair@gmail.com>
Subject: Re: [linux-lvm] snapshots and nfs
In-Reply-To: <20050118200128.GS26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <dff37527050118093648e504e@mail.gmail.com>
	<20050118194449.GQ26670@agk.surrey.redhat.com>
	<dff3752705011811541b040c4e@mail.gmail.com>
	<20050118200128.GS26670@agk.surrey.redhat.com>
Reply-To: Kristina Clair <kclair@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Tue, 18 Jan 2005 20:01:28 +0000, Alasdair G Kergon <agk@redhat.com> wrote:
> On Tue, Jan 18, 2005 at 02:54:41PM -0500, Kristina Clair wrote:
> > Now, if I run lvcreate shortly after the machine is booted, it runs
> > successfully.  However, if I try to run the same command the next day,
> > after it's been online and the webservers have had the filesystem
> > mounted, it hangs when trying to suspend the volume.
>  
> How does it hang?  Do you get kernel error messages?
> Try watching kernel memory usage just before the failures:
> It could be one of the out-of-memory problems with snapshots
> that we're working on fixing.

I'm not sure about kernel memory usage - actually I don't even know
how to watch kernel memory usage :-)
But by "hang", I just mean that the output hangs, and the command is
still running but is "sleeping".  When it runs successfully, it
doesn't pause at all after it suspends the volume.
One weird thing is that when it is hanging, if I strace the process,
the lvcreate command gets killed.

here is the output of lvcreate and then strace (i apologize for the
backslashes):

\ \ \ \ Creating\ volume\ group\ backup\ \"/etc/lvm/backup/nfsvg\"\
\ \ \ \ \ \ Finding\ volume\ group\ for\ uuid\
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBvh0UnmPyjHyWMwgczC9WXDQFZtF4Ykie\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ Found\ volume\ group\ \"nfsvg\"\
\ \ \ \ \ \ Setting\ activation/missing_stripe_filler\ to\ /dev/ioerror\
\ \ \ \ \ \ Locking\ memory\
\ \ \ \ Loading\ nfsvg-20050118\
\ \ \ \ \ \ Activated\ nfsvg-20050118\
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBvh0UnmPyjHyWMwgczC9WXDQFZtF4Ykie\
253:008\
\ \ \ \ \ \ Unlocking\ memory\
\ \ \ \ \ \ Linking\ /dev/nfsvg/20050118\ -\>\
/dev/mapper/nfsvg-20050118\
\ \ \ \ Zeroing\ start\ of\ logical\ volume\ \"20050118\"\
\ \ \ \ \ \ Finding\ volume\ group\ for\ uuid\
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBvh0UnmPyjHyWMwgczC9WXDQFZtF4Ykie\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ Found\ volume\ group\ \"nfsvg\"\
\ \ \ \ \ \ Locking\ memory\
\ \ \ \ Removing\ nfsvg-20050118\
\ \ \ \ \ \ Unlocking\ memory\
\ \ \ \ \ \ Removing\ link\ /dev/nfsvg/20050118\
\ \ \ \ \ \ Finding\ volume\ group\ for\ uuid\
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBvh0UnmPyjHyWMwgczC9WXDQFZtF4Ykie\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ Found\ volume\ group\ \"nfsvg\"\
\ \ \ \ \ \ Finding\ volume\ group\ for\ uuid\
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBz048ZiCMdqNZhJV1ImaBs77WsnFRlsLD\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdb:\ lvm2\ label\ detected\
\ \ \ \ \ \ /dev/sdc:\ lvm2\ label\ detected\
\ \ \ \ Found\ volume\ group\ \"nfsvg\"\
\ \ \ \ \ \ Locking\ memory\
\ \ \ \ \ \ Suspending\ nfsvg-lvol0\

[ at this point i run strace and it kills lvcreate ]

\ \ device-mapper\ ioctl\ cmd\ 6\ failed:\ Interrupted\ system\ call\
\ \ Couldn\'t\ suspend\ device\ \'nfsvg-lvol0\'\
\ \ \ \ \ \ Unlocking\ memory\
\ \ Failed\ to\ suspend\ origin\ lvol0\
\ \ \ \ \ \ Unlocking\ /var/lock/lvm/V_nfsvg\

% strace
write(2, "  ", 2)                       = 2
write(2, "    ", 4)                     = 4
write(2, "Unlocking memory", 16)        = 16
write(2, "\n", 1)                       = 1
brk(0x810b000)                          = 0x810b000
setpriority(PRIO_PROCESS, 0, 0)         = 0
close(3)                                = 0
write(2, "  ", 2)                       = 2
write(2, "Failed to suspend origin lvol0", 30) = 30
write(2, "\n", 1)                       = 1
time([1106062664])                      = 1106062664
rt_sigaction(SIGPIPE, {0xb7f0e860, [], 0}, {SIG_DFL}, 8) = 0
socket(PF_FILE, SOCK_DGRAM, 0)          = 3
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
connect(3, {sa_family=AF_FILE, path="/dev/log"}, 16) = 0
send(3, "<11>Jan 18 08:37:44 lvm[5829]: F"..., 61, 0) = 61
rt_sigaction(SIGPIPE, {SIG_DFL}, NULL, 8) = 0
stat64("/proc/lvm/VGs/nfsvg", 0xbffff530) = -1 ENOENT (No such file or
directory)
write(2, "  ", 2)                       = 2
write(2, "    ", 4)                     = 4
write(2, "Unlocking /var/lock/lvm/V_nfsvg", 31) = 31
write(2, "\n", 1)                       = 1
flock(4, LOCK_NB|LOCK_UN)               = 0
flock(4, LOCK_EX|LOCK_NB)               = 0
stat64("/var/lock/lvm/V_nfsvg", {st_mode=S_IFREG|0700, st_size=0, ...})
= 0
fstat64(4, {st_mode=S_IFREG|0700, st_size=0, ...}) = 0
unlink("/var/lock/lvm/V_nfsvg")         = 0
close(4)                                = 0
close(5)                                = 0
close(6)                                = 0
close(7)                                = 0
close(8)                                = 0
close(9)                                = 0
close(10)                               = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
open("/etc/lvm/.cache", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 4
fstat64(4, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7feb000
write(4, "# This file is automatically mai"..., 184) = 184
close(4)                                = 0
munmap(0xb7feb000, 4096)                = 0
brk(0x80f7000)                          = 0x80f7000
brk(0x80e7000)                          = 0x80e7000
close(3)                                = 0
exit_group(5)                           = ?

Kristina
