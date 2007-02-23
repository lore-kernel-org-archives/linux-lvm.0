Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1NLQL5E012719
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:26:22 -0500
Received: from vtmail3.earthcars.net (smtp.dealer.com [64.243.19.169])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1NLQJS0010463
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:26:20 -0500
Received: from [192.168.1.236] (pool236-dealercom-savvis.earthcars.net
	[64.243.19.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by vtmail3.earthcars.net (Postfix) with ESMTP id E26FE5FAE8
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 16:26:13 -0500 (EST)
Message-ID: <45DF5C28.6020809@dealer.com>
Date: Fri, 23 Feb 2007 16:27:04 -0500
From: Rob Ostrander <rob@dealer.com>
MIME-Version: 1.0
References: <45DED477.8040809@wpkg.org>	<20070223124452.GB22388@homer.panici.net>	<45DF0F5B.6000506@wpkg.org>
	<20070223173220.GD9124@soda.linbit>
In-Reply-To: <20070223173220.GD9124@soda.linbit>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] workaround for RHEL4 + LVM2 inactive snapshot kernel
	panic
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

It seems RHEL4's latest kernel and device-mapper have a bug which causes 
a kernel panic when an a snapshot gets *filled*, marked as inactive and 
then removed.  This is a known bug and fixed in later kernels but RHEL 
is a few versions behind...
What would you suggest to get around this issue?
Is there any overhead for keeping inactive snapshot LVs around?
