Date: Tue, 6 Apr 2004 08:07:35 +0100
From: thornber@redhat.com
Message-ID: <20040406070735.GA25046@nimzo>
References: <20040405212919.GA12443@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040405212919.GA12443@osdl.org>
Subject: [linux-lvm] Re: LVM2 stripe performance
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Olien <dmo@osdl.org>
Cc: thornber@redhat.com, linux-lvm@redhat.com

On Mon, Apr 05, 2004 at 02:29:19PM -0700, Dave Olien wrote:
> 
> I'm running tiobench on an LVM2 striped logical volume.  I'm  comparing
> the LVM2 striping performance with a similar striping configuration
> using a hardware RAID controller.
> 
> With hardware RAID, I'm able to get about 66 megabytes per second on
> sequential writes, and 52 megabytes per second with random writes.
> 
> With LVM2, I can get only 23 megabytes per second with either random
> or sequential writes.
> 
> Read performance on LVM is about 10% less than with hardware RAID.
> e.g. with 48 threads, hardware RAID sequental reads are 105 megabytes
> per second, LVM2 RAID sequential reads are 95 megabytes per second.
> 
> This is using an ext2 file system, mounted with noatime.
> 
> I think I recall seeing email with similar problems to this on this
> mail list.  If I recall, the cause had to do with ordering of requests
> submitted to disk.
> 
> Has there been any work to address this?

Try the latest -mm kernel

- Joe
