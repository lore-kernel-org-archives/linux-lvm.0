Message-ID: <5524EDCE.20801@redhat.com>
Date: Wed, 08 Apr 2015 10:58:54 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <20150403185730.16103jv6yj064wsq@webmail.uniserve.com>
In-Reply-To: <20150403185730.16103jv6yj064wsq@webmail.uniserve.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] seems as if iy should be simple but I'm stuck
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, geek@uniserve.com

On 04/04/2015 03:57 AM, Dave Stevens wrote:
> I've recovered two drives from a failed raid-10 array and now have a
> working degraded array from which I'd like to retrieve data. After
> assembling the array I ran fdisk and saw an LVM setup, with VolGroup00.
> Running lvscan shows the xen virtual machine names and disk allocations
> as they should be. I almost never do anything with lvm so I thought I'd
> make a directory and mount the logical volume on it to check out the
> data. When I mount /dev/VolGroup00/lvname I am told I need to specify a
> filesystem type. But specifying either ext3 or lvms gives errors. I
> don't see what I need to do. Anyone?

Depends...

I am not sure if there is any data lost. Supposing there is it is better 
to work on copy of data.

If working on the same host you can snapshot the LVs, and work on the 
snapshot. As usually keep in mind snapshots are rather slow, and you 
should drop/merge them when done with recovery.

Or just dd the LVs to a file (use reasonable large bs, bs=4M makes 
sense, as 4M is the default LVM2 extent size), and move (or better copy) 
that around as you like.

If you want to peek inside the image and if the format is RAW, which I 
suppose it is, the logical volume is a whole disk image with a MBR and a 
partition table, kpartx is what you want.

-- Martian

>
> The idea is to move the xen virtual machine to another working
> centos-xen machine, start it and do data recovery. I can supply more
> details but don't know what is relevant.
>
> Dave
>
>
