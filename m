Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1SBrmoH008957
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2009 06:53:48 -0500
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1SBrT2T028708
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2009 06:53:30 -0500
Received: by bwz4 with SMTP id 4so1537301bwz.3
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2009 03:53:29 -0800 (PST)
Date: Sat, 28 Feb 2009 13:53:24 +0200
From: Daniel Iliev <daniel.iliev@gmail.com>
Subject: Re: [linux-lvm] ext3 on lvm2 on raid10
Message-ID: <20090228135324.0070f24c@dhcp-143.ilievnet.com>
In-Reply-To: <49A7AEBB.3010109@redhat.com>
References: <20090227031359.63e57341@dhcp-143.ilievnet.com>
	<49A7AEBB.3010109@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Fri, 27 Feb 2009 10:13:31 +0100
Milan Broz <mbroz@redhat.com> wrote:

> Daniel Iliev wrote:
> > How is the raid10 chunk size related to LVM2 layout and how do
> > ext3's "stride" and "stripe-width" parameters depend on LVM2?
> > 

--snip--
> 
> Hi,
> 
> lvm2 since version 2.02.41 allows automatically align LV start
> according to underlying md device "chunk" size.
> 
> See this paramater in lvm.conf:
>     # By default, if a PV is placed directly upon an md device, LVM2
>     # will align its data blocks with the the chunk_size exposed in
> sysfs. # 1 enables; 0 disables.
>     md_chunk_alignment = 1
> 
> You should also set extent size as multiple of chunk size.
> 
> (The development code in CVS also allows set the alignment manually
> using parameter, so administrator can set the align value according
> to other types of underlaying devices - useful for hw raid, SSD, etc.)
> 
> Milan
> --
> mbroz@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


Thank you!

I need a little more clarification, though.

1) Does the "2 far copies" raid10 layout matter? I'd prefer it,
because my tests showed much better performance with it, but there was
no LVM


2) How about the ext3 params
I mean what if I create raid and LVM like this:

mdadm --create /dev/md1 --raid-devices=4 --level=10 --layout=f2 \
--bitmap=internal --chunk=1024 /dev/sd[a-d]2

pvcreate /dev/md1

lgcreate vg00 /dev/md1
 # ^^^ PE size would be 4MB by default, 4x chunksize in this case,
 right?

lvcreate -L100G -n home vg00
 # ^^^ should I use --stripes and --stripesize here?

mkfs.ext3 -E stride=X,stripe-width=Y /dev/lv00/home

Now what should X and Y be?

 stride:
 1024 [raid chunk in KBytes] * 1024 [bytes] / 4096 [ext3 block in Bytes]
 stride = 256

 stripe-width:
 256 [stride-size] * 2  [nr data disks] = 512
 stripe-width = 512

    OR

 4 [LVM PE in MBytes] * 1024*1024 [bytes] / 4096 [ext block in bytes] 
 stride = 1024

 stripe-width:
 1024 [stride-size] * 2  [nr data disks]
 stripe-width = 2048



-- 
Best regards,
Daniel
