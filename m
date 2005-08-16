Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7G6cEV31743
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 02:38:14 -0400
Received: from mail.astral.ro (mail.astral.ro [193.230.240.11])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7G6c5Qn023469
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 02:38:06 -0400
Received: from 127.0.0.1 (localhost.localdomain [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 9B64C305FB
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 09:37:53 +0300 (EEST)
Received: from [192.168.25.222] (dummy.cluj.astral.ro [193.230.240.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.astral.ro (Postfix) with ESMTP id 95167305EF
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 09:37:53 +0300 (EEST)
Message-ID: <430189C1.8030000@astral.ro>
Date: Tue, 16 Aug 2005 09:37:53 +0300
From: Imre Gergely <imre.gergely@astral.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple snapshots
References: <4300816B.8060208@astral.ro>
In-Reply-To: <4300816B.8060208@astral.ro>
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


mmm, i forgot:

[root@fc2 root]# uname -r
2.6.12.5

lvm> version
  LVM version:     2.01.13-cvs (2005-06-14)
  Library version: 1.01.01 (2005-03-29)
  Driver version:  4.4.0


Imre Gergely wrote:
> hi
> 
> i tried to create 2 snapshots of a LV, and i got in trouble ;) with one
> snapshot there are apparently no problems, with two the kernel gives me
> random oops-es and hangs. first, i tried with the root LV, then i tried
> with a simple partition, the result were the same. i created the two
> snapshots, after that i did a vgdisplay, there was everything alright, i
> mounted the origin LV, i copied some files, i watched the percentage
> increasing on the snapshots, then i did a 'ls -la' on the mounted
> directory and then the kernel said bye-bye... i don't see any kernel
> panic, just the usual register and memory dump, and the hang.
> 
> any ideas? don't tell me i cannot have more than one snapshot on one
> given LV.
> 
> thx.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
Gergely Imre
SysAdmin
Astral Telecom
http://www.nextra.ro/gimre
GPG key: 0x34525305 (www.keyserver.net)
