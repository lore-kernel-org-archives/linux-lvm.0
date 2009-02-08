Received: from [10.32.10.85] (vpn-10-85.str.redhat.com [10.32.10.85])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n18EBR24015449
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 09:11:27 -0500
Message-ID: <498EE80D.3090307@redhat.com>
Date: Sun, 08 Feb 2009 15:11:25 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems running my home-built LVM2
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
In-Reply-To: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
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
> I'm trying to use LVM2 on a small MIPS machine.  This machine uses
> uClibc-0.9.29 with Linux-2.6.25.20 and has limited RAM and CPU power,
> but does come with a 1TB drive which I'd rather manage with LVM.

> I had no particular problems building the latest version of LVM2
> for it.  And as far as I can tell, it's not fully broken,
> but it's unusable: every run of `lvm' gives different results.
> E.g. `lvm pvs' sometimes gives the expected output, sometimes lists
> nothing at all, sometimes complains about missing volume groups,
> sometimes "Incorrect metadata area header checksum" [as mentioned in an
> earlier message on this list, incidentally].

I guess that using uClibc is the problem.
Can you try to link it to standard glibc (if possible; you can try to use
static build also)?
(Just to test that using uClibc is the problem or not.)

> Then I installed Debian in a chroot, and Debian's 2.02.39 version of
> `lvm' works just fine.

That version uses glibc, right?

Milan
--
mbroz@redhat.com
