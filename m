From: Andreas Dilger <adilger@turbolabs.com>
Date: Tue, 25 Sep 2001 11:24:11 -0600
Subject: Re: [linux-lvm] Cannot create LV beyond 16GB in size?
Message-ID: <20010925112411.F392@turbolinux.com>
References: <85063BBE668FD411944400D0B744267A8885C7@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A8885C7@AUSMAIL>
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

On Sep 25, 2001  12:01 -0500, Gonyou, Austin wrote:
> I've made 3 partitions. /dev/hdd1 /dev/hdd2 /dev/hdb9. 
> I'm going to stripe them and then use all available size. 
> When I do lvcreate, it won't let me go above 16G. Whats up with that?
> Kernel 2.4.10
> LVM 1.0 tools. 

You need to select a PE size larger than 4MB.  Also realize that striping
your LVs means all your data will be lost if one disk dies.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
