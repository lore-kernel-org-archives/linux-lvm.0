Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DEdCI7012035
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 09:39:12 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68BE561D2B
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 14:39:10 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id A9B0D5BCF3
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 15:39:07 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Feb 2017 15:39:07 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <bd71a2a1-9519-662b-f7a3-bd9d40049930@yahoo.co.uk>
References: <bd71a2a1-9519-662b-f7a3-bd9d40049930@yahoo.co.uk>
Message-ID: <46ab91ec33bcaa401b90879c7e6c49d3@xenhideout.nl>
Subject: Re: [linux-lvm] discard with luks and the FS itself
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

lejeczek schreef op 13-02-2017 12:59:

> Does one have to flag mounts with discard for both crypttab and fstab
> in order for TRIM to be in effect?
> Or just one? Just crypttab?

Cryptsetup has a flag but I don't know how it is evidenced in crypttab, 
it is definitely required. The file system (ie. ext4, or tune2efs -o 
discard) also requires it.
