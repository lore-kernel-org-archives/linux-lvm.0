Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HIDsj14624
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 13:13:54 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HIDr4b022764
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 13:13:53 -0500
Received: from acpi.pdx.osdl.net (acpi.pdx.osdl.net [172.20.1.40])
	by mail.osdl.org (8.11.6/8.11.6) with ESMTP id i2HIDmE02740
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 10:13:48 -0800
Received: from acpi.pdx.osdl.net (localhost.localdomain [127.0.0.1])
	by acpi.pdx.osdl.net (8.12.5/8.12.5) with ESMTP id i2HIFmXQ002343
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 10:15:48 -0800
Received: (from dmo@localhost)
	by acpi.pdx.osdl.net (8.12.5/8.12.5/Submit) id i2HIFm0Y002341
	for linux-lvm@redhat.com; Wed, 17 Mar 2004 10:15:48 -0800
Date: Wed, 17 Mar 2004 10:15:48 -0800
From: Dave Olien <dmo@osdl.org>
Subject: Re: [linux-lvm] LVM2 scalability within volume group
Message-ID: <20040317181548.GA2290@osdl.org>
References: <20040317173637.GA2126@osdl.org>
	<20040317120005.C31599@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040317120005.C31599@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


Thanks!  The pvcreate man page I have installed now (from LVM2.00.08)
doesn't mention this option.  I'll move to the cvs version and give it
a try.

Dave

On Wed, Mar 17, 2004 at 12:00:05PM -0600, Alasdair G Kergon wrote:
> On Wed, Mar 17, 2004 at 09:36:38AM -0800, Dave Olien wrote:
> > Having redundant copies of meta data is a good thing.  But how about
> > allowing the adminstrator to set a limit on the degree of redundancy when
> > a VG is created.  You could limit a VG to having for example 10 redundant
> > copies.  Then adding more PVs beyond the 10th would encounter less overhead.
> > Am I missing something important?
> 
> There'll be a VG-level option for this eventually; until then, use the
> pvcreate options to say how many copies of metadata you want on each PV.
> e.g. pvcreate --metadatacopies 0
> [Careful use of the --restorefile option lets you reduce it on a PV already in the VG.]
> 
> For complex VGs you should increase the space set aside for metadata too:
>   --metadatasize
> 
> See the pvcreate man page.
>  
> Alasdair
> -- 
> agk@redhat.com
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
