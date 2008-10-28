Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9S6iTvq023737
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 02:44:30 -0400
Received: from om.cz.net (om.cz.net [193.85.2.13])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9S6hl87001111
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 02:44:14 -0400
Received: from 192.168.60.224 ([193.179.76.212])
	by om.cz.net (8.13.8/8.13.8/om) with SMTP id m9S6hk2Q016283
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 07:43:46 +0100 (CET)
Received: from [192.168.58.13] (skadlec.es.gk-software.com [192.168.58.13])
	by hermes.es.gk-software.com (Postfix) with ESMTP id 739868F504
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 07:43:46 +0100 (CET)
Message-ID: <4906B4AD.3030304@gk-software.com>
Date: Tue, 28 Oct 2008 07:43:57 +0100
From: Stepan Kadlec <skadlec@gk-software.com>
MIME-Version: 1.0
References: <17984.89.200.148.101.1224840790.squirrel@wmail.comarch.com>
In-Reply-To: <17984.89.200.148.101.1224840790.squirrel@wmail.comarch.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] libdlm.h: No such file or directory
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
To: linux-lvm@redhat.com

hello list,
I am trying to compile clustered LVM with OpenAIS (instead of cluster 
framework) using

./configure --with-clvmd=openais --with-cluster=shared --libdir=/usr/lib64/

but it fails because of missing libdlm.h. I know this is part of the 
cluster framework, but I thought I don't need 'cluster' when using 
'OpenAIS'.

what is the clean way for compiling clustered LVM with OpenAIS?

thanks for any hints. stepan
