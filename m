Date: Thu, 4 Oct 2001 19:23:22 +0200
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] kernel 2.2.19 support
Message-ID: <20011004192322.A6376@caldera.de>
References: <3BBC4146.51CD437D@promofinarsa.es> <wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es> <wvzo771uju.fsf@freeze.oslo.dnmi.no> <3BBC535B.59D6A5CB@promofinarsa.es> <wv3d4zh1r8.fsf@freeze.oslo.dnmi.no> <20011004111023.C31061@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011004111023.C31061@turbolinux.com>; from adilger@turbolabs.com on Thu, Oct 04, 2001 at 11:10:23AM -0600
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

On Thu, Oct 04, 2001 at 11:10:23AM -0600, Andreas Dilger wrote:
> What you need to do to "properly" fix this is add a lines like
> 
> #if LINUX_VERSION_CODE > KERNEL_VERSION ( 2, 3, X)
> 	foo.de = bar;
> #endif
> 
> around the two offending code sections, and find the appropriate kernel version
> where this entry was added.  This can be done by looking at the kernel CVS:
>                 http://lxr.linux.no/
> 
> (best to start by checking if it is in 2.4.0, or a recent addition, and then
> going back through 2.3.X kernels).

devfs was added in 2.3.48
