Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021101150659.GA5289@weissel.dyndns.org>
References: <20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory> <20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com> <1035866273.9074.74.camel@gopher> <20021029101033.A22193@sistina.com> <1035921224.1276.24.camel@gopher> <20021031134804.A491@sistina.com> <1036104859.21418.104.camel@pslgregory>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1036104859.21418.104.camel@pslgregory>
From: Wolfgang Weisselberg <weissel@netcologne.de>
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
Date: Fri Nov  1 09:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Gregory Ade (gkade@bigbrother.net) wrote 60 lines:

> support and attempt the snapshot creation?  Unfortunately, the way the
> system was assembled, the smallest I can physically reduce the RAM to is
> 4GB (two DIMMS on each memory carrier is the minimum required for the
> system to boot, and they shipped it to us with 8 1GB DIMMS.)

There should be no problem with "mem=3D1023M" as boot parameter,=20
as long as at least 1023 MB are actually physically available.

-Wolfgang
