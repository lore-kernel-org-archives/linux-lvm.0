From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvmcreate_initrd: stripping shared library
Message-ID: <20020805201756.GA32591@colombina.comedia.it>
References: <OE254VHAYM9UuonbIMm0000e671@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OE254VHAYM9UuonbIMm0000e671@hotmail.com>
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
Date: Mon Aug  5 15:17:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Mon, Aug 05, 2002 at 03:52:12PM -0300, Jorge Melhado wrote:
>    I�m using Red Hat 7.3 (kernel 2.4.28) and I�m trying to convert may
>    root filesystem to LVM.
well
rh73 supports root raid natively (i don't believe lvmcreate_initrd is distributed with redhat
but you never know)

user redhat mkinitrd tool to create an initrd capable of booting from lvm

regards,
L.

P.S. i hate howto documents (they tend to be read as gospel, but usually never apply
to someone particular situation).

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
