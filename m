Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8I1pnwn013857
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:51:49 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8I1pbHc012769
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:51:38 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1MoSdM-0001Jn-5U
	for linux-lvm@redhat.com; Fri, 18 Sep 2009 03:51:36 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1MoScv-0007N5-US
	for linux-lvm@redhat.com; Fri, 18 Sep 2009 03:51:10 +0200
Message-ID: <4AB2E78B.5020403@whgl.uni-frankfurt.de>
Date: Fri, 18 Sep 2009 03:51:07 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
References: <1253109566.5326.15.camel@delo.gdit>	<20090916181947.GB15438@us.ibm.com>	<1253127828.3243.1.camel@delo.gdit>	<1253181956.30299.25.camel@breeves.fab.redhat.com>	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>	<1253201655.2339.178.camel@pc.interlinx.bc.ca>	<Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>	<4AB2C5BC.5040804@gmail.com>
	<Pine.LNX.4.64.0909172041590.9233@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0909172041590.9233@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Configuring a nic in an initrd with busybox should not be too cumbersome.
For a straight forward approach one could use the kernel command line 
and tell it to get the info via dhcp.
And last but not least one could bootstrap load GPXE via the NICs PXE, 
which in turn passes the pxe discovered IP configuration into the 
kernel, or create some gpxe bootscript including the ip configuration to 
be passed to the kernel, if no dhcp is available.

There are quite some options actually ;-).


Regards

-Sven

Stuart D. Gathman schrieb:
> On Thu, 17 Sep 2009, Les Mikesell wrote:
> 
> 
> I have one client with a SAN system, and it seems to perform well.
> It is one client that never needs to install a physical disk on a
> server I maintain for them.  (Caveat, booting from iSCSI requires bringing up a
> Nic - which is tricky to do for linux in initrd.)
> 
