Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5LB7rj2002906
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 12:07:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BcMeX-0001IP-N6
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 12:07:53 +0100
Date: Mon, 21 Jun 2004 12:07:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 install problem
Message-ID: <20040621110753.GB6302@agk.surrey.redhat.com>
References: <freemail.20040521100005.60543@fm7.freemail.hu>
	<20040621095929.GF12027@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040621095929.GF12027@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> > I have installed device-mapper.1.00.07 and now i try to install LVM2.2.
> > 00.16 but I get this error message!

> Sounds like a missing or out-of-date device-mapper.
 
Yup - you need a userspace device-mapper installation 
newer than 1.00.07 .

Alasdair
-- 
agk@redhat.com
