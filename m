Date: Fri, 7 Sep 2001 14:24:05 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] disk swap
Message-ID: <20010907142405.C24173@colombina.comedia.it>
References: <Pine.LNX.4.33.0109061240350.10967-100000@jupiter.loonybin.net> <20010907131008.A30548@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010907131008.A30548@tiger.bigcats.invalid>; from weissel@netcologne.de on Fri, Sep 07, 2001 at 01:10:08PM +0200
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

On Fri, Sep 07, 2001 at 01:10:08PM +0200, Wolfgang Weisselberg wrote:
> Hi, Rob!
> 
> Rob Foehl (rwf@loonybin.net) wrote 29 lines:
> 
> > I'm assuming its possible to put swap on LVM, I may be wrong..
> 
> I have never tried making a swap partition on LVM. Ssince the
> kernel can and will strip over swap with equal priority and you
> want swap to be FAST, you should put it 'near the beginning'
> of (each?) disk, outside LVM or similar.

i am swapping over LVM with no noticeable problem
but then i don't swap much
i have 512Mb of RAM and 1GB swap
having swap on lvm has been essential when i moved from 128 to 512Mb of ram
this spring.

(i have set swap lv to be contigous anyway)
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
