From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Trouble running LVM under Redhat 7.2?
Message-Id: <20020301110718.C30022@sistina.com>
References: <005d01c1c095$8ddebf10$0300000a@STATION>
MIME-Version: 1.0
In-Reply-To: <005d01c1c095$8ddebf10$0300000a@STATION>; from
    aslak@skretting.org on Thu, Feb 28, 2002 at 12:21:49PM -0800
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Mar  1 04:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Aslak,

LVM is supported on vanilla kernels and problems will most likely occur
with ditributor prepatched kernels.

As you mention below, the oopses even occur, if you access partitions.
Do they still occur, when LVM is not patched in?

Anyway:
You should get a 2.4.x kernel of your choice and follow the instructions
in INSTALL and PATCHES/README to patch in the recent LVM driver.

Regards,
Heinz    -- The LVM Guy --


On Thu, Feb 28, 2002 at 12:21:49PM -0800, Aslak Sommerfelt Skretting wrote:
> Hello everyone.
> 
> Does anyone know of any problems that might occur when running LVM under
> Redhat 7.2?
> 
> This is my lvm setup, on two 120gb disks and two 100gb disks.
> 
> root@space.uNF.no:/space# vgdisplay -v storage
> --- Volume group ---
> VG Name               storage
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                1
> Open LV               1
> MAX LV Size           2 TB
> Max PV                255
> Cur PV                4
> Act PV                4
> VG Size               406.41 GB
> PE Size               32 MB
> Total PE              13005
> Alloc PE / Size       13005 / 406.41 GB
> Free  PE / Size       0 / 0
> VG UUID               0Vf6Xc-j0GQ-y068-OF8a-mF1e-9jDT-yKL6ny
> 
> --- Logical volume ---
> LV Name                /dev/storage/space
> VG Name                storage
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                406.41 GB
> Current LE             13005
> Allocated LE           13005
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> 
> --- Physical volumes ---
> PV Name (#)           /dev/hde1 (4)
> PV Status             available / allocatable
> Total PE / Free PE    2980 / 0
> 
> PV Name (#)           /dev/hdc1 (2)
> PV Status             available / allocatable
> Total PE / Free PE    3576 / 0
> 
> PV Name (#)           /dev/hdd1 (3)
> PV Status             available / allocatable
> Total PE / Free PE    2980 / 0
> 
> PV Name (#)           /dev/hdb3 (1)
> PV Status             available / allocatable
> Total PE / Free PE    3469 / 0
> 
> 
> I am able to both install, and setup lvm without any trouble at all, but it
> seems the system gets really unstable. I have tried using both the Redhat
> 2.4.7-10 kernel (the one redhat 7.2 ships with, and the 2.4.17 kernel. I
> have also tried using both lvm 1.0.2 and 1.0.3.
> 
> When reinstalling, i first export the lvm setup, do the system reinstall,
> install lvm, compile new kernel, then when it is up and running, i import
> the lvm setup from the other disks. All this seems to be running fine.
> 
> But when running normally, the system seems to get itself into a lot of
> 'Kernel Oops' problems. I have never seen these before, but now i get them
> all the time. They either cause pretty much every application i try to run
> after the Oops to segfault, or they simply freeze the system. When it gets
> back up, and the system needs to be fsck'ed i also experience a lot of
> problems getting fsck to run properly. when running fsck /dev/hda1 (which is
> a normal ext2 partition, not lvm) i will get the same Kernel oops, and fsck
> will fail. I will eventually get the system back up and running normally,
> but it takes time. Other commands that i have seen give the same kernel oops
> are umount, fsck, proftpd and smbd... I found two examples of this Kernel
> Oops code in /var/log/messages, and have included them below, if anyone is
> able to gather any information from them.
> 
> 
> Any input as to why the system is so unstable would be highly appreciated.
> Does the system dislike that i set the PE size to 32? Are there any problems
> caused by running lvm under Redhat 7.2? (If so, I could go back to 7.1)
> 
> 
> Kind Regards
> Aslak Sommerfelt Skretting
> 
> 
> Included:
> 
> /var/log/messages:
> 
> 
> Feb 26 02:34:32 space sshd(pam_unix)[1217]: session closed for user tek
> Feb 26 04:02:03 space syslogd 1.4.1: restart.
> Feb 26 19:03:36 space sshd(pam_unix)[2639]: session opened for user tek by
> (uid=0)
> Feb 26 19:03:39 space su(pam_unix)[2680]: session opened for user root by
> tek(uid=500)
> Feb 26 19:11:49 space proftpd[2751]: space.uNF.no - ProFTPD terminating
> (signal 11)
> Feb 26 19:11:49 space proftpd[2751]: space.uNF.no - ProFTPD 1.2.4 standalone
> mode SHUTDOWN
> Feb 26 20:14:49 space su(pam_unix)[2680]: session closed for user root
> Feb 26 20:14:50 space sshd(pam_unix)[2639]: session closed for user tek
> Feb 26 23:24:21 space kernel: Unable to handle kernel paging request at
> virtual address 802aeca8
> Feb 26 23:24:21 space kernel:  printing eip:
> Feb 26 23:24:21 space kernel: c013e457
> Feb 26 23:24:21 space kernel: *pde = 00000000
> Feb 26 23:24:21 space kernel: Oops: 0000
> Feb 26 23:24:21 space kernel: CPU:    0
> Feb 26 23:24:21 space kernel: EIP:    0010:[link_path_walk+1703/2048]    Not
> tainted
> Feb 26 23:24:21 space kernel: EIP:    0010:[<c013e457>]    Not tainted
> Feb 26 23:24:21 space kernel: EFLAGS: 00010282
> Feb 26 23:24:21 space kernel: eax: 802aec80   ebx: ddebbf64   ecx: 00000000
> edx: c262c1b8
> Feb 26 23:24:21 space kernel: esi: c8880dc0   edi: ddebbf9c   ebp: c8877820
> esp: ddebbf38
> Feb 26 23:24:21 space kernel: ds: 0018   es: 0018   ss: 0018
> Feb 26 23:24:21 space kernel: Process smbd (pid: 2844, stackpage=ddebb000)
> Feb 26 23:24:21 space kernel: Stack: 00000009 c2a7802d c8880dc0 00000000
> 00000000 c8880e40 00001000 fffffff4
> Feb 26 23:24:21 space kernel:        c2a78000 08199680 c013d89e c2a7800f
> 0000001e 6ea99c29 ddeba000 00000000
> Feb 26 23:24:21 space kernel:        c2a78000 ddebbf9c 00000009 c013ea23
> ddeba000 081f9bc8 bfffea80 bfffe208
> Feb 26 23:24:21 space kernel: Call Trace: [getname+94/160]
> [__user_walk+51/80] [sys_stat64+20/112]
> [error_code+52/60][system_call+51/56]
> Feb 26 23:24:21 space kernel: Call Trace: [<c013d89e>] [<c013ea23>]
> [<c013b504>] [<c010721c>] [<c010712b>]
> Feb 26 23:24:21 space kernel:
> Feb 26 23:24:21 space kernel: Code: 8b 50 28 85 d2 0f 84 8e 00 00 00 bb 00
> e0 ff ff 21 e3 8b 93
> Feb 26 23:24:35 space kernel:  <1>Unable to handle kernel paging request at
> virtual address 802aeca8
> Feb 26 23:24:35 space kernel:  printing eip:
> Feb 26 23:24:35 space kernel: c013e457
> Feb 26 23:24:35 space kernel: *pde = 00000000
> Feb 26 23:24:35 space kernel: Oops: 0000
> Feb 26 23:24:35 space kernel: CPU:    0
> Feb 26 23:24:35 space kernel: EIP:    0010:[link_path_walk+1703/2048]    Not
> tainted
> Feb 26 23:24:35 space kernel: EIP:    0010:[<c013e457>]    Not tainted
> Feb 26 23:24:35 space kernel: EFLAGS: 00010282
> Feb 26 23:24:35 space kernel: eax: 802aec80   ebx: ddebbf64   ecx: 00000000
> edx: 00000000
> Feb 26 23:24:35 space kernel: esi: c8880dc0   edi: ddebbf9c   ebp: c8877820
> esp: ddebbf38
> Feb 26 23:24:35 space kernel: ds: 0018   es: 0018   ss: 0018
> Feb 26 23:24:35 space kernel: Process smbd (pid: 2856, stackpage=ddebb000)
> Feb 26 23:24:35 space kernel: Stack: 00000009 dafc302d c8880dc0 08208000
> 00000077 00000077 00001000 fffffff4
> Feb 26 23:24:35 space kernel:        dafc3000 08199680 c013d89e dafc300f
> 0000001e 6ea99c29 ddeba000 00000000
> Feb 26 23:24:35 space kernel:        dafc3000 ddebbf9c 00000009 c013ea23
> ddeba000 081f9bd0 bfffea80 bfffe208
> Feb 26 23:24:35 space kernel: Call Trace: [getname+94/160]
> [__user_walk+51/80] [sys_stat64+20/112] [error_code+52/60]
> [system_call+51/56]
> Feb 26 23:24:35 space kernel: Call Trace: [<c013d89e>] [<c013ea23>]
> [<c013b504>] [<c010721c>] [<c010712b>]
> Feb 26 23:24:35 space kernel:
> Feb 26 23:24:35 space kernel: Code: 8b 50 28 85 d2 0f 84 8e 00 00 00 bb 00
> e0 ff ff 21 e3 8b 93
> Feb 26 23:25:42 space atd: atd shutdown succeeded
> Feb 26 23:25:42 space Font Server[938]: terminating
> Feb 26 23:25:43 space xfs: xfs shutdown succeeded
> Feb 26 23:25:43 space rpc.mountd: Caught signal 15, un-registering and
> exiting.
> Feb 26 23:25:43 space nfs: rpc.mountd shutdown succeeded
> Feb 26 23:25:47 space kernel:  <4>nfsd: last server has exited
> Feb 26 23:25:47 space kernel: nfsd: unexporting all filesystems
> Feb 26 23:25:47 space nfs: nfsd shutdown succeeded
> Feb 26 23:25:47 space nfs: Shutting down NFS services:  succeeded
> Feb 26 23:25:47 space nfs: rpc.rquotad shutdown succeeded
> Feb 26 23:25:47 space sshd: sshd -TERM succeeded
> Feb 26 23:25:47 space sendmail: sendmail shutdown succeeded
> Feb 26 23:25:48 space smb: smbd shutdown succeeded
> Feb 26 23:25:48 space smb: nmbd shutdown succeeded
> Feb 26 23:25:48 space xinetd[829]: Exiting...
> Feb 26 23:25:48 space xinetd: xinetd shutdown succeeded
> Feb 26 23:25:48 space crond: crond shutdown succeeded
> Feb 26 23:25:48 space dd: 1+0 records in
> Feb 26 23:25:48 space dd: 1+0 records out
> Feb 26 23:25:48 space random: Saving random seed:  succeeded
> Feb 26 23:25:48 space rpc.statd[580]: Caught signal 15, un-registering and
> exiting.
> Feb 26 23:25:48 space nfslock: rpc.statd shutdown succeeded
> Feb 26 23:25:49 space portmap: portmap shutdown succeeded
> Feb 26 23:25:49 space kernel: Kernel logging (proc) stopped.
> Feb 26 23:25:49 space kernel: Kernel log daemon terminating.
> Feb 26 23:25:50 space syslog: klogd shutdown succeeded
> Feb 26 23:25:50 space exiting on signal 15
> 
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
