Date: Mon, 3 Sep 2001 01:39:54 -0400
Subject: Re: [linux-lvm] LVM, defvs and initrd (for lvm rootfs)
Message-ID: <20010903013954.V3385@pc.ilinx>
References: <20010903000930.T3385@pc.ilinx> <002701c13436$3f5b2220$0b01a8c0@myplace.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002701c13436$3f5b2220$0b01a8c0@myplace.net>
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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

On Mon, Sep 03, 2001 at 07:06:53AM +0200, Bas wrote:
> Hi,
> 
> Run vgscan (without parameters) at the end of rc.sysinit.

Should have mentioned... I have tried this.  vgscan tries to create
the /dev/<volume group/* nodes (with mknod(2)) but it fails,
presumably because devfs[d] does not allow it (the node creation with
mknod(2))?  I have not looked much into devfs[d] yet.

b.

-- 
Brian J. Murrell
