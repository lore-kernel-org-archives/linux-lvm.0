Message-Id: <OF8D931057.C81A9527-ON86256B6F.0052D789@raleigh.ibm.com >
From: "James T West" <westj@us.ibm.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Problems running with LVM on RedHat 7.2
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
Date: Fri Mar  1 09:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In RedHat 7.2, the /etc/rc.d/rc.sysinit file was modified from previous
RedHat distributions.   In the RedHat 7.2 /etc/rc.d/rc.sysinit,  after
checking
for /proc/lvm and /etc/lvmtab, "rc.sysinit" now calls BOTH "vgscan" and
"vgchange".   In previous distributions of RedHat, ONLY "vgchange" was
executed to activate volume groups specified in /etc/lvmtab.

The problem with running "vgscan" with every boot, is "vgscan" first
destroys /etc/lvmtab and all the files in /etc/lvmtab.d.   These are very
important files containing your LVM Volume Group description.  These files
were probably "good" files when your system was shutdown.   If "vgscan"
runs into any problem while running, it will fail to recreate these files,
and you will not be able to access your volume groups without first
restoring these files.

In my view "vgscan" should only be run manually, and should not be run
automatically on every boot.  Running "vgscan" on every boot is not
necessary,
and can potentially cause serious problems.

Jim West
----- Forwarded by James T West/Austin/IBM on 03/01/2002 09:04 AM -----
                                                                                                                                        
                      linux-lvm-request@                                                                                                
                      sistina.com               To:       linux-lvm@sistina.com                                                         
                      Sent by:                  cc:                                                                                     
                      linux-lvm-admin@si        Subject:  linux-lvm digest, Vol 1 #536 - 10 msgs                                        
                      stina.com                                                                                                         
                                                                                                                                        
                                                                                                                                        
                      03/01/2002 04:00                                                                                                  
                      AM                                                                                                                
                      Please respond to                                                                                                 
                      linux-lvm                                                                                                         
                                                                                                                                        
                                                                                                                                        



Send linux-lvm mailing list submissions to
             linux-lvm@sistina.com

To subscribe or unsubscribe via the World Wide Web, visit
             http://lists.sistina.com/mailman/listinfo/linux-lvm
or, via email, send a message with subject or body 'help' to
             linux-lvm-request@sistina.com

You can reach the person managing the list at
             linux-lvm-admin@sistina.com

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-lvm digest..."


Today's Topics:

   1. Trouble running LVM under Redhat 7.2? (Aslak Sommerfelt Skretting)
   2. LVM1.0.3 tools on a kernel with LVM1.0.1-rc4? (Turbo Fredriksson)
   3. Re: Cluster LVM (Joe Thornber)
   4. Re: Cluster LVM (Prashant Kharche)
   5. Re: Cluster LVM (Joe Thornber)
   6. Re: Cluster LVM (Prashant Kharche)
   7. Re: Cluster LVM (Remco Post)
   8. Re: Cluster LVM (Joe Thornber)
   9. Re: LVM1.0.3 tools on a kernel with LVM1.0.1-rc4? (Heinz J .
Mauelshagen)
  10. Re: filesystem corruption... (Heinz J . Mauelshagen)

--__--__--

Message: 1
From: "Aslak Sommerfelt Skretting" <aslak@skretting.org>
To: <linux-lvm@sistina.com>
Date: Thu, 28 Feb 2002 12:21:49 -0800
Subject: [linux-lvm] Trouble running LVM under Redhat 7.2?
Reply-To: linux-lvm@sistina.com

Hello everyone.

Does anyone know of any problems that might occur when running LVM under
Redhat 7.2?

This is my lvm setup, on two 120gb disks and two 100gb disks.

root@space.uNF.no:/space# vgdisplay -v storage
--- Volume group ---
VG Name               storage
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               1
MAX LV Size           2 TB
Max PV                255
Cur PV                4
Act PV                4
VG Size               406.41 GB
PE Size               32 MB
Total PE              13005
Alloc PE / Size       13005 / 406.41 GB
Free  PE / Size       0 / 0
VG UUID               0Vf6Xc-j0GQ-y068-OF8a-mF1e-9jDT-yKL6ny

--- Logical volume ---
LV Name                /dev/storage/space
VG Name                storage
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                406.41 GB
Current LE             13005
Allocated LE           13005
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/hde1 (4)
PV Status             available / allocatable
Total PE / Free PE    2980 / 0

PV Name (#)           /dev/hdc1 (2)
PV Status             available / allocatable
Total PE / Free PE    3576 / 0

PV Name (#)           /dev/hdd1 (3)
PV Status             available / allocatable
Total PE / Free PE    2980 / 0

PV Name (#)           /dev/hdb3 (1)
PV Status             available / allocatable
Total PE / Free PE    3469 / 0


I am able to both install, and setup lvm without any trouble at all, but it
seems the system gets really unstable. I have tried using both the Redhat
2.4.7-10 kernel (the one redhat 7.2 ships with, and the 2.4.17 kernel. I
have also tried using both lvm 1.0.2 and 1.0.3.

When reinstalling, i first export the lvm setup, do the system reinstall,
install lvm, compile new kernel, then when it is up and running, i import
the lvm setup from the other disks. All this seems to be running fine.

But when running normally, the system seems to get itself into a lot of
'Kernel Oops' problems. I have never seen these before, but now i get them
all the time. They either cause pretty much every application i try to run
after the Oops to segfault, or they simply freeze the system. When it gets
back up, and the system needs to be fsck'ed i also experience a lot of
problems getting fsck to run properly. when running fsck /dev/hda1 (which
is
a normal ext2 partition, not lvm) i will get the same Kernel oops, and fsck
will fail. I will eventually get the system back up and running normally,
but it takes time. Other commands that i have seen give the same kernel
oops
are umount, fsck, proftpd and smbd... I found two examples of this Kernel
Oops code in /var/log/messages, and have included them below, if anyone is
able to gather any information from them.


Any input as to why the system is so unstable would be highly appreciated.
Does the system dislike that i set the PE size to 32? Are there any
problems
caused by running lvm under Redhat 7.2? (If so, I could go back to 7.1)


Kind Regards
Aslak Sommerfelt Skretting


Included:

/var/log/messages:


Feb 26 02:34:32 space sshd(pam_unix)[1217]: session closed for user tek
Feb 26 04:02:03 space syslogd 1.4.1: restart.
Feb 26 19:03:36 space sshd(pam_unix)[2639]: session opened for user tek by
(uid=0)
Feb 26 19:03:39 space su(pam_unix)[2680]: session opened for user root by
tek(uid=500)
Feb 26 19:11:49 space proftpd[2751]: space.uNF.no - ProFTPD terminating
(signal 11)
Feb 26 19:11:49 space proftpd[2751]: space.uNF.no - ProFTPD 1.2.4
standalone
mode SHUTDOWN
Feb 26 20:14:49 space su(pam_unix)[2680]: session closed for user root
Feb 26 20:14:50 space sshd(pam_unix)[2639]: session closed for user tek
Feb 26 23:24:21 space kernel: Unable to handle kernel paging request at
virtual address 802aeca8
Feb 26 23:24:21 space kernel:  printing eip:
Feb 26 23:24:21 space kernel: c013e457
Feb 26 23:24:21 space kernel: *pde = 00000000
Feb 26 23:24:21 space kernel: Oops: 0000
Feb 26 23:24:21 space kernel: CPU:    0
Feb 26 23:24:21 space kernel: EIP:    0010:[link_path_walk+1703/2048]
Not
tainted
Feb 26 23:24:21 space kernel: EIP:    0010:[<c013e457>]    Not tainted
Feb 26 23:24:21 space kernel: EFLAGS: 00010282
Feb 26 23:24:21 space kernel: eax: 802aec80   ebx: ddebbf64   ecx: 00000000
edx: c262c1b8
Feb 26 23:24:21 space kernel: esi: c8880dc0   edi: ddebbf9c   ebp: c8877820
esp: ddebbf38
Feb 26 23:24:21 space kernel: ds: 0018   es: 0018   ss: 0018
Feb 26 23:24:21 space kernel: Process smbd (pid: 2844, stackpage=ddebb000)
Feb 26 23:24:21 space kernel: Stack: 00000009 c2a7802d c8880dc0 00000000
00000000 c8880e40 00001000 fffffff4
Feb 26 23:24:21 space kernel:        c2a78000 08199680 c013d89e c2a7800f
0000001e 6ea99c29 ddeba000 00000000
Feb 26 23:24:21 space kernel:        c2a78000 ddebbf9c 00000009 c013ea23
ddeba000 081f9bc8 bfffea80 bfffe208
Feb 26 23:24:21 space kernel: Call Trace: [getname+94/160]
[__user_walk+51/80] [sys_stat64+20/112]
[error_code+52/60][system_call+51/56]
Feb 26 23:24:21 space kernel: Call Trace: [<c013d89e>] [<c013ea23>]
[<c013b504>] [<c010721c>] [<c010712b>]
Feb 26 23:24:21 space kernel:
Feb 26 23:24:21 space kernel: Code: 8b 50 28 85 d2 0f 84 8e 00 00 00 bb 00
e0 ff ff 21 e3 8b 93
Feb 26 23:24:35 space kernel:  <1>Unable to handle kernel paging request at
virtual address 802aeca8
Feb 26 23:24:35 space kernel:  printing eip:
Feb 26 23:24:35 space kernel: c013e457
Feb 26 23:24:35 space kernel: *pde = 00000000
Feb 26 23:24:35 space kernel: Oops: 0000
Feb 26 23:24:35 space kernel: CPU:    0
Feb 26 23:24:35 space kernel: EIP:    0010:[link_path_walk+1703/2048]
Not
tainted
Feb 26 23:24:35 space kernel: EIP:    0010:[<c013e457>]    Not tainted
Feb 26 23:24:35 space kernel: EFLAGS: 00010282
Feb 26 23:24:35 space kernel: eax: 802aec80   ebx: ddebbf64   ecx: 00000000
edx: 00000000
Feb 26 23:24:35 space kernel: esi: c8880dc0   edi: ddebbf9c   ebp: c8877820
esp: ddebbf38
Feb 26 23:24:35 space kernel: ds: 0018   es: 0018   ss: 0018
Feb 26 23:24:35 space kernel: Process smbd (pid: 2856, stackpage=ddebb000)
Feb 26 23:24:35 space kernel: Stack: 00000009 dafc302d c8880dc0 08208000
00000077 00000077 00001000 fffffff4
Feb 26 23:24:35 space kernel:        dafc3000 08199680 c013d89e dafc300f
0000001e 6ea99c29 ddeba000 00000000
Feb 26 23:24:35 space kernel:        dafc3000 ddebbf9c 00000009 c013ea23
ddeba000 081f9bd0 bfffea80 bfffe208
Feb 26 23:24:35 space kernel: Call Trace: [getname+94/160]
[__user_walk+51/80] [sys_stat64+20/112] [error_code+52/60]
[system_call+51/56]
Feb 26 23:24:35 space kernel: Call Trace: [<c013d89e>] [<c013ea23>]
[<c013b504>] [<c010721c>] [<c010712b>]
Feb 26 23:24:35 space kernel:
Feb 26 23:24:35 space kernel: Code: 8b 50 28 85 d2 0f 84 8e 00 00 00 bb 00
e0 ff ff 21 e3 8b 93
Feb 26 23:25:42 space atd: atd shutdown succeeded
Feb 26 23:25:42 space Font Server[938]: terminating
Feb 26 23:25:43 space xfs: xfs shutdown succeeded
Feb 26 23:25:43 space rpc.mountd: Caught signal 15, un-registering and
exiting.
Feb 26 23:25:43 space nfs: rpc.mountd shutdown succeeded
Feb 26 23:25:47 space kernel:  <4>nfsd: last server has exited
Feb 26 23:25:47 space kernel: nfsd: unexporting all filesystems
Feb 26 23:25:47 space nfs: nfsd shutdown succeeded
Feb 26 23:25:47 space nfs: Shutting down NFS services:  succeeded
Feb 26 23:25:47 space nfs: rpc.rquotad shutdown succeeded
Feb 26 23:25:47 space sshd: sshd -TERM succeeded
Feb 26 23:25:47 space sendmail: sendmail shutdown succeeded
Feb 26 23:25:48 space smb: smbd shutdown succeeded
Feb 26 23:25:48 space smb: nmbd shutdown succeeded
Feb 26 23:25:48 space xinetd[829]: Exiting...
Feb 26 23:25:48 space xinetd: xinetd shutdown succeeded
Feb 26 23:25:48 space crond: crond shutdown succeeded
Feb 26 23:25:48 space dd: 1+0 records in
Feb 26 23:25:48 space dd: 1+0 records out
Feb 26 23:25:48 space random: Saving random seed:  succeeded
Feb 26 23:25:48 space rpc.statd[580]: Caught signal 15, un-registering and
exiting.
Feb 26 23:25:48 space nfslock: rpc.statd shutdown succeeded
Feb 26 23:25:49 space portmap: portmap shutdown succeeded
Feb 26 23:25:49 space kernel: Kernel logging (proc) stopped.
Feb 26 23:25:49 space kernel: Kernel log daemon terminating.
Feb 26 23:25:50 space syslog: klogd shutdown succeeded
Feb 26 23:25:50 space exiting on signal 15









--__--__--

Message: 2
To: linux-lvm@sistina.com
From: Turbo Fredriksson <turbo@bayour.com>
Organization: Bah!
Date: 28 Feb 2002 12:22:51 +0100
Subject: [linux-lvm] LVM1.0.3 tools on a kernel with LVM1.0.1-rc4?
Reply-To: linux-lvm@sistina.com

Is this possible?

cracking $400 million in gold bullion Noriega president supercomputer
Cocaine PLO fissionable ammonium ammunition spy class struggle Rule
Psix South Africa Panama
[See http://www.aclu.org/echelonwatch/index.html for more about this]


--__--__--

Message: 3
Date: Thu, 28 Feb 2002 11:30:40 +0000
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Cluster LVM
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Reply-To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 02:59:51AM -0800, Prashant Kharche wrote:
> When tools are run they run with a lock
> and and at that time the filesystem cannot access the
> volume groups.

How are you preventing remote nodes from accessing the volume groups ?
Or are you working on an 'offline' solution, where there can be no
users of logical volumes while you resize them ?

- Joe


--__--__--

Message: 4
Date: Thu, 28 Feb 2002 05:03:37 -0800 (PST)
From: Prashant Kharche <pdkharche@yahoo.com>
Subject: Re: [linux-lvm] Cluster LVM
To: linux-lvm@sistina.com
Reply-To: linux-lvm@sistina.com


  Basically, we are putting a lock on the VG while it
is getting resized or for any tool which tries to
access VG .. So that no other user can access the
metadata of that VG..
WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
METADATA..
We thought of protecting VG DATA (NOT METADATA), but
it becomes very completed.. so as if now we are not
taking care of FS access..
--- Joe Thornber <joe@fib011235813.fsnet.co.uk> wrote:
> On Thu, Feb 28, 2002 at 02:59:51AM -0800, Prashant
> Kharche wrote:
> > When tools are run they run with a lock
> > and and at that time the filesystem cannot access
> the
> > volume groups.
>
> How are you preventing remote nodes from accessing
> the volume groups ?
> Or are you working on an 'offline' solution, where
> there can be no
> users of logical volumes while you resize them ?
>
> - Joe
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

__________________________________________________
Do You Yahoo!?
Yahoo! Greetings - Send FREE e-cards for every occasion!
http://greetings.yahoo.com


--__--__--

Message: 5
Date: Thu, 28 Feb 2002 14:32:17 +0000
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Cluster LVM
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Reply-To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 05:03:37AM -0800, Prashant Kharche wrote:
>
>   Basically, we are putting a lock on the VG while it
> is getting resized or for any tool which tries to
> access VG .. So that no other user can access the
> metadata of that VG..
> WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
> METADATA..
> We thought of protecting VG DATA (NOT METADATA), but
> it becomes very completed.. so as if now we are not
> taking care of FS access..

You need to take care that the volume groups running on all nodes
*always* reflect the metadata on disk.

For instance, if have two nodes running vg0/lvol0, and I issue a
pvmove from node1, when does node2 find out that the mapping has
changed ?

- Joe


--__--__--

Message: 6
Date: Thu, 28 Feb 2002 07:06:58 -0800 (PST)
From: Prashant Kharche <pdkharche@yahoo.com>
Subject: Re: [linux-lvm] Cluster LVM
To: linux-lvm@sistina.com
Reply-To: linux-lvm@sistina.com


--- Joe Thornber <joe@fib011235813.fsnet.co.uk> wrote:
> On Thu, Feb 28, 2002 at 05:03:37AM -0800, Prashant
> Kharche wrote:
> >
> >   Basically, we are putting a lock on the VG while
> it
> > is getting resized or for any tool which tries to
> > access VG .. So that no other user can access the
> > metadata of that VG..
> > WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
> > METADATA..
> > We thought of protecting VG DATA (NOT METADATA),
> but
> > it becomes very completed.. so as if now we are
> not
> > taking care of FS access..
>
> You need to take care that the volume groups running
> on all nodes
> *always* reflect the metadata on disk.
>
> For instance, if have two nodes running vg0/lvol0,
> and I issue a
> pvmove from node1, when does node2 find out that the
> mapping has
> changed ?
>
> - Joe
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html

when node1 issues a command pvmove, LOCK MANAGER will
block all the nodes from accessing the METADATA for
that VG and as soon as it finishes updating the
METADATA, pvmove itself writes the updated kernel VGDA
on the DISK.. so for this period, METADATA consistency
is maintained.

__________________________________________________
Do You Yahoo!?
Yahoo! Greetings - Send FREE e-cards for every occasion!
http://greetings.yahoo.com


--__--__--

Message: 7
From: Remco Post <r.post@sara.nl>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Cluster LVM
Date: Thu, 28 Feb 2002 16:43:25 +0100
Reply-To: linux-lvm@sistina.com

>
> --- Joe Thornber <joe@fib011235813.fsnet.co.uk> wrote:
> > On Thu, Feb 28, 2002 at 05:03:37AM -0800, Prashant
> > Kharche wrote:
> > >
> > >   Basically, we are putting a lock on the VG while
> > it
> > > is getting resized or for any tool which tries to
> > > access VG .. So that no other user can access the
> > > metadata of that VG..
> > > WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
> > > METADATA..
> > > We thought of protecting VG DATA (NOT METADATA),
> > but
> > > it becomes very completed.. so as if now we are
> > not
> > > taking care of FS access..
> >
> > You need to take care that the volume groups running
> > on all nodes
> > *always* reflect the metadata on disk.
> >
> > For instance, if have two nodes running vg0/lvol0,
> > and I issue a
> > pvmove from node1, when does node2 find out that the
> > mapping has
> > changed ?
> >
> > - Joe
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html
>
> when node1 issues a command pvmove, LOCK MANAGER will
> block all the nodes from accessing the METADATA for
> that VG and as soon as it finishes updating the
> METADATA, pvmove itself writes the updated kernel VGDA
> on the DISK.. so for this period, METADATA consistency
> is maintained.
>

During the pv move, not only needs the metadata be protected, but also the
fs
data,eg. when one server is moving a data block from one disk tot the
other,
all other servers must be notified that that block is currently
inaccessable,
so no fs data will get lost during transaction, or am I missing something
here?


--
Met vriendelijke groeten,

Remco Post

SARA - Stichting Academisch Rekencentrum Amsterdam
High Performance Computing  Tel. +31 20 592 8008    Fax. +31 20 668 3167

"I really didn't foresee the Internet. But then, neither did the computer
industry. Not that that tells us very much of course - the computer
industry
didn't even foresee that the century was going to end." -- Douglas Adams




--__--__--

Message: 8
Date: Thu, 28 Feb 2002 18:00:21 +0000
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Cluster LVM
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Reply-To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 07:06:58AM -0800, Prashant Kharche wrote:
> when node1 issues a command pvmove, LOCK MANAGER will
> block all the nodes from accessing the METADATA for
> that VG and as soon as it finishes updating the
> METADATA, pvmove itself writes the updated kernel VGDA
> on the DISK.. so for this period, METADATA consistency
> is maintained.

This is not enough, you will end up with a trashed system since node2
will still be writing data to the wrong place.  I think you should
consider only doing offline operations.  ie, acquiring the lock should
fail if any other nodes have activated the vg.

If you really insist on doing live operations I suggest you look at
the device-mapper driver (LVM2), which contains the suspend
functionality that you will need.

- Joe


--__--__--

Message: 9
Date: Fri, 1 Mar 2002 10:49:24 +0100
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM1.0.3 tools on a kernel with LVM1.0.1-rc4?
Reply-To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 12:22:51PM +0100, Turbo Fredriksson wrote:
> Is this possible?

Yes.

>
> cracking $400 million in gold bullion Noriega president supercomputer
> Cocaine PLO fissionable ammonium ammunition spy class struggle Rule
> Psix South Africa Panama

Was that English?

> [See http://www.aclu.org/echelonwatch/index.html for more about this]
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--

Regards,
Heinz    -- The LVM Guy --

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



--__--__--

Message: 10
Date: Fri, 1 Mar 2002 10:58:59 +0100
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] filesystem corruption...
Reply-To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 10:07:03AM +0100, Anders Widman wrote:
>
> > On Thu, Feb 28, 2002 at 09:35:53AM +0100, Anders Widman wrote:
> >>
> >> >> On Wednesday, February 27, 2002 04:42:28 PM -0700 Andreas Dilger
<adilger@clusterfs.com> wrote:
> >>
> >> >>> On Feb 27, 2002  23:36 +0100, Anders Widman wrote:
> >> >>>> Unfortunatley, something went seriously wrong. I can't mount the
disk
> >> >>>> any more, or use reiserfsck. They (mount/reiserfsck) say there
isn't
> >> >>>> a valid filesystem on the device. Vgscan does however find all
devices
> >> >>>> and can activate the volume group, but reiserfsck doesn't work.
> >> >>>>
> >> >>>> What should I do to be able to save a s much data as possible?
> >> >>>
> >> >>> dd if=/dev/vg/lv of=/new/disk conv=sync,noerror
> >>
> >> >> Then we should be able to use debugreiserfs and reiserfsck to
> >> >> find a copy of the super in the log, or just recreate it.
> >>
> >> >> -chris
> >>
> >> > So. How much space would this require on the 'new' disk? The same
> >> > amount as the entire LV? If that is, it would be impossible (for me,
> >> > economically) to do this.
> >>
> >> > The disk with bad blocks is 80GB, and I have a "spare" 80GB disk,
but
> >> > not more.
> >>
> >> > //Anders
> >>
> >> Oh, I forgot to ask how I can recover the filsystem
> >> header/suprtblock.. What exactly is "dd if=/dev/vg/lv of=/new/disk
> >> conv=sync,noerror" doing to the data, except copying it to the new
> >> device?
>
> > It copies all it can read to another sane device so that youe don't
loose
> > more data if your drive turns worse.
>
> > After that, you want to use "reiserfsck --rebuild-sb /dev/vg/lv".
>
> Ok. Unfortunatley, I can't get enough storage to copy all data. Would
> it be possible to just copy the data from the broken disk to a new,

So /dev/vg/lv is bigger than that disk?

> identical disk (I have a "spare" disk of the same model), and then
> rebuild the filsystem?

Well, then pvcreate the spare disk, add it to your VG and
"pvmove -i /dev/BrokenDisk /dev/SaneDisk" data over.

You need to have recent LVM 1.0.3 tools in order to use the -i option of
pvmove, which ignores read errors and you need to patch liblvm.h with the
following one to make pvmove work correctly.

After that repair the filesystem in /dev/vg/lv.

diff -u -B -r1.43 -r1.44
--- LVM/tools/lib/liblvm.h      18 Feb 2002 16:37:18 -0000      1.43
+++ LVM/tools/lib/liblvm.h      20 Feb 2002 10:49:14 -0000      1.44
@@ -93,10 +93,10 @@
 #include <time.h>
 #include <limits.h>
 #ifdef _G_LSEEK64
-int lseek64 ( unsigned int, unsigned long long, unsigned int);
+loff_t lseek64 ( int, loff_t, int);
 #define llseek lseek64
 #else
-int llseek ( unsigned int, unsigned long long, unsigned int);
+loff_t llseek ( int, loff_t, int);
 #endif

 #include <sys/ioctl.h>
@@ -130,7 +130,7 @@
 #define        LVMTAB                  "/etc/lvmtab"   /* LVM table of VGs
*/
 #define        LVMTAB_DIR              "/etc/lvmtab.d" /* storage dir VG
data */
 #define        LVMTAB_MINSIZE   ( sizeof ( vg_t) + sizeof ( lv_t) + sizeof
( pv_t))
-#define        LVM_DEV                 "/dev/lvm"
+#define        LVM_DEV                 LVM_DIR_PREFIX "lvm"
 #define        VG_BACKUP_DIR           "/etc/lvmconf"
 #define        DISK_NAME_LEN           8
 #define        LV_MIN_NAME_LEN         5


>
> Thanks for your time!
>
> Regards,
> Anders
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--

Regards,
Heinz    -- The LVM Guy --

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




--__--__--

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm


End of linux-lvm Digest
