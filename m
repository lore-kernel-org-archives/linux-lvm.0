Return-Path: <Ron.Vissers@qtiworld.com>
Message-ID: <139803A793E0D311AFF60050DA2BC5400302109A@qtiexch1.qgraph.com>
From: "Vissers, Ron" <Ron.Vissers@qtiworld.com>
Subject: RE: [linux-lvm] debian 2.4.2 / LVM .91beta6 / pvcreate device doe
	sn't exist ???
Date: Mon, 9 Apr 2001 08:03:15 -0500 
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi,

Many Thanks for the reply!  Works now!

Slight neuron breakdown.  I had too many /dev/hdc's flying around and added
that "1" in there.

Ron

-----Original Message-----
From: Patrick Caulfield [mailto:caulfield@sistina.com]
Sent: Monday, April 09, 2001 3:42 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] debian 2.4.2 / LVM .91beta6 / pvcreate device
doesn't exist ???


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
type of hdc1 to 8e. Then LVM should recognise it. I am assuming here that
hdc1
is the partition you want to use for LVM.

Be careful with fdisk - you can do a lot of damage if you don't know what
you
are doing.

patrick

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm


------------------------------------------------------------------------

This message has been scanned for viruses with Trend Micro's Interscan VirusWall.
