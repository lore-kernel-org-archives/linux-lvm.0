Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TEk96q008730
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:46:09 -0400
Received: from vwclub.ro (lcx.at [213.239.193.148])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TEk8UK031869
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:46:08 -0400
Date: Thu, 29 Jun 2006 16:46:06 +0200
From: Cristian Livadaru <drac3@vwclub.ro>
Subject: Re: [linux-lvm] LVM incredible slow with Kernel 2.6.11
Message-ID: <20060629144606.GG20554@vwclub.ro>
References: <20060628092427.GI20554@vwclub.ro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060628092427.GI20554@vwclub.ro>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

me again ... isn't there anybody that could give ANY hint on what's
wrong?

I did some test with dd and the result is terrible!

LVM
explendidos:/shared# dd if=/dev/zero of=test1.dd bs=64 count=1000
1000+0 records in
1000+0 records out
64000 bytes transferred in 20.019969 seconds (3197 bytes/sec)

NOT LVM
dd if=/dev/zero of=test1.dd bs=64 count=1000
1000+0 records in
1000+0 records out
64000 bytes transferred in 0.004496 seconds (14234595 bytes/sec)

I am searching and searching but can't find anywhere any answer :(


On Wed, Jun 28, 2006 at 11:24:27AM +0200, Cristian Livadaru wrote:
> I have built yesterday a 2.6.11 kernel with Xen.
> I wanted to move some old data to my LVM and the speed according to
> midnight commander was about 350kb/s ! about 2gig where copied in 4
> hours! I then rebooted with the original Debian Kernel 2.4.27-2-386 and
> the speed incresead to about 5mb/s that doesn't make me very happy
> either but was way better then 350kb!
> I have been searching the net all night and didn't come up with a
> solution. I have no clue what is wrong here.
> What did I do wrong and how can I increase the performance?
> 
> The lvm is made out of 2x Seagate 300GB IDE HD not striped.
> 
> esplendidos:~# lvm lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/share/sharevg
>   VG Name                share
>   LV UUID                KdvcJ9-ZLMP-AJYA-soGK-qHfy-UtrX-PpV9Kv
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                558.91 GB
>   Current LE             143082
>   Segments               2
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:0
> 
> esplendidos:~# lvm dumpconfig
> devices {
>         dir="/dev"
>         scan="/dev"
>         filter="r|/dev/cdrom|"
>         cache="/etc/lvm/.cache"
>         write_cache_state=1
>         sysfs_scan=1
>         md_component_detection=0
> }
> activation {
>         missing_stripe_filler="/dev/ioerror"
>         mirror_region_size=512
>         reserved_stack=256
>         reserved_memory=8192
>         process_priority=-18
> }
> global {
>         umask=63
>         test=0
>         activation=1
>         proc="/proc"
>         locking_type=1
>         locking_dir="/var/lock/lvm"
> }
> shell {
>         history_size=100
> }
> backup {
>         backup=1
>         backup_dir="/etc/lvm/backup"
>         archive=1
>         archive_dir="/etc/lvm/archive"
>         retain_min=10
>         retain_days=30
> }
> log {
>         verbose=0
>         syslog=1
>         overwrite=0
>         level=0
>         indent=1
>         command_names=0
>         prefix="  "
> }
> 
> any tip for performance tuning?
> 
> --
> Cristian Livadaru
> http://vwclub.ro/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
