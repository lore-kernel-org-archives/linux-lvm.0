Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t38GMetG016366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 8 Apr 2015 12:22:40 -0400
Received: from smtp-relay2.uniserve.net (smtp-relay2.uniserve.net
	[216.210.109.132])
	by mx1.redhat.com (Postfix) with ESMTPS id B70938E3EB
	for <linux-lvm@redhat.com>; Wed,  8 Apr 2015 16:22:39 +0000 (UTC)
Message-ID: <20150408085334.725013jx13pxhfr2@webmail.uniserve.com>
Date: Wed, 08 Apr 2015 08:53:34 -0700
From: Dave Stevens <geek@uniserve.com>
References: <1428468634.31919.250585153.41525C63@webmail.messagingengine.com>
	<5525331B.20604@redhat.com>
	<1428506200.875940.250771177.6EF89B58@webmail.messagingengine.com>
In-Reply-To: <1428506200.875940.250771177.6EF89B58@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to lvcreate _new_ LVs on existing VG with
 existing LVs and plenty of room?
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, lyndat3@your-mail.com


>
>> 18446744071795900416 - this is an interesting number, actually it is
>> 2**64 - 1825 * 2**20.

well yes, that's obvious, why didn't I think of that....
