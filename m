Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 9 Apr 2001 09:41:47 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] debian 2.4.2 / LVM .91beta6 / pvcreate device doesn't exist ???
Message-ID: <20010409094147.C542@tykepenguin.com>
References: <139803A793E0D311AFF60050DA2BC54003021094@qtiexch1.qgraph.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <139803A793E0D311AFF60050DA2BC54003021094@qtiexch1.qgraph.com>; from Ron.Vissers@qtiworld.com on Sat, Apr 07, 2001 at 03:43:42PM -0500
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

On Sat, Apr 07, 2001 at 03:43:42PM -0500, Vissers, Ron wrote:
> ---
> 
> Disk /dev/hdc1: 255 heads, 63 sectors, 1826 cylinders
> Units = cylinders of 16065 * 512 bytes
>  
>      Device Boot    Start       End    Blocks   Id  System
> /dev/hdc1p1             1      1826  14667313+  8e  Unknown
> 
> -----
> 

You have partitioned a partition ! 

You should run fdisk on /dev/hdc rather than /dev/hdc1 and set the partition
type of hdc1 to 8e. Then LVM should recognise it. I am assuming here that hdc1
is the partition you want to use for LVM.

Be careful with fdisk - you can do a lot of damage if you don't know what you
are doing.

patrick
