Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u67IAJIM027873
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 7 Jul 2016 14:10:19 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A5FB3B741
	for <linux-lvm@redhat.com>; Thu,  7 Jul 2016 18:10:17 +0000 (UTC)
Received: from mfilter35-d.gandi.net (mfilter35-d.gandi.net [217.70.178.166])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 2411AA80DB
	for <linux-lvm@redhat.com>; Thu,  7 Jul 2016 20:10:15 +0200 (CEST)
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter35-d.gandi.net (mfilter35-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id dTkjQx6ZWa5i for <linux-lvm@redhat.com>;
	Thu,  7 Jul 2016 20:10:13 +0200 (CEST)
Received: from kurenai.local (dsl-trebrasgw2-50de90-144.dhcp.inet.fi
	[80.222.144.144]) (Authenticated sender: oranenj@gensoukyou.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 747C2A80D0
	for <linux-lvm@redhat.com>; Thu,  7 Jul 2016 20:10:13 +0200 (CEST)
References: <c6001912-30cb-11a8-0481-4689718155cd@yahoo.co.uk>
From: Jarkko Oranen <oranenj@iki.fi>
Message-ID: <e8765cf9-f990-1030-7ea8-fe4187d691b1@iki.fi>
Date: Thu, 7 Jul 2016 21:10:12 +0300
MIME-Version: 1.0
In-Reply-To: <c6001912-30cb-11a8-0481-4689718155cd@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove and filesystem - un/mount?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com



On 07/07/16 19:01, lejeczek wrote:
> hi users,
>
> must be an easy one - what should be(is allowed to do) filesystem 
> doing while there is a pvmove(failed hard disk) taking place in 
> underlying LV?
>
> many thanks,

Hi,

pvmove is generally transparent to the layers above, so you can continue 
using the system as usual while a pvmove is in progress. While I have 
never seen pvmove actually fail (My desktop encountered a power failure 
mid-operation once, and it just continued as if nothing had happened 
after rebooting), with a failing hard disk, I would avoid any additional 
IO while the operation is in progress.



--
Jarkko
