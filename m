Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3TMxAlA024503
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 18:59:10 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3TMxAZi015726
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 18:59:10 -0400
Subject: Re: [linux-lvm] vgchange -ay Killed
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20060429222453.GC16180@agk.surrey.redhat.com>
References: <1146240603.23548.106.camel@localhost.localdomain>
	<01309aa0302de7b36b75ce2612b38706@redhat.com>
	<1146262242.23548.207.camel@localhost.localdomain>
	<445394B9.6040104@volved.com>
	<20060429222453.GC16180@agk.surrey.redhat.com>
Date: Sat, 29 Apr 2006 18:58:56 -0400
Message-Id: <1146351537.22360.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
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

On Sat, 2006-04-29 at 23:24 +0100, Alasdair G Kergon wrote:
> The code has not been optimised for large numbers of LVs.

guess so

> 
> Use the latest dm/lvm2 versions for a start as there's a memory
> leak in your libdevmapper.

ic. it come with centos 4.3

> 
> Each device device uses up a fixed amount of (unswappable) kernel 
> memory, and when all your memory is used out you can't have any 
> more devices.
> 
> Use standard diagnostic tools to work out which limit you're hitting.
> (top; ps; slabtop; sysreq; strace etc.)

that box has 2GB ram. and before lvm process is killed, top shows

top - 11:27:24 up 10 min,  4 users,  load average: 0.99, 0.71, 0.34
Tasks:  91 total,   1 running,  90 sleeping,   0 stopped,   0 zombie
Cpu(s): 18.7% us,  5.9% sy,  0.0% ni, 67.3% id,  8.0% wa,  0.0% hi,
0.0% si
Mem:   2055388k total,  2041136k used,    14252k free,      192k buffers
Swap:  4192956k total,     2304k used,  4190652k free,    58236k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 4550 root      18   0 1927m 1.9g  48m D 94.9 95.6   5:00.00 lvm

if that is kernel memory, why lvm shows a RES of 1.9GB?


> 
> Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
