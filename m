Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8C7OlLp020410
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 03:24:47 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8C7Oi55022928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 03:24:45 -0400
Message-ID: <1410506681.13625.60.camel@kurenai.local>
From: Jarkko Oranen <oranenj@iki.fi>
Date: Fri, 12 Sep 2014 10:24:41 +0300
In-Reply-To: <47B3B0F3-0BC9-41D9-AB5C-FC1027E7B00F@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
	<5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
	<1409828800.6181.19.camel@kurenai.local>
	<0C032AC6-0346-4E28-BC0A-240EC76C44E2@redhat.com>
	<1410202048.13625.27.camel@kurenai.local>
	<47B3B0F3-0BC9-41D9-AB5C-FC1027E7B00F@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Does LVM RAID1 have TRIM support?
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
Cc: oranenj+lvm@iki.fi

On Thu, 2014-09-11 at 18:31 -0500, Brassow Jonathan wrote:

> dm-raid.c does not have that - dm-raid1.c does.  dm-raid1.c is a mirroring implementation specific to device-mapper.  It is used by LVM for pvmove functionality (and is otherwise being slowly phased out).  dm-raid.c is the device-mapper wrapper around the MD RAID personalities.  It does not have discard support.
> 
> I will ask Neil what the current state of discard support is in MD.  I see that "support" was added in Oct of 2012 (starting at commit 2ff8cc2), but I remember them having problems with discards + any resync operations.  If Neil says it is ok, I will turn it on.
> 

In the code that I'm looking at dm-raid.c definitely sets
num_discard_bios to 1 on something... As does dm-raid1.c. However,
Thanks for looking into it!


>  brassow
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
