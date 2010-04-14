Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3E6ogVm008201
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 02:50:42 -0400
Received: from mail-bw0-f211.google.com (mail-bw0-f211.google.com
	[209.85.218.211])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3E6oU26008210
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 02:50:31 -0400
Received: by bwz3 with SMTP id 3so6370457bwz.11
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 23:50:29 -0700 (PDT)
From: brem belguebli <brem.belguebli@gmail.com>
In-Reply-To: <20100414052151.GA28457@maude.comedia.it>
References: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>
	<20100414052151.GA28457@maude.comedia.it>
Date: Wed, 14 Apr 2010 10:47:58 +0200
Message-ID: <1271234878.30056.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
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
To: LVM general discussion and development <linux-lvm@redhat.com>

or vgdisplay -v root_vg
and vgdisplay -v san_vg 

will give you the PV's for each of your VG's

then to identify if the physical disks are the ones from the SAN use
scsi_id command that'll help you

scsi_id -g 0x80 -d /dev/sdX 

 
On Wed, 2010-04-14 at 07:21 +0200, Luca Berra wrote:
> On Tue, Apr 13, 2010 at 08:59:40PM -0400, Vickie Troy-McKoy wrote:
> >
> >Hi All,
> >
> > 
> >
> >I have a RedHat4 server connected to a SAN 3510 Array.  On the host server, there are two volume groups set up--root_vg and san_vg.  I'm assuming that root_vg resides on the internal disks and san_vg on the SAN.  But, how can I check to make sure this is the case?
> >
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> try with the pvs command
> 
