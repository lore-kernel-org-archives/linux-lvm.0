From: josv@osp.nl
Date: Thu, 6 Sep 2001 16:10:11 +0200
Subject: Re: [linux-lvm] Root on LV
Message-ID: <20010906161011.B10735@gatekeeper.osp.nl>
References: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu>; from dobos_s@IBCnet.hu on Thu, Sep 06, 2001 at 04:03:49PM +0200
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

vgscan and vgchange -a y *ARE* quite essential.
It is currently *not* possible to perform these two essential
commands in the kernel.

AFAIK that is...

++Jos

And thus it came to pass that dobos_s@IBCnet.hu wrote:
(on Thu, Sep 06, 2001 at 04:03:49PM +0200 to be exact)

> Hi!
> 
> I cannot understand something.
> My kernel has no modules.
> Why should I create an ext2 partition for holding an initrd which is not
> doing any essential things except vgscan and vgchange -ay ?
> Why cant these things built into the kernel?
> 
> Maybe I didnt understand something...
> 
> 
> Please CC to me, because I am not member on list...
> 
> Thanks
> 
> 
> Dobos Sandor
> IBCnet Hungary Ltd.
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Klingon coding rule #12: "Specifications are for the weak and timid!"
