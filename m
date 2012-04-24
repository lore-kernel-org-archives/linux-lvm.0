Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3OF9cDw030000
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:09:38 -0400
Received: from fmailhost01.isp.att.net (fmailhost01.isp.att.net
	[207.115.11.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3OF9bsx028510
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:09:38 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 6F77221BDBA
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:09:35 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 03671-01-9 for <linux-lvm@redhat.com>;
	Tue, 24 Apr 2012 11:09:34 -0400 (EDT)
Date: Tue, 24 Apr 2012 09:24:19 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20120424132419.GA2244@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Missing PV
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have encountered a situation where vgscan and vgchange are complaining
about a missing UUID.

As far as I know, all, or almost all, of the LV is on the PV that is
known ( how do I know for sure? ), so I think that I am trying to just
"remove" the PV and recover what I can of the LV.

I have read Milan Brosz' slides from 2009, and the only piece that I
seem to be missing is the recovery of the LV.


I have made a copy of the PV to work with and the procedure that I need
to follow, as I understand it, is as follows:


vgscan
vgchange -a y ( fails )
vgchange -a y --partial
vgreduce --removemissing vgname

then what?

I have done:

pvs -o +uuid
lvs -o +devices

But am not sure how to interpret the results.  lvs shows two entries for
the LV that I am interested in.  The second entry shows "unknown device(0)".  



Thank you,
Brian
