Received: from [10.10.59.223] (vpn-59-223.rdu2.redhat.com [10.10.59.223])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5ADeDr0011174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 09:40:13 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <20160602170622.GA32445@bdmcc-us.com>
Date: Fri, 10 Jun 2016 08:40:12 -0500
Message-Id: <22A09620-C220-404C-A3F0-8D13FDFE475D@redhat.com>
References: <20160602170622.GA32445@bdmcc-us.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

how far did the pvmove get?  What was the layout of the LV?  Did you already attempt mounting it?

 brassow

> On Jun 2, 2016, at 12:06 PM, Brian McCullough <bdmc@bdmcc-us.com> wrote:
> 
> A few days ago, I had, I now know, a drive failing and attempted a
> pvmove.
> 
> According to what I could see, some data was recovered.  However, the
> source drive is now scrap metal, from what the data recovery company
> tells me, so I am wondering whether I can restore anything from the new
> target drive.
> 
> Can you help?
> 
> 
> Ubuntu 14.04.1 LTS
> Kernel 3.13.0-86-generic
> LVM version: 2.02.98(2) ( 2012-10-15 )
> Library version: 1.02.77 ( 2012-10-15 )
> Driver version: 4.22.0
> 
> Anything else that I can provide?
> 
> 
> Thanks,
> Brian
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
