From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] How to create a device mapper patch?
Message-ID: <20031023210927.GA2428@DUK2.13thfloor.at>
References: <200310231626.53632.wim@unetix.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200310231626.53632.wim@unetix.nl>
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
Date: Thu Oct 23 16:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wim@unetix.nl
Cc: linux-lvm@sistina.com

On Thu, Oct 23, 2003 at 04:26:53PM +0200, wim@unetix.nl wrote:
> Hello,
> 
> I tried to find out to make a patch for my kernel , 2.4.22,
> but there seems to be no documentation available how
> to generate a device mapper kernel patch. 
> From the INSTALL file:
> ---
> If your kernel does not already contain device-mapper, patch,
>    configure and build a new kernel with it
> ----
> Now this is nice , but doesn't explain how to generate a patch
> for the kernel. The patches directory only contains patches
> for 2.4.20 en 21 so, how do I generate a patch for 2.4.22?
> Device mapper is version 1.00.05

http://vserver.13thfloor.at/Stuff/patch-2.4.22-dm-1.00.05.diff.bz2

this is a rediffed version of the 2.4.21 patches:
	-mempool.patch
	-vcalloc.patch
	-o_direct.patch
	-b_private.patch
	-config.patch
	-devmapper.patch
	-makefile.patch
	-arch64.patch

released with the dm-1.00.05 tarball, nevertheless,
the version major/minor/pl is 4.0.4 whatever this means ...

HTH,
Herbert

> TIA
> 
> WB
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
