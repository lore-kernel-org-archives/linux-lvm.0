Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9TJX2UB002359
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 14:33:02 -0500
Received: from karakal.cosy.sbg.ac.at (karakal.cosy.sbg.ac.at [141.201.2.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9TJX1RH013570
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 14:33:01 -0500
Received: from webmail.cosy.sbg.ac.at (localhost.localdomain [127.0.0.1])
	by karakal.cosy.sbg.ac.at (Postfix) with ESMTP id 48B1F8D473D
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 20:33:10 +0100 (CET)
Message-ID: <3617.62.99.165.114.1162150390.squirrel@webmail.cosy.sbg.ac.at>
In-Reply-To: <20061029190656.GA15587@percy.comedia.it>
References: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
	<20061029190656.GA15587@percy.comedia.it>
Date: Sun, 29 Oct 2006 20:33:10 +0100 (CET)
Subject: Re: [linux-lvm] Lost partition table --> Lost 4th PV partition on 
	disk - how to find the partition bounderies
From: gklima@cosy.sbg.ac.at
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> i had some success in the past with
> http://www.cgsecurity.org/wiki/TestDisk

tried this one two, but with no success! (even less successful than gpart)

> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.

as to my knowledge gpart only supports lvm1 partitions but not the lvm2.
so it couldn't find the partition.

georg
