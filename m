From: Ajay Shekhawat <ajay@cedar.buffalo.edu>
Message-ID: <20030121213110.GT1685@zaurak.cedar.Buffalo.EDU>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM on H/W RAID5s ?
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
Date: Tue Jan 21 15:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm trying to combine two H/W RAID5 arrays (6 disks each on a ICP-Vortex
8643RZN controller) into 1 device using LVM, with XFS as the filesystem.
Unfortunately, I'm getting terrible read rates (I'm doing my own benchmarking,
with 1 process creating files of about 400K each, and another process
reading and deleting the files). Just an 'ls' in a directory with 
1000 files takes forever. A stat+unlink call in perl takes 1sec.

Are there any 'gotchas' with this sort of a setup?

The RAID5 partitions themselves work pretty OK by themselves.

The hardware:
	- dual Xeon 2.0GHz w/ 2GB memory
	- ICP Vortex 8643RZN card
	- 73GB Fuji 10KRPM disks, 14 of them on a controller.

Any tips, pointers, etc. would be appreciated.

Ajay
