Date: Wed, 26 Sep 2001 10:06:26 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Cannot create LV beyond 16GB in size?
Message-ID: <20010926100626.B532@tykepenguin.com>
References: <85063BBE668FD411944400D0B744267A8885C7@AUSMAIL> <20010925112411.F392@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010925112411.F392@turbolinux.com>; from adilger@turbolabs.com on Tue, Sep 25, 2001 at 11:24:11AM -0600
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

On Tue, Sep 25, 2001 at 11:24:11AM -0600, Andreas Dilger wrote:
> On Sep 25, 2001  12:01 -0500, Gonyou, Austin wrote:
> > I've made 3 partitions. /dev/hdd1 /dev/hdd2 /dev/hdb9. 
> > I'm going to stripe them and then use all available size. 
> > When I do lvcreate, it won't let me go above 16G. Whats up with that?
> > Kernel 2.4.10
> > LVM 1.0 tools. 
> 
> You need to select a PE size larger than 4MB.  Also realize that striping
> your LVs means all your data will be lost if one disk dies.

The 4Meg PEs limit the LV to 256G not 16. I regularly create 60G LVs with 4Meg
PE sizes. The 16Meg size is an odd cutoff.

What error are you getting from lvcreate ?

patrick
