From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm on initrd
Message-ID: <20040124095810.GA6204@percy.comedia.it>
References: <200401240137.35706.arekm@pld-linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200401240137.35706.arekm@pld-linux.org>
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
Date: Sat Jan 24 04:59:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 24, 2004 at 01:37:35AM +0100, Arkadiusz Miskiewicz wrote:
>Are there any plans to add makefile target which would produce very small + 
>features stripped down lvm binary with only two commands:
>vgscan vgchange
>for usage on initrd images?
patches for lvm2 are:
http://www.comedia.it/~bluca/cooker/lvm2/lvm2-2.00.08-7mdk/LVM2.2.00.08-diet.patch.bz2

patches for lvm1 are:
http://www.comedia.it/~bluca/cooker/lvm2/lvm1-1.0.8-2mdk/lvm-1.0.8-dietlibc.patch.bz2
http://www.comedia.it/~bluca/cooker/lvm2/lvm1-1.0.8-2mdk/lvm-1.0.8-wrapper.patch.bz2

NB1 the lvm1 patches come originally from redhat, but have been modified
NB2 the urls there might change slightly due to repackaging of rpms, so
if (404) backtrack();

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
