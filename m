From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] ext2online fails
Message-ID: <20011212142941.E940@lynx.no>
References: <OFF0F6A876.96B3BE16-ON86256B13.005A4F63@TEXASMUTUAL.COM> <20011129095307.F29249@lynx.no> <m2itbkka3o.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2itbkka3o.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Thu, Dec 06, 2001 at 09:48:27AM +0100
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
Date: Wed Dec 12 15:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Urs Thuermann <urs@isnogud.escape.de>
Cc: linux-lvm@sistina.com

On Dec 06, 2001  09:48 +0100, Urs Thuermann wrote:
> Andreas Dilger <adilger@turbolabs.com> writes:
> > Unless you patched it yourself, I don't know of any kernels that include
> > this patch by default.  Finally with 2.5 here, it will go into the main
> > kernel.
> 
> Will it then also be able to reduce an ext2/3 filesystem while being
> mounted?

No, that is terribly difficult, so it will never be done.  Since that is
rarely a real requirement, offline resizing is the only solution.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
