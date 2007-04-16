Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3GEVlIB013034
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2007 10:31:47 -0400
Received: from smtp.aic.fr (smtp.aic.fr [195.13.32.109])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3GEVjpd003190
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2007 10:31:46 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp.aic.fr (Postfix) with ESMTP id 7A3D8CC017D
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2007 16:31:37 +0200 (CEST)
Received: from smtp.aic.fr ([127.0.0.1])
	by localhost (postfix09.aic.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8+i8faMZu6CD for <linux-lvm@redhat.com>;
	Mon, 16 Apr 2007 16:31:37 +0200 (CEST)
Received: from localhost (unknown [195.13.32.101])
	by smtp.aic.fr (Postfix) with ESMTP id 61092CC0179
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2007 16:31:37 +0200 (CEST)
Message-ID: <20070416163137.bcev2u08owwc8gk0@webmail.aic.fr>
Date: Mon, 16 Apr 2007 16:31:37 +0200
From: jmfaidy@aic.fr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] clvmd cman and co by a noob@clustering
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
Content-Type: text/plain; charset="utf-8"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Hello everybody,
I'm trying to configure a cluster architecture, but i encounter some issues.
I'm doing this on a dom0 2.6.18-1.2798.fc6xen.
My goal is to use xen-heartbeat-clvmd-iscsi-drbd.
First, i can't start clvmd, thr message is : "clvmd could not connect  
to cluster manager"
So, if i don't mistake, the cluster manager should be cman ? I hope i'm true.
So I try to start cman, here is one of the message i have :

"Starting cluster:
    Loading modules... done
    Mounting configfs... done
    Starting ccsd... done
    Starting cman... failed
cman not started: Local host name resolves to 127.0.0.1; fix  
/etc/hosts before starting cluster. /usr/sbin/cm
an_tool: aisexec daemon didn't start
                                                            [�CHOU�]"
but sometimes i have some other message, like "node have no node id  
while i have the <nodeid="1"> in cluster.conf xml file.

I'm sur i've miss some thing to do to configure everything.
It would be great if someone have a hint for me...
TY
have a nice day.

JiM

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
