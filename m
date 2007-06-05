Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l55Jv7SJ027831
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2007 15:57:14 -0400
Received: from mailbox.simutronics.com (mailbox.simutronics.com
	[209.16.217.35])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l55JtDDZ031238
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2007 15:55:13 -0400
Received: from e3demo (jim.simutronics.com [209.16.216.93])
	(authenticated bits=0)
	by mailbox.simutronics.com (8.13.7/8.13.7) with ESMTP id l55Jt7iU022110
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2007 14:55:07 -0500
From: "James Miller" <jimm@simutronics.com>
References: 
Date: Tue, 5 Jun 2007 14:55:07 -0500
Message-ID: <078001c7a7ab$6ae46e30$5dd810d1@e3demo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: 
Subject: [linux-lvm] SolvedLRE: CLVMD and Locking type 3 initialisation
	failed
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
To: linux-lvm@redhat.com



> -----Original Message-----
> From: James Miller 
> Sent: Tuesday, June 05, 2007 1:37 PM
> To: linux-lvm@redhat.com
> Subject: CLVMD and Locking type 3 initialisation failed
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


For Debian lvm2 you have to set the locking_type=2.  It's in the lvm2 source
debian/clvm.README.Debian 

However, now that I have ccsd, cman and clvmd happily running (I discovered
I had clvmd running ok when I could run LVM commands).  On both computers in
my cluster, I'm still not seeing the volume group of the other cluster
member.  And the status of my Clustser seems fine.  

Is there anything I'm missing or doing wrong?  I'm not running a SAN or
iSCSI.  The PVs for each server are partitions I've created from the HW
Raid.

The only anomaly I'm seeing is in /var/log/messages.  I am getting a kernel
cluster error for one of my nodes:
CMAN: WARNING no listener for port 11 on node seldon.  I don't know what the
error even means, since I thought traffic when over port 6809.

Anyway here's some info:
Server1	Server2
Hari		Seldon

LVM info:
PVs:
/dev/sda5	/devsda5
/dev/sda6	/devsda6
/dev/sda7	/devsda7
Volume Group Info:
hari-vg01	seldon-vg01


I guess I don't really understand how clvm work.



--Jim
