Received: from [10.32.10.69] (vpn-10-69.str.redhat.com [10.32.10.69])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1H7UwIe011346
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 02:30:59 -0500
Message-ID: <499A67B8.8070507@redhat.com>
Date: Tue, 17 Feb 2009 08:31:04 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Problems running my home-built LVM2
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>	<498EE80D.3090307@redhat.com>	<jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>	<49905A90.2000802@redhat.com>	<jwvk57q0y5w.fsf-monnier+gmane.linux.lvm.general@gnu.org>	<20090217000623.GD26197@agk.fab.redhat.com>
	<jwv7i3p24qp.fsf-monnier+gmane.linux.lvm.general@gnu.org>
In-Reply-To: <jwv7i3p24qp.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Stefan Monnier wrote:
>>> _io in dev-io.c) would often return garbage (tho not always).  Not sure
>>> if it's a problem in LVM2, or in uClibc, or in the kernel, but I think
>>> I've already wasted more than enough time on this, so I'll just use
>>> the --disable-o_direct workaround.
>> We had a problem with O-direct several years ago which we blamed on a rogue
>> version of gcc.
> 
> Based on my experience I'd say that it seems to still be around.
> At least on `mipsel'.  I have since discovered that Debian's `lvm2'
> package disables O_DIRECT with the following lines:
> 
>    ifneq (,$(findstring $(DEB_HOST_ARCH), arm armeb hppa mips mipsel))
>    CONFIGURE_FLAGS += --disable-o_direct
>    endif

Ah, ok. That explains why my test on i686 arch & uClibc works:)

This really seems like problem unrelated to LVM2,
is possible that O_DIRECT is just buggy on ARM & similar archs
see http://lkml.org/lkml/2008/11/19/300 for example...

Milan 
--
mbroz@redhat.com
