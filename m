Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3I3Fr4028152
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 13:03:15 -0500
Received: from mail2.ontariocreditcorp.com (mail2.ontariocreditcorp.com
	[209.217.204.70])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA3I2u6T029151
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 13:02:57 -0500
Received: from backoffice.bplinux.com
	(pool-98-118-141-73.bflony.fios.verizon.net [98.118.141.73])
	by mail2.ontariocreditcorp.com (8.12.10/8.12.10) with ESMTP id
	nA3I2tZv018061
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 13:02:55 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by backoffice.bplinux.com (Postfix) with ESMTP id C370E3E8002
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2009 13:00:49 -0500 (EST)
Received: from backoffice.bplinux.com ([127.0.0.1])
	by localhost (backoffice.bplinux.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id LpenpmWKf51p for <linux-lvm@redhat.com>;
	Tue,  3 Nov 2009 13:00:46 -0500 (EST)
Received: from backoffice.bplinux.com (backoffice.bplinux.com [192.168.1.4])
	by backoffice.bplinux.com (Postfix) with ESMTP id 0B7573E8001
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2009 13:00:45 -0500 (EST)
Date: Tue, 3 Nov 2009 13:00:45 -0500 (EST)
From: Christopher Hawkins <chawkins@bplinux.com>
Message-ID: <25671167.21257271245732.JavaMail.javamailuser@localhost>
In-Reply-To: <30507140.01257271012362.JavaMail.javamailuser@localhost>
Subject: Re: [linux-lvm] kernel panic on lvcreate
MIME-Version: 1.0
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

Actually it looks like the reverse might be true. I tried this on a box with older kernel 2.6.18-92.1.22.el5 and there is no panic. I upgraded that box to kernel 2.6.18-164.2.1.el5, reboot, and now the panic is reproducible. Trying to get an oops, will post again soon. 

Christopher Hawkins

----- "Milan Broz" <mbroz@redhat.com> wrote:

> On 11/03/2009 04:07 PM, Christopher Hawkins wrote:
> > When I create a root snapshot on a fairly typical Centos 5.3
> server:
> ...
> > I get a kernel panic.
> 
> Please try to first update kernel to version from 5.4.
> (There were some fixes for snapshot like
> https://bugzilla.redhat.com/show_bug.cgi?id=496100)
> 
> If it still fails, please post the OOps trace from kernel (syslog).
> 
> Milan
> --
> mbroz@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
