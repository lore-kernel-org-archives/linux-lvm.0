Message-ID: <000d01c2c19f$f2d45e00$0201a8c0@kezar>
From: "Joseph Kezar" <jkezar@doc.state.vt.us>
References: <20030121213110.GT1685@zaurak.cedar.Buffalo.EDU>
Subject: Re: [linux-lvm] LVM on H/W RAID5s ?
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Jan 21 16:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: ajay@cedar.buffalo.edu

I've noted some high load issues with LVM on our RAID5 as well.  I thought
it might be a hardware compat issue.  But now I am leaning towards LVM/RAID5
performance issues.

Our server performs fine.  But when I need to rsync from the JBOD to the
local disks the load jumps anywhere between 10 and 20!.


----- Original Message -----
From: "Ajay Shekhawat" <ajay@cedar.buffalo.edu>
To: <linux-lvm@sistina.com>
Sent: Tuesday, January 21, 2003 4:31 PM
Subject: [linux-lvm] LVM on H/W RAID5s ?


> I'm trying to combine two H/W RAID5 arrays (6 disks each on a ICP-Vortex
> 8643RZN controller) into 1 device using LVM, with XFS as the filesystem.
> Unfortunately, I'm getting terrible read rates (I'm doing my own
benchmarking,
> with 1 process creating files of about 400K each, and another process
> reading and deleting the files). Just an 'ls' in a directory with
> 1000 files takes forever. A stat+unlink call in perl takes 1sec.
>
> Are there any 'gotchas' with this sort of a setup?
>
> The RAID5 partitions themselves work pretty OK by themselves.
>
> The hardware:
> - dual Xeon 2.0GHz w/ 2GB memory
> - ICP Vortex 8643RZN card
> - 73GB Fuji 10KRPM disks, 14 of them on a controller.
>
> Any tips, pointers, etc. would be appreciated.
>
> Ajay
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
