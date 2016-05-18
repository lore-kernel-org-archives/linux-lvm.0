Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IHofGI007679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 13:50:41 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B319685542
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 17:50:40 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1b35cF-0001f5-Kz
	for linux-lvm@redhat.com; Wed, 18 May 2016 17:50:39 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id E9A0E18320C
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 14:39:48 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 06194-03-3 for <linux-lvm@redhat.com>;
	Wed, 18 May 2016 14:39:48 -0400 (EDT)
Date: Wed, 18 May 2016 14:39:48 -0400
From: Brian McCullough <bdmc@buadh-brath.com>
Message-ID: <20160518183948.GA4143@bdmcc-us.com>
References: <20160518002234.GA13276@bdmcc-us.com> <573C6BDF.4090209@redhat.com>
	<20160518145650.GA3394@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160518145650.GA3394@bdmcc-us.com>
Subject: Re: [linux-lvm] Unable to find device with UUID XXX.
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

On Wed, May 18, 2016 at 10:56:50AM -0400, Brian McCullough wrote:
> On Wed, May 18, 2016 at 03:19:27PM +0200, Marian Csontos wrote:
> > On 05/18/2016 02:22 AM, Brian McCullough wrote:
> > >I have an issue that I hope that the group can save me from.
> > >
> 
> > What distribution, version of LVM and kernel?
> 
> On the main machine, or the Rescue CD?

On the main, dead, machine, it is an Ubuntu 14.04.1 LTS machine with
version 3.13.0-86-generic x86_64 ( AMD 64 ) kernel.

I was able to get enough of the dead machine running to give the other
version numbers.

LVM: 2.02.98(2) (2012-10-15)
Lib: 1.02.77 (2012-10-15)
Driver: 4.22.0



Brian
