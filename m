Date: Tue, 4 Sep 2001 15:43:52 +0100
From: Ray Miller <ray.miller@computing-services.oxford.ac.uk>
Subject: Re: [linux-lvm] SoftRaid and LVM
Message-ID: <20010904154352.F5344@bench.oucs.ox.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF0178FD6F@mailsrv.linkvest.com>
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

On Tue, Sep 04, 2001 at 04:35:40PM +0200, Jean-Eric Cuendet wrote:
> 
> Hi,
> It seems that you use a fresh 2.4.9 kernel. In kernel 2.4.9, the version
> of LVM is 0.9.0-beta2, which is what you get with dmesg or cat /proc/lvm
> Then you installed tools from 1.0.1rc2. You must upgrade your kernel
> with LVM 1.0.1rc2 if you want all that to be consistent (or use beta2
> tools, which is not the good way IMHO).
> 
> Recompile 2.4.9 with LVM-1.0.1rc2 and you'll be OK.

I applied the 1.0.1-rc2 patch to a clean 2.4.9 kernel tree and was
able to create a logical volume on top of s/w RAID 1 without any
trouble. However, a bonnie++ run on an ext2 (or ext3) filesystem on
the logical volume caused the system to lock up, with kswapd going
uninterruptible. I suspect a VM (rather than LVM) problem, as a
similar lock-up occurred on another system with 2.4.8 kernel and no
LVM. We've reverted to kernel 2.4.7 on both systems and had no
problems since.

-- 
Ray Miller <ray.miller@oucs.ox.ac.uk>
Unix Systems Programmer
Oxford University Computing Services
