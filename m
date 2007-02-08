Received: from [192.168.1.2] (vpn-68-11.surrey.redhat.com [10.32.68.11])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l188roXn019411
	for <linux-lvm@redhat.com>; Thu, 8 Feb 2007 08:53:50 GMT
Message-ID: <45CAE514.7020200@redhat.com>
Date: Thu, 08 Feb 2007 08:53:40 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] CLVM Questions
References: <DDC513CA-32D7-466C-A34E-1F5EFDFDD265@engineyard.com>
In-Reply-To: <DDC513CA-32D7-466C-A34E-1F5EFDFDD265@engineyard.com>
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

Jayson Vantuyl wrote:
> Is it possible to mix clustered LVM and unclustered LVM?  I tried but it
> seemed to have issues.


I'm not sure what you mean here. You either have a cluster or you don't.

If you have clvm on one node on a cluster then it needs to be on ALL nodes of
the cluster - you can't have an isolated node that is also part of the CMAN
cluster.

If what you mean is "can I have a non-clustered Volume Group alongside cluster
volume groups", then the answer is "yes". There is a flag on the VG that
indicates whether it is clustered or not. activated with vgchange -cy,
deactivated with vgchange -cn. You can't mark individual LVs within a VG as
clustered/non-clustered though. That wouldn't make sense.

> Also, does anyone know if Gentoo likes it better if you use the CLVM
> package or if you build the LVM package with the clvm USE flag?
> 


-- 

patrick
