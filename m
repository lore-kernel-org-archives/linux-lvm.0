Return-Path: <mbp@valinux.com>
Date: Tue, 3 Jul 2001 23:04:25 +1000
From: Martin Pool <mbp@valinux.com>
Subject: Re: [linux-lvm] Parted not making partitions
Message-ID: <20010703230424.K24350@valinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.A32.4.21.0107031806220.54566-100000@prlfs.prl.ernet.in>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On  3 Jul 2001, RAGHVENDRA SHUKLA <rshukla@prl.ernet.in> wrote:
> 
> Hello ,
>        My lINUX RED HAT 7.1 HAS THE disk partitions ( as given by parted
> -print ) are as follows :
> 
>     1 	0.031	23.532		ext2	boot
>     2	23.533	28623.625	extended
>     5   23.563	1357.053	logical	ext2
>     6 	28027.494	28529.494	logical	linux-swap
> 
> 
>     Now i know that there is space between the 1357.053 - 28027.494 ,
> ( as i have reduced this partition by myself and this is root )
> whenever i give the command --> mkpart primary ext2 1357.054 28027.493
> then it says that the partition overlaps . This is not clear to me .

The problem is that the space you refer to is within extended
partition 2 and therefore cannot be allocated to a primary partition.
You can, however, use this space for a new logical partition.  

If this remains unclear, you should search for a good explanation of
the crippled PC partitioning scheme.

-- 
Martin 
VA Linux Systems
