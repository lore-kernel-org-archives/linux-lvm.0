Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77IMOF1025173
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 14:22:24 -0400
Received: from mule.trantor.org.uk (mule.trantor.org.uk [213.146.154.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m77IMAbi015599
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 14:22:11 -0400
Received: from lion.trantor.org.uk (cpc1-leds8-0-0-cust743.leed.cable.ntl.com
	[82.30.178.232])
	by mule.trantor.org.uk (Postfix) with ESMTP id 4EE7C4BE
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 19:22:09 +0100 (BST)
Received: from [192.168.87.26] (unknown [192.168.87.26])
	by lion.trantor.org.uk (Postfix) with ESMTP id BF392C0048
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 19:38:36 +0100 (BST)
Subject: Re: [linux-lvm] the lvm shared storage question of the week
From: John Leach <john@johnleach.co.uk>
In-Reply-To: <489946F6.60706@squirk.org>
References: <48985774.2080509@squirk.org>
	<54CA3782-8BC9-4F64-B209-2066B2315E77@redhat.com>
	<489946F6.60706@squirk.org>
Date: Thu, 07 Aug 2008 19:22:09 +0100
Message-Id: <1218133329.4013.20.camel@dogen.thepride.>
Mime-Version: 1.0
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

On Wed, 2008-08-06 at 08:38 +0200, Jean Spirat wrote:

Hi,

> > LVM manual briefly mentions CLVM (should apply equally well to debian):
> > http://www.redhat.com/docs/manuals/enterprise/RHEL-5-manual/Cluster_Logical_Volume_Manager/index.html 
> >
> yes it just speak about it but there is no doc at all, nothing tells us 
> if it listen on a tcp port or just communicate by using data on the disk 
> or anything about the setup. Also it speak about special configuration 
> in lvm.conf but nowhere i see WHAT should be configured :)

CLVM needs a distributed lock manager to work (which communicates over
the network, not via the disk).  This is usually provided with the help
of the RedHat Cluster Suite.

>that it should use
>
>locking_type=2
>
>but is this enough ?

by default, locking type 2 or 3 requires clvmd, which as I say will
require a cluster setup of some kind.

You *can* work without a cluster manager but I'm not sure how advised it
is.  So you leave your locking type as 1 and use "lvchange
--refresh /dev/vg/*" on all nodes to reload metadata from disk whenever
you make a change.  Can be a bit risky.

John.
-- 
http://johnleach.co.uk
