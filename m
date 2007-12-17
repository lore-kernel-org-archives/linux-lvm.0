Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBH9GNtY007303
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 04:16:23 -0500
Received: from cluster-f.mailcontrol.com (cluster-f.mailcontrol.com
	[85.119.2.190])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBH9Flsa016651
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 04:15:48 -0500
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly27f.srv.mailcontrol.com (MailControl) with ESMTP id
	lBH9FeuA025555
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 09:15:41 GMT
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id JAA02614
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 09:19:32 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 17 Dec 2007 09:15:37 -0000
Message-ID: <A374F37068535C46BFCF8D48CF29AA7F83940D@zen.zetex.local>
From: "Karl Wagner" <kwagner@zetex.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Dropped LVM2 snapshot
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
To: linux-lvm@redhat.com


I have a problem...

I run several Xen VM's, all based on Suse 10.2. In order to save space,
and to simplify adding a new VM in future, I built a base system in a
logical volume, then made writable snapshots for each. However, I made a
mistake with one, and it filled the snapshot. Now it is marked as
invalid and is inaccessible.

Is there any way to force reactivation of the snapshot? The base image
hasn't changed, so it should still contain the exact state of the system
at the point at which it failed.

Thanks
Karl


_________________________________________________________

Zetex Semiconductors - Solutions for an analog world.

http://www.zetex.com
http://www.zetex.cn

E-MAILS are susceptible to interference.  You should not assume that
the contents originated from the sender or the Zetex Group or that they 
have been accurately reproduced from their original form.
Zetex accepts no responsibility for information, errors or omissions in
this e-mail nor for its use or misuse nor for any act committed or
omitted in connection with this communication.
If in doubt, please verify the authenticity with the sender.
_________________________________________________________

 
