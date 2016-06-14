Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EH7UYM001045
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 13:07:30 -0400
Received: from vm04-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46DF5486A7
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:07:29 +0000 (UTC)
Received: from pulsar.alteeve.ca
	(CPEbc4dfb9ec763-CMbc4dfb9ec760.cpe.net.cable.rogers.com
	[99.254.249.96])
	by vm04-mail01.alteeve.ca (Postfix) with ESMTPSA id C8631E028B
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 13:00:42 -0400 (EDT)
References: <1947646611.4779055.1465918044103.JavaMail.zimbra@helmholtz-muenchen.de>
From: Digimer <lists@alteeve.ca>
Message-ID: <20373d48-d991-f756-f844-e1660d294fbf@alteeve.ca>
Date: Tue, 14 Jun 2016 13:00:42 -0400
MIME-Version: 1.0
In-Reply-To: <1947646611.4779055.1465918044103.JavaMail.zimbra@helmholtz-muenchen.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] managing "local" LVM and cLVM concurrently ?
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

On 14/06/16 11:27 AM, Lentes, Bernd wrote:
> Hi,
> 
> i have a configuration where i have some local logical volumes (on an internal RAID-Controller) and also some logical volumes on a SAN which are shared with a second host. Is this possible concurrently ?
> Which locking_type to i have to povide ?
> 
> Thanks.
> 
> Bernd

Yup. When you create the VG on the cluster, use the -cy switch (cluster
= yes). Conversely, when creating a VG on non-shared storage, use -cn.
You need to set the locking to '3' (cluster locking) and be running the
clvmd service (which requires DLM which is provided by cman on older
distros and by a stand-alone DLM service on newer distros).

I assume your cluster is formed properly and fencing/stonith is
configured and tested?

-- 
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without
access to education?
