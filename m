Date: Wed, 26 Sep 2001 08:46:24 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM help re:
Message-ID: <20010926084624.B15158@colombina.comedia.it>
References: <3BB14C7D.CDCD9F14@bellatlantic.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BB14C7D.CDCD9F14@bellatlantic.net>; from sarma@bellatlantic.net on Tue, Sep 25, 2001 at 11:33:17PM -0400
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

On Tue, Sep 25, 2001 at 11:33:17PM -0400, Uday Bhaskar Sarma Seetamraju wrote:
> Hi,
> 
> pvscan tells me which PV belongs to which VG.
> But I am wondering if the information as to
> "which PVwas added to the VG in which order"
> can also be determined.
not sure if vgdisplay -v will
> In case of a disaster, the first added PV would most likely contain
> all the information that's has been around longer (and so more
> important!)
you can do lvdisplay -v of a LV and have the position of each LE on
which PV.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
