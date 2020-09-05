Received: from localhost.localdomain (unknown [10.33.36.201])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A75860C11
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 11:38:17 +0000 (UTC)
Date: Sat, 5 Sep 2020 12:38:14 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20200905113814.GB756355@localhost.localdomain>
References: <20200905082101.GA756355@localhost.localdomain>
	<079AAA2F-B532-446C-ABA7-A2E262059826@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <079AAA2F-B532-446C-ABA7-A2E262059826@gmail.com>
Subject: Re: [linux-lvm] pvcreate to memory
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 05, 2020 at 01:04:17PM +0200, Tomas Dalebj=EF=BF=BDrk wrote:
> I thought that LVM was originally a source copy clone from HPUX LVM?
> Hence the questions related to VGDA

No, that's not correct. The original LVM1 for Linux developed by Heinz
Mauelshagen at Sistina was based on the design and command line model of
HPUX LVM, but the source was developed from scratch (although it did use
the term VGDA and /etc/lvmtab).

Even so, that's more than 20 years ago now - today's Linux LVM2 is an
entirely new project but retaining much of the CLI design inspiration
that was found in the original LVM1. The LVM2 project started in 2001.

> so once I have created this pv header informations, what more do I need i=
n order for the lvconvert -s to accept my cow device?
> do I have to also create the minor,major device for the logical volume, o=
r will some other os command do that for me?

I think you need to familiarise yourself with the internals of today's
LVM2 and device-mapper stack (and the wider Linux storage stack, for
example the udev service which manages device nodes in /dev).

There are no simple recipe book style answers to the questions you are
asking - to do things like this that are outside of the current design
limits of the software you really need to have that understanding and
ability to inspect and configure the various parts of the system. Even
then you may find that there is a lot of work required to get the result
you want.

You could start off by taking a system installed to LVM2 and then use
commands like "dmsetup table" and "dmsetup status" (and comparing those
to the LVM2 metadata backups in /etc/lvm) to see how the system puts
everything together for you. Then you can start to think about making
changes to it.

Regards,
Bryn.
=20
