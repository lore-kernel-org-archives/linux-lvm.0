Received: from [10.10.55.124] (vpn-55-124.rdu2.redhat.com [10.10.55.124])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6IFowRi012427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2016 11:50:59 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <96ed1c73-85ca-f20d-f249-cf1d775c0a92@yahoo.co.uk>
Date: Mon, 18 Jul 2016 10:50:58 -0500
Message-Id: <E1976556-4D69-443C-ACB2-23A186D9A624@redhat.com>
References: <96ed1c73-85ca-f20d-f249-cf1d775c0a92@yahoo.co.uk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] export/migrate - but only a LV - how?
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

maybe pvmove the LV to a unique device and then vgsplit?

 brassow

> On Jul 12, 2016, at 10:23 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
> 
> .. if possible?
> 
> hi users,
> 
> I'd like to ask, while reading different docs, whether it's possible to migrate/export just a LV?
> 
> What I'm hoping to achieve is to take a LV out of a VG and move it over to another system so a can restore that LV and carry on using it, while having a reduced VG on original, source system.
> 
> I see there some docs tell how to do a VG, how only a LV can be migrated?
> 
> many thanks
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
