Date: Sun, 7 Oct 2001 12:02:26 +0200
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] Removing direct access to gendisk_head
Message-ID: <20011007120226.A15080@caldera.de>
References: <20011006130147.C31614@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011006130147.C31614@lug-owl.de>; from jbglaw@lug-owl.de on Sat, Oct 06, 2001 at 01:01:47PM +0200
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

On Sat, Oct 06, 2001 at 01:01:47PM +0200, Jan-Benedict Glaw wrote:
> Hi!
> 
> I'm currently looking over kernel code (for cleaning-up purposes)
> and removed EXPORT_SYMBOL(gendisk_head) which was a no-no for
> current LVM kernel code. Please think about picking up this patch
> 
> 	- Named struct initializers
> 	- Removing direct use of gendisk_head
> 
> There's an open Q: Do we need to nullify ->real_devices and ->next?
> I don't think so (but I am unsure) so please remove these two lines
> upon your oppinion:-)

lvm_gendisk is in bss so it's ok to nullify it - see what I did to
the inkernel LVM :)

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
