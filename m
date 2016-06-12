Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5C2IZcY026847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2016 22:18:35 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BB3FD657B
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2016 02:18:34 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1bBued-0001u6-Df
	for linux-lvm@redhat.com; Sun, 12 Jun 2016 01:57:35 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 041AE17FE75
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2016 22:17:57 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 27158-01 for <linux-lvm@redhat.com>;
	Sat, 11 Jun 2016 22:17:56 -0400 (EDT)
Date: Sat, 11 Jun 2016 22:17:56 -0400
From: Brian McCullough <bdmc@buadh-brath.com>
Message-ID: <20160612021755.GA873@bdmcc-us.com>
References: <20160602170622.GA32445@bdmcc-us.com>
	<22A09620-C220-404C-A3F0-8D13FDFE475D@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22A09620-C220-404C-A3F0-8D13FDFE475D@redhat.com>
Subject: Re: [linux-lvm] Recovering from incomplete pvmove
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jun 10, 2016 at 08:40:12AM -0500, Brassow Jonathan wrote:
> how far did the pvmove get?  What was the layout of the LV?  Did you already attempt mounting it?

Thank you for responding, Jonathan.

The drive had a dozen partitions ( 250 GB each ), and, as I remember, I
may have successfully moved one.  Shortly afterward, the drive
completely failed, and, after some attempts to restore it to working, I
sent it off to a data recovery service, who told me that the heads had
crashed, and it was scrap metal.

I have done vgscan, and that complains about missing UUIDs.

I had added a new drive and one or more PVs to the VG, and that was what
I was trying to pvmove.

I have not attached the "new" drive to the machine since the old one failed.


I suspect that things are past saving, and that the parts of the drive
that may have been successfully transferred are beyond recovery.
However, I have never worked in this part of LVM, so thought that I 
would ask.



Brian
