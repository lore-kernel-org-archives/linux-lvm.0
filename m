Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4BLUccO029689
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 17:30:38 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4BLUaYM011181
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 17:30:37 -0400
Received: by wya21 with SMTP id 21so1056954wya.33
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 14:30:36 -0700 (PDT)
From: Brem Belguebli <brem.belguebli@gmail.com>
In-Reply-To: <4DC85F38.5070506@spinn.net>
References: <20110509203822.GA29336@netfirms.com> <4DC85F38.5070506@spinn.net>
Date: Wed, 11 May 2011 23:35:00 +0200
Message-ID: <1305149700.3264.3.camel@newgen.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] creating pv's on LVM's for virtual guests
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
Content-Type: text/plain; charset="us-ascii"
To: allane@spinn.net, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2011-05-09 at 15:40 -0600, allan wrote:
> Hi Steve,
> 
> I've had mixed results doing that very thing. Two servers perform very differently.
> One mach, an HP DL380G6 w/ dual quad core Zeon and 6 146G disks installed with CentOS 5.5 stock xen, lvm, etc. performs 
> very well. 
It may be more related to the write cache ratio of your smartarray on
the DL38O, no ?
> Another machine intended as a low class server, a desktop quad core AMD, 4 SATA disks installed with stock 
> CentOS 5.5 same as first mach, has issues with disk perfomance on every DomU - writes are 1/10 the rate of Dom0 -- I'm 
> still troubleshooting it.
> I see no problem with using LVM on Dom0, carving it up and offering to DomU virtuals and the virtuals using LVM for 
> storage. One thing to avoid: do not duplicate an LVM names within the entire machine. i.e. installer, when told to use 
> LVM, will create a vg of a specific name. If this name is not overridden, and you create multiple DomUs with same 
> process the VG name will be duplicated (as well as the LV names). Avoid name duplication.
> I hope this helps.
All the VM's I've been using (ESX, KVM, Xen, and also HyperV) are built
on LVM and no particular issue nor performance problem 
> 
> Allan
> 
> Steve Shorter wrote:
> > Howdy!
> > 
> > 	I am setting up virtual guests to have a LVM created
> > from the host. It would be good to use LVM's in the
> > guest also.. for easy volume expansion etc...
> > 
> > ie. I am creating pv's/vg's/lvms on top of LVM's. It *seems* to
> > work but some of the userland tools need the option -ff
> > 
> > 	Does anybody see any issues doing this?
> > 
> > 	thanx - steve
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
