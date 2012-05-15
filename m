Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4F9hXOq031246
	for <linux-lvm@redhat.com>; Tue, 15 May 2012 05:43:33 -0400
Received: from mermoz.linkfluence.net (mermoz.linkfluence.net [91.121.30.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4F9hVic013284
	for <linux-lvm@redhat.com>; Tue, 15 May 2012 05:43:32 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mermoz.linkfluence.net (Postfix) with ESMTP id 479A0264
	for <linux-lvm@redhat.com>; Tue, 15 May 2012 11:43:31 +0200 (CEST)
Received: from mermoz.linkfluence.net ([127.0.0.1])
	by localhost (mermoz.linkfluence.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id XAYq4vfjdGj3 for <linux-lvm@redhat.com>;
	Tue, 15 May 2012 11:43:30 +0200 (CEST)
Received: from [10.0.0.207] (pla93-2-82-226-6-229.fbx.proxad.net
	[82.226.6.229])
	by mermoz.linkfluence.net (Postfix) with ESMTPSA id 01965BE
	for <linux-lvm@redhat.com>; Tue, 15 May 2012 11:43:29 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Germain Maurice <germain.maurice@linkfluence.net>
In-Reply-To: <4FB21004.9040905@redhat.com>
Date: Tue, 15 May 2012 11:43:29 +0200
Message-Id: <3D7060DA-2AB7-4BD6-BBFF-45BA09873191@linkfluence.net>
References: <5A672399-BC00-4545-B203-031056EC4CC2@linkfluence.net>
	<4FB21004.9040905@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Device mapper does not really remove the references
	to removed LV.
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for your answer Zdenek,

My cluster is in production and i know the virtualization solution we use is not optimal.
I will not programming a new daemon, but maybe a script that just do the job. The best way
to avoid any problem is to change my solution or deploy clvmd, i know.

For now, I just have to know how to proceed to avoid any problems.

So, before removing an LV, I think I have to do this :
- stopping the VM
- on every nodes : "lvchange -an /dev/VG/LV-to-remove"
- on one node : "lvremove /dev/VG/LV-to-remove"
- "vgscan" on every nodes.

And for creating :
- on the same node :
   - "lvcreate � /dev/VG/new-LV" 
   - "lvchange -ay  /dev/VG/new-LV" or "vgchange -ay"
- on the other nodes : 
   - "vgchange -ay"
- starting the VM on one node

For any LV modification :
- stopping the VM
- on every nodes : "lvchange -an /dev/VG/LV-to-remove"
- on one node : "lvmodify /dev/VG/LV-to-modify" and "lvchange -ay  /dev/VG/new-LV"
- "vgscan" on every nodes.
- starting the VM on one node (doing some stuff inside the VM)

Do you agree with that ?

I can do it manually because i don't have so much deployments to do.


Thank you for your help.



Le 15 mai 2012 � 10:12, Zdenek Kabelac a �crit :

> Dne 14.5.2012 19:37, Germain Maurice napsal(a):
>> Hi everybody,
>> 
>> I'm facing to some problems in my virtualization cluster and i need some help to prevent it occurring again.
>> 
>> I know that LVM is not cluster aware and we have to use it with lot of caution.
>> However, i have a shared LVM storage between 6 nodes. I use KVM hosts.
> 
> Hmm - if you are planing to build your own cluster - assuming you do not want to use lvm2 cluster support tools like clmvd - which needs advanced configuration) - you will need to write your own daemon, to watch out for locks and metadata changes.
> 
>> 
>> Two days ago i rebooted my whole cluster in order to get the same LVM metadata and the same dmsetup table over the cluster. That's ok.
>> 
>> "vgck SATA6To" is ok.
>> 
>> Right now, I have a problem when deleting an LV.
>> 
>> On the node where the VM lives, i did the lvremove command (lv name : SATA6To/vm-306-disk-3), i have a good state of LVM :
> 
> You need to propagate such change around your cluster by your daemon - and you have to be quite carefully where have you activated such LV before doing lvremove.
> 
> lvremove is simple command which does not communicate with other nodes in your cluster to let them know something has changed - so you might find some inspiration in CLVMD and it's locking technique to distribute locks around the cluster.
> 
>> 
>> Any idea how to clear all references to the LV previously removed ?
>> 
> 
> Before you remove LV on any node - you have to make sure all nodes deactivated such LV.
> 
> IMHO I'd suggest to use clvmd - instead of programming new daemon...
> 
> Zdenek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
