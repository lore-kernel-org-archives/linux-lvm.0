Message-ID: <3C0D12AD.5040603@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Docs on PC disk partition tables?
References: <B71796881E0DF7409F066FE6656BDF29040F32@BEASLEY.il.sangate.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Dec  4 12:10:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, mark@sangate.com

Mark,

The lilo and fdisk code, as painful as it is, pretty well documents the 
PC partition table interface and has source code for an MBR to boot 
typical partitions from a partition table.

I have heard "The  Undocumented PC" might contain this information as 
well, but I don't have that specific book.  Might check at a library.

Good luck!

Steven Dake
High Availability Engineering
MontaVista Software, Inc.

Mark Mokryn wrote:

>Does anyone know of docs describing the PC disk partition tables, MBR
>format, etc?
> 
>Thanks,
>-Mark
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
