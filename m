From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <20011226105856.A20872@colombina.comedia.it>
References: <000001c18dc2$70deb560$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001c18dc2$70deb560$0b00a8c0@homelan.org>; from
    ben@bens-house.org.uk on Wed, Dec 26, 2001 at 04:04:38AM -0000
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
Date: Wed Dec 26 03:56:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 26, 2001 at 04:04:38AM -0000, Ben Holness wrote:
> Hi,
> I am having trouble getting my Mandrake 8.1 system to boot to a logical
> partition (LVM).
....
> /sbin/modprobe: error while loading shared libraries: libzso.1: cannot open
....
> I did a locate on "libzso.1", but it couldn't find it.
it is libz.so.1, used by modprobe to uncompress gzipped modules

anyway, could you try with lvm tools and the modified mkinitrd
found on http://www.comedia.it/bluca/lvm/

regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
