Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94JA4K8001241
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 15:10:04 -0400
Received: from filesrv1.idealcorp.com (66-192-27-146.static.twtelecom.net
	[66.192.27.146])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k94J9vjg002432
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 15:09:57 -0400
Received: from [192.168.1.18] (client08.idealcorp.com [192.168.1.18])
	by filesrv1.idealcorp.com (Postfix) with ESMTP id 05C28F6819C
	for <linux-lvm@redhat.com>; Wed,  4 Oct 2006 15:09:51 -0400 (EDT)
Message-ID: <4524071A.9000007@idealcorp.com>
Date: Wed, 04 Oct 2006 15:10:18 -0400
From: John Ward <jward@idealcorp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Avoiding disk changes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Question regarding disk changes for LVMs. Are there any known scenarios 
where the on disk information will change (automatically) after the 
device(s) are detected and probed by the system?

My scenario is, I want to plug my LVM drive(s) into a different machine 
(via external USB) for analysis. I want the drives to remain 100% 
unmodified.

I would like to setup my configuration such that no disk changes will 
occur.  Does anything within the LVM or DM realm modify the on-disk 
metadata under normal circumstances, or if a corrupted/broken LVM scheme 
is detected (partial or bad disk, etc.)?

In an attempt to gain absolute control over the detection and mounting 
process, I've set the global configuration file to test mode:

/etc/lvm/lvm.conf:
...
global {
...
	test = 1
...


After that, once I plug my device in, I set the LVM_SYSTEM_DIR env 
variable to point to my own configuration (because I don't want to 
twiddle with the system-wide one anymore than I have to).

I then use "vgchange --partial -a y" to access the new device, and 
create the /dev nodes.

In my custom lvm.conf (located in the $LVM_SYSTEM_DIR) I've set a few 
paranoid settings, including:

	filter = ... (only accept /dev/sd* devices)
	write_cache_state = 0
	backup = 0
	archive = 0
	locking_type = 0

	Setting test mode in this configuration wasn't allowing me to do the 
vgchange, so I left that off.

Hope this isn't too open ended of a question, short if diving into the 
source code, I've tried to research to what extent LVM might 
automatically twiddle bits on the drive.

Thanks in advance.
