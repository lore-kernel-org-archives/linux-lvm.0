From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Again (still?): File size limit exceeded
Message-Id: <20020116104338.C775@lynx.adilger.int>
References: <Pine.LNX.4.21.0201161424150.1030-100000@yaq.axel.ma>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0201161424150.1030-100000@yaq.axel.ma>;
    from hinrichs@bitscape.de on Wed, Jan 16, 2002 at 02:36:32PM +0100
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
Date: Wed Jan 16 11:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Axel Hinrichs <hinrichs@bitscape.de>
Cc: linux-lvm@sistina.com

On Jan 16, 2002  14:36 +0100, Axel Hinrichs wrote:
> I'm using Kernel 2.4.17, LVM 1.0.1 and everything was fine. The biggest
> used LV is 1.5GB and I used to have an 8GB standby LV (I was able to
> create and format without problems). Now I just deleted and recreated this
> 8GB LV and when I now try to format - reiserfs or ext2 - it I get the
> error "File size limit exceeded". I read the thread about this last month
> and checked my ulimits (even if they said this issue is fixed since
> 2.4.17-pre-something):
> 
> # ulimit -H -a
> core file size (blocks)     unlimited
> data seg size (kbytes)      unlimited
> file size (blocks)          unlimited
> max locked memory (kbytes)  unlimited
> max memory size (kbytes)    unlimited
> open files                  1024
> pipe size (512 bytes)       8
> stack size (kbytes)         unlimited
> cpu time (seconds)          unlimited
> max user processes          unlimited
> virtual memory (kbytes)     unlimited
> 
> Further tests leaded to the following: I'm able to format an 2GB
> LV, but 2GB+1PE gives the above error.
> 
> Does anyone know why and how to correct?

Kernel + libc bug.  You need to log in directly as root (no "su",
no "sudo") and you must not have any ulimits set.  Even if you try
to set your ulimit to "unlimited" (and even if it shows "unlimited")
it is really 2GB.

You can also upgrade to 2.4.18-pre2+ or glibc-2.2 to fix this.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
