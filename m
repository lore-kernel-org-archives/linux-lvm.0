From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
Message-ID: <20030312221320.GA15196@gw.silicide.dk>
References: <20030312195217.GC18876@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030312195217.GC18876@auctionwatch.com>
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
Date: Wed Mar 12 16:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 12, 2003 at 11:52:17AM -0800, Petro wrote:
> I've got a couple of brand new boxes I'm trying to get LVM set up
> properly on. 
> 
> These machines have 6 200GiB drives attached to a 3ware controller card,
> for a total of 1,200,000,000,000 bytes of storage. 

later down you write you need speed. In that case i would suggest
ditching the hardware raid, and use pure software raid, it is faster.
I dont mind 3ware, i have dome myself, but my benchmarking revealed
that software was faster.


> I'm running kernel 2.4.18, with LVM version 1.0.3, and the lvmtools
> version 1.0.1rc3-1 (long story, but upgrading is a path-of-last-resort).

if you need snapshots, get 1.0.7

 
> Initially I had the drives set up as a single raid0 device, but doing a
> pvcreate on it failed with a message that said something about "can't
> get size". 

strange, linux should be able to handle 2T block devices.


> So I set up 2 3 disk RAID0 devices, and did a vgcreate /dev/sda /dev/sdb.
> 
> Now, one question I have is: 
> 
>     Does this concatenate the devices, or does it interleave the
>     devices? IE do I have a stripe of stripes, or two stripes? 

that depends. You can stripe the lvm, but then you cant resize it.
if you made a LV, then it would proberly just allokate all on one
"disk", aka sda, and then on sdb.


> Since I need the disk write rate of all 6 drives, I'm *REALLY* hoping
> that it's interleaved. 

sorry... it is not interleaved.



JonB
ps: how big a partition do you need stripping for? Do you need the
advanced LVM stuff, like resize, snapshot...
