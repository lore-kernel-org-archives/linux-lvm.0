From: Pantaleimon <pantaleimon@home.no>
Subject: Re: [linux-lvm] Accessing LVM partitions from a rescue system
References: <200211242207.33235.pantaleimon@home.no> <4117008562.20021125013930@tnonline.net>
In-Reply-To: <4117008562.20021125013930@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200211251003.39812.pantaleimon@home.no>
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
Date: Mon Nov 25 03:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Monday 25 November 2002 01:39, Anders Widman wrote:
> Looks  like  something  is wrong with accessing all of your disks from
> the rescue floppy.. look at the pvscan:
>
> From rescue environment:
>    pvscan -- total: 20 [201.08 GB}
>
> Normal boot:
>    pvscan -- total: 21 [211.14 GB]
>
> You  need  to  sort  out what disks/partitions that are not accessible
> from  the  rescue  disks...  You can also try ungrading LVM as 1.01 is
> quite old...
>
> - Anders

It looks like it is the hda16 partition that accounts for that difference. 
It's about 10G. Look at the lvmdiskscan listing in my normal envirnonment:

[...]
lvmdiskscan -- /dev/hda14 [      10.00 GB] Extended LVM partition [0x8E]
lvmdiskscan -- /dev/hda15 [      10.00 GB] Extended LVM partition [0x8E]
lvmdiskscan -- /dev/hda16 [      10.06 GB] USED LVM whole disk

Why does the line for hda16 say "USED LVM whole disk" and not "Extended LVM 
partition [0x8E]" like the others?
