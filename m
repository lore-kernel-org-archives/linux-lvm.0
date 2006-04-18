Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3II17xp016998
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 14:01:07 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3II10DG025619
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 14:01:01 -0400
Message-ID: <4445294D.6050500@conterra.de>
Date: Tue, 18 Apr 2006 20:00:45 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] physical volume smaller than partition?
References: <AAB83747-D6F3-4148-9836-7E22B8AD9ABF@isg.si>
In-Reply-To: <AAB83747-D6F3-4148-9836-7E22B8AD9ABF@isg.si>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Martin Gombac wrote
> and noticed 277.60 GB != 291.08..GB. So my question is where did the 
> rest of disk space went to?

it depends on counting "kilo" as 1000 or 1024.
This happens even twice for kb -> mb -> gb.

Thus:  277.60 * 1.024 * 1.024 = 291.08

Memory capacity is calculated using 1024 where as disk manufacturer
like using 1000, as this results in bigger numbers
(but does not result in more space :-(

Dieter.
