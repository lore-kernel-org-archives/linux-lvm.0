Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77I8NNn013504
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 14:08:24 -0400
Received: from mule.trantor.org.uk (mule.trantor.org.uk [213.146.154.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m77I7vhb004677
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 14:07:58 -0400
Received: from lion.trantor.org.uk (cpc1-leds8-0-0-cust743.leed.cable.ntl.com
	[82.30.178.232])
	by mule.trantor.org.uk (Postfix) with ESMTP id 2F5DF4BE
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 19:07:57 +0100 (BST)
Received: from [192.168.87.26] (unknown [192.168.87.26])
	by lion.trantor.org.uk (Postfix) with ESMTP id AD18DC0048
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 19:24:23 +0100 (BST)
From: John Leach <john@johnleach.co.uk>
Date: Thu, 07 Aug 2008 19:07:56 +0100
Message-Id: <1218132476.4013.10.camel@dogen.thepride.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] metadata too large for circular buffer - any way to
	increase PV metadatasize?
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

Hi,

I'm getting the dreaded "metadata too large for circular buffer" message
trying to create a new LV in a volume group of a few hundred other LVs.

As I understand, this is because the PVs don't have enough space for the
metadata.  This size can be set to a larger value when pvcreating with
--metadatasize but I have obviously missed that boat :)

Is there a way to increase this with live PVs, rather than shifting all
the data off them and recreating and shifting back on?

I have a multinode RedHat Cluster with CLVMD and two PVs.  I can add
additional PVs if that helps (though as I understand *every* PV needs
enough metadata space).

Thanks in advance!

John.

-- 
http://johnleach.co.uk
