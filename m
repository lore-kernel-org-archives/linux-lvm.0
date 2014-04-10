Message-ID: <5346A74E.3020502@redhat.com>
Date: Thu, 10 Apr 2014 16:14:38 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>
	<5342A6A9.6060104@redhat.com> <5345703E.2050401@ucdavis.edu>
	<5346A663.502@redhat.com>
In-Reply-To: <5346A663.502@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
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
To: Ryan Davis <rrdavis@ucdavis.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/10/2014 04:10 PM, Peter Rajnoha wrote:
> 3. then reduce the LV size by one extent (1 should be enough since the
>    PV is shorter with 3.44 MiB) *also* with resizing the filesystem
>    that's on the LV!!! (this is the "-f" option for the lvreduce, it's
>    very important!!!)
>    lvreduce -f -l -1 <the_LV_found_on_the_PV>
> 

!!!!
Sorry, I meant "-r" option instead of "-f"!!!
!!!!

The -f is the dangerous one - force!!!
The -r is the "resizefs"!!!


-- 
Peter
