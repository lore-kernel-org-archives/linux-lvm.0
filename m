Date: Fri, 7 Sep 2001 12:17:22 -0400
From: Benjamin Reed <ranger@befunk.com>
Subject: Re: [linux-lvm] lvcreate segfaults
Message-ID: <20010907121721.F13717@befunk.com>
References: <8F120FA493CAD743B30EEB8F356985B501A78136@AUSXMBT102VS1.amer.dell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8F120FA493CAD743B30EEB8F356985B501A78136@AUSXMBT102VS1.amer.dell.com>; from Robert_Macaulay@Dell.com on Fri, Sep 07, 2001 at 10:59:44AM -0500
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

> > As far as I can tell - the only significant difference 
> > between this putput
> > and the pre-patched output - is that it is now int lv_create 
> > instead of
> > inline int lv_create.
> > 
> > If there is any other info I can provide - as always - please ask.

Not sure if it helps, but I had problems on RH71 with
lvcreate segfaulting, switching to the compat-* compiler
(egcs 2.91) instead of the default gcc-2.96 fixed my
problem, so I would expect it to be something in the
newer, more anal, gcc-3-style compiler.

-- 
Ben Reed a.k.a. Ranger Rick (ranger@befunk.com)
http://defiance.dyndns.org/ / http://radio.scenespot.org/
The devil's in the broad, sweeping generalizations.
