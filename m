Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p49LeEUt009004
	for <linux-lvm@redhat.com>; Mon, 9 May 2011 17:40:14 -0400
Received: from mail.spinn.net (mail.spinn.net [216.223.224.151])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p49Le91A009168
	for <linux-lvm@redhat.com>; Mon, 9 May 2011 17:40:13 -0400
Message-ID: <4DC85F38.5070506@spinn.net>
Date: Mon, 09 May 2011 15:40:08 -0600
From: allan <allane@spinn.net>
MIME-Version: 1.0
References: <20110509203822.GA29336@netfirms.com>
In-Reply-To: <20110509203822.GA29336@netfirms.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] creating pv's on LVM's for virtual guests
Reply-To: allane@spinn.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Steve,

I've had mixed results doing that very thing. Two servers perform very differently.
One mach, an HP DL380G6 w/ dual quad core Zeon and 6 146G disks installed with CentOS 5.5 stock xen, lvm, etc. performs 
very well. Another machine intended as a low class server, a desktop quad core AMD, 4 SATA disks installed with stock 
CentOS 5.5 same as first mach, has issues with disk perfomance on every DomU - writes are 1/10 the rate of Dom0 -- I'm 
still troubleshooting it.
I see no problem with using LVM on Dom0, carving it up and offering to DomU virtuals and the virtuals using LVM for 
storage. One thing to avoid: do not duplicate an LVM names within the entire machine. i.e. installer, when told to use 
LVM, will create a vg of a specific name. If this name is not overridden, and you create multiple DomUs with same 
process the VG name will be duplicated (as well as the LV names). Avoid name duplication.
I hope this helps.

Allan

Steve Shorter wrote:
> Howdy!
> 
> 	I am setting up virtual guests to have a LVM created
> from the host. It would be good to use LVM's in the
> guest also.. for easy volume expansion etc...
> 
> ie. I am creating pv's/vg's/lvms on top of LVM's. It *seems* to
> work but some of the userland tools need the option -ff
> 
> 	Does anybody see any issues doing this?
> 
> 	thanx - steve
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
