Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8RDqcv1025848
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 09:52:38 -0400
Received: from smtp.unilim.fr (mail.unilim.fr [164.81.1.45])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8RDqUEw018011
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 09:52:30 -0400
Received: from root.ensil.unilim.fr (root.ensil.unilim.fr [193.50.177.246])
	by smtp.unilim.fr (8.13.1/8.13.1) with ESMTP id l8RDqKWk024887
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 15:52:20 +0200
Received: from [127.0.0.1] (cluster1.ensil.unilim.fr [193.50.177.250])
	by root.ensil.unilim.fr (8.14.1/8.13.4) with ESMTP id l8RDs8s4071915
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 15:54:08 +0200 (CEST)
	(envelope-from chomette@ensil.unilim.fr)
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Message-Id: <D1DF25FB-02EE-46BF-92AF-4DB9039BFFB8@ensil.unilim.fr>
From: hubert chomette <chomette@ensil.unilim.fr>
Date: Thu, 27 Sep 2007 15:50:32 +0200
Subject: [linux-lvm] lvm on a share environnement (SAN inside)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Hi,
I recently install a SAN at my work. One lun is used for XEN and can  
be used by two xen server.
For more flexibility I use lvm on this lun. I was very happy of the  
result, unless I discover (during a conversation with a friend) that  
lvm metadata can be compromised if the two server simulty modify  
metadata.
- So what can I do?
- Is it possible to allow LVM metadata modification by only one server?
- should I use clvm instead?
- Is it possible to migrate lvm to clvm without any data lost?

thank's for your help

regards,

ps: sorry for my poor english
