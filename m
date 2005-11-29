Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATIg0V21665
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:42:01 -0500
Received: from x500msfc.msfc.nasa.gov (x500msfc.msfc.nasa.gov [198.116.111.5])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jATIfrB9005119
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:41:53 -0500
Received: from [128.158.123.221] by x500msfc.msfc.nasa.gov with ESMTP for
	linux-lvm@redhat.com; Tue, 29 Nov 2005 12:39:07 -0600
Message-Id: <438CA082.8050004@knology.net>
Date: Tue, 29 Nov 2005 12:40:02 -0600
From: Mark F <mfaine@knology.net>
MIME-Version: 1.0
References: <dmi544$ckg$1@sea.gmane.org>
	<5493D77C6E101BAEDC2747FF@dhcp-2-206.wgops.com>
In-Reply-To: <5493D77C6E101BAEDC2747FF@dhcp-2-206.wgops.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Enterprise Backup Software with good support for LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Michael Loftis wrote:
> 
> 
> --On November 29, 2005 12:03:39 PM -0600 Mark F <mfaine@knology.net> wrote:
> 
>> Could someone suggest an Enterprise Backup package that has good support
>> for LVM (LVM2 in this case) on Linux (Specifically Suse Linux Enterprise
>> 9) Most products I've seen say they support block level backups but don't
>> specifically say they support LVM.
> 
> 
> LVM provides a block level device.  However you don't want to back up 
> there anyway, you'll just end up with corrupt garbage.  You need to back 
> up at the filesystem level unless you're using your LVM LVs for Oracle 
> or something similar in which case the backup software needs to support 
> that by putting Oracle or the related application into the correct hot 
> backup mode before attempting to directly read the LVM data, as well as 
> backing up the transaction/redo logs.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
Our data center is using Veritas Netbackup (currently 4.5 but soon to be 
5.1).  We are preparing some new servers for production and would like 
to use LVM2 but I'm not sure if this will present a problem for the 
Veritas Netbackup agent. I don't know if the backup agent software will 
support it or if it will even know the difference.

Is anyone using it?  Or does anyone have any reason to believe it 
will/won't work?

Thanks,
-Mark
