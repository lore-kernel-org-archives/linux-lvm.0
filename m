Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l55Iuhbt019056
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2007 14:56:44 -0400
Received: from mailbox.simutronics.com (mailbox.simutronics.com
	[209.16.217.35])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l55Itcu6005394
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2007 14:55:38 -0400
From: "James Miller" <jimm@simutronics.com>
References: <075801c7a7a0$7fbdce60$5dd810d1@e3demo>
Subject: Solved: RE: [linux-lvm] CLVMD and Locking type 3 initialisation failed
Date: Tue, 5 Jun 2007 13:55:32 -0500
Message-ID: <076c01c7a7a3$181a40b0$5dd810d1@e3demo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <075801c7a7a0$7fbdce60$5dd810d1@e3demo>
Reply-To: jimm@simutronics.com,
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
To: jimm@simutronics.com, 'LVM general discussion and development' <linux-lvm@redhat.com>

Sorry for the top posting!!!

For Debian lvm2 you have to set the locking_type=2.  It's in the lvm2 source
clvm.README.Debian.


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of James Miller
> Sent: Tuesday, June 05, 2007 1:37 PM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] CLVMD and Locking type 3 initialisation failed
> 
> Hello everyone,
> 
> I'm setting up a cluster and was hoping to get some insight 
> into trouble I'm having with running clvmd. My cluster seems 
> to be in a good state (2 nodes).
> I using Debian Etch, 2.6.18 kernel, and 
> redhat-cluster-modules for 2.6.18.
> 
> ---------------------------
> cman_tool status:
> Protocol version: 5.0.1
> Config version: 2
> Cluster name: alpha1
> Cluster ID: 6387
> Cluster Member: Yes
> Membership state: Cluster-Member
> Nodes: 2
> Expected_votes: 2
> Total_votes: 2
> Quorum: 2
> Active subsystems: 3
> Node name: hari
> Node ID: 1
> Node addresses: 209.16.216.121
> 
> -------------------------------
> cman_tool nodes:
> Node  Votes Exp Sts  Name
>    1    1    2   M   hari
>    2    1    2   M   seldon
> 
> ------------------------------
> cman_tool services:
> Service          Name                              GID LID 
> State     Code
> Fence Domain:    "default"                           1   2 run       -
> [1 2]
> 
> DLM Lock Space:  "clvmd"                             2   3 run       -
> [1 2]
> 
> ---------------------------------
> When I run vgchange -aly I get the following message:
> vgchange -aly
>   Unknown locking type requested.
>   Locking type 3 initialisation failed.
> 
> ---------------------------
> /etc/lvm/lvm.conf:
> #
> devices {
> 
> 	dir = "/dev"
> 	scan = [ "/dev" ]
> 	filter = [ "r|/dev/cdrom|" ]
> 	write_cache_state = 1
> 	sysfs_scan = 1
> 	md_component_detection = 1
> }
> 
> log {
>     verbose = 0
>     syslog = 1
>     overwrite = 0
>     level = 0
>     indent = 1
>     command_names = 0
>     prefix = "  "
> }
> 
> backup {
>     backup = 1
>     backup_dir = "/etc/lvm/backup"
>     archive = 1
>     archive_dir = "/etc/lvm/archive"
>     retain_min = 10
>     retain_days = 30
> }
> 
> shell {
>     history_size = 100
> }
> 
> global {
>     umask = 077
>     test = 0
>     activation = 1
>     proc = "/proc"
>     locking_dir = "/var/lock/lvm"
>     locking_library = "liblvm2clusterlock.so"
> # ***** I VERIFIED the locking_dir exists, the library_dir is 
> correct and the locking_library is in the right place
>     locking_type = 3
>     library_dir = "/lib/lvm2"
> }
> 
> activation {
>     missing_stripe_filler = "/dev/ioerror"
>     reserved_stack = 256
>     reserved_memory = 8192
>     process_priority = -18
>     mirror_region_size = 512
>     mirror_log_fault_policy = "allocate"
>     mirror_device_fault_policy = "remove"
> }
> 
> -------------------------------------
> Important output of lsmod:
> lsmod
> Module                  Size  Used by
> dm_snapshot            20664  0
> dm_mirror              25216  0
> dm_mod                 62800  2 dm_snapshot,dm_mirror
> lock_dlm               44644  0
> dlm                   123040  4 lock_dlm
> cman                  132800  15 lock_dlm,dlm
> lock_harness           10160  1 lock_dlm
> ----------------------------------
> 
> 
> Thank you in advance for your help
> 
> 
> --Jim
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
