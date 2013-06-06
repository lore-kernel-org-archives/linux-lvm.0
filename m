Message-ID: <51B0296D.4090702@pse-consulting.de>
Date: Thu, 06 Jun 2013 08:17:17 +0200
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<20130319164224.GI20480@agk-dp.fab.redhat.com>
	<5148A372.6050402@hoster-ok.com>
	<51AF3BD4.5070203@pse-consulting.de>
	<20130605151310.GA13992@redhat.com>
In-Reply-To: <20130605151310.GA13992@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] clvmd leaving kernel dlm uncontrolled lockspace
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Am 05.06.13 17:13, schrieb David Teigland:

> A few different topics wrapped together there:
>
> - With kill -9 clvmd (possibly combined with dlm_tool leave clvmd),
>    you can manually clear/remove a userland lockspace like clvmd.
>
> - If clvmd is blocked in the kernel in uninterruptible sleep, then
>    the kill above will not work.  To make kill work, you'd locate the
>    particular sleep in the kernel and determine if there's a way to
>    make it interruptible, and cleanly back it out.

I had clvmds blocked in kernel, so how to "locate the sleep and make it 
interruptible"?
>
> - If clvmd is blocked in the kernel for >120s, you probably want to
>    investigate what is causing that, rather than being too hasty
>    killing clvmd.
INFO: task clvmd:19766 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
clvmd           D ffff880058ec4870     0 19766      1 0x00000000
ffff880058ec4870 0000000000000282 0000000000000000 ffff8800698d9590
0000000000013740 ffff880063787fd8 ffff880063787fd8 0000000000013740
ffff880058ec4870 ffff880063786010 0000000000000001 0000000100000000
Call Trace:
[<ffffffff81367f7a>] ? rwsem_down_failed_common+0xda/0x10e
[<ffffffff811c5924>] ? call_rwsem_down_read_failed+0x14/0x30
[<ffffffff813678da>] ? down_read+0x17/0x19
[<ffffffffa059b705>] ? dlm_user_request+0x3a/0x17e [dlm]
[<ffffffffa05a40e4>] ? device_write+0x279/0x5f7 [dlm]
[<ffffffff810f7d7a>] ? __kmalloc+0x104/0x116
[<ffffffffa05a416b>] ? device_write+0x300/0x5f7 [dlm]
[<ffffffff810042c9>] ? xen_mc_flush+0x12b/0x158
[<ffffffff8117489e>] ? security_file_permission+0x18/0x2d
[<ffffffff81106dd5>] ? vfs_write+0xa4/0xff
[<ffffffff81106ee6>] ? sys_write+0x45/0x6e
[<ffffffff8136d652>] ? system_call_fastpath+0x16/0x1b

On 3.2.35

>
> - If corosync or dlm_controld are killed while dlm lockspaces exist,
>    they become "uncontrolled" and would need to be forcibly cleaned up.
>    This cleanup may be possible to implement for userland lockspaces,
>    but it's not been clear that the benefits would greatly outweigh
>    using reboot for this.

On a machine being Xen host with 20+ running VMs I'd clearly prefer to 
clean those orphaned memory space and go on.... I still have 4 hosts to 
be rebooted which serve as xen host, providing their devices from 
clvmd-controlled (i.e. now uncontrollable) san space.
>
> - Killing either corosync or dlm_controld is very unlikely help
>    anything, and more likely to cause further problems, so it should
>    be avoided as far as possible.

I understand. One reason to upgrade was that I had infrequent 
situations, where the corosync 1.4.2 instances on all nodes exitted 
simultaneously without any log notice. Having this with the new 
corosync2.3/dlm infrastructure would mean a whole cluster having 
uncontrollable san space. So either the lockspace should be 
automatically reclaimed if dlm_controld finds it uncontrolled, or a 
means to clean it up manually should be available.

Regards,
Andreas
>
> Dave
