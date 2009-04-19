Received: from [10.32.10.40] (vpn-10-40.str.redhat.com [10.32.10.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n3J6rONW012647
	for <linux-lvm@redhat.com>; Sun, 19 Apr 2009 02:53:24 -0400
Message-ID: <49EACA64.8070006@redhat.com>
Date: Sun, 19 Apr 2009 08:53:24 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
In-Reply-To: <49EA534C.7090003@whgl.uni-frankfurt.de>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Sven Eschenberg wrote:
> I tried to create a PE+VG+LV ontop of a mdraid. For no obvious reason 
> the lvm volume show extremely poor performance - The transferrates are 
> as little as 30% of the rates on the md device itself.
> In contrast creating a partition table ontop of the array gives nearly 
> no performance impact.
> 
> Does anybody have the slightest idea, wht might be going wrong here?

> P.S.: I tried aligning the first PE in the VG with the mdraid chunk 
> size, no difference whatsoever.

How did you check that it is properly aligned?
The problem is mostly that data area start is misaligned with underlying
MD chunk size

Please can you paste output of
pvs -o +pe_start --unit b
and
cat /sys/block/<your_md_dev>/md/chunk_size

Please use at least lvm2 version 2.02.40 (see lvm version) for creating
VG - this version has automatic alignmnent option if running over MD
(see md_chunk_alignment in /etc/lvm.conf)

Also increasing readahead value can help (but only for simple linear
read operation). You can increase readahead persistenlty for LV
using (see man for lvchange -r ).

Milan
--
mbroz@redhat.com
