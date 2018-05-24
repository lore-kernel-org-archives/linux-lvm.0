Date: Thu, 24 May 2018 10:46:23 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180524154623.GA19254@redhat.com>
References: <CABZYMH5Ucj3Nm_FOtJ_+TZS+Q_iXOsJ_k5H4ZSoeX_teqPV6ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH5Ucj3Nm_FOtJ_+TZS+Q_iXOsJ_k5H4ZSoeX_teqPV6ww@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] "VGLK res_unlock lm error -250" and lvm
 command hung forever
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
To: Damon Wang <damon.devops@gmail.com>
Cc: linux-lvm@redhat.com

On Thu, May 24, 2018 at 10:44:05PM +0800, Damon Wang wrote:
> Hi all,
> 
> I'm using lvmlockd + sanlock on iSCSI, and sometimes (usually
> intensive operations), it shows vglock is failed:

Hi, thanks for this report.

> /var/log/messages:
> 
>     May 24 21:14:29 dev1 sanlock[1108]: 2018-05-24 21:14:29 605471
> [1112]: r627 paxos_release 8255 other lver 8258

I believe this is the sanlock bug that was fixed here:
https://pagure.io/sanlock/c/735781d683e99cccb3be7ffe8b4fff1392a2a4c8?branch=master

By itself, the bug isn't a big problem, the lock was released but sanlock
returns an error.  The bigger problem is that lvmlockd then believes that
the lock was not released:

>     1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
> unlock_san release error -1

so subsequent requests for the lock get backed up in lvmlockd:

>     [root@dev1 ~]# lvmlockctl -i
>     LW VG sh ver 0 pid 34216 (lvchange)
>     LW VG sh ver 0 pid 75685 (lvs)
>     LW VG sh ver 0 pid 83741 (lvdisplay)
>     LW VG sh ver 0 pid 90569 (lvchange)
>     LW VG sh ver 0 pid 92735 (lvchange)
>     LW VG sh ver 0 pid 99982 (lvs)
>     LW VG sh ver 0 pid 14069 (lvchange)

> My questions are:
> 
> 1. why VGLK failed, is it because network failure(cause iSCSI fail and
> sanlock could not find VGLK volume), can I find a direct proof?

I believe the bug.  Failures of the storage network can also cause similar
issues, but you would see error messages related to i/o timeouts.

> 2. Is it recoverable? I have tried kill all hung commands but new
> command still hung forever.

There are recently added options for this kind of situation, but I don't
believe there is an lvm release with those yet.

If you are prepared to build your own version of lvm, build lvm release
2.02.178 (which should be ready shortly, if it's not, take git master
branch).  Be sure to configure with --enable-lvmlockd-sanlock.  Then try:

  lvchange -an --lockopt skipvg <vgname>
  lvmlockctl --drop <vgname>
  stop lvmlockd, stop sanlock
  restart everything as usual

If that doesn't work, or if you don't want to build lvm, then unmount file
systems, kill lvmlockd, kill sanlock, you might need to do some dm cleanup
if LVs were active (or perhaps just reboot the machine.) Restart
everything as usual.

Dave
