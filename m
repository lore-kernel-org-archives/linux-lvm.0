Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAD0xAih025516
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 19:59:10 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAD0wtH3016589
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 19:58:55 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAD0wsYL002762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 19:58:55 -0500
Message-ID: <4CDDE2CE.90907@bmsi.com>
Date: Fri, 12 Nov 2010 19:58:54 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>	<4CDDBF95.9040104@q7.com>
	<4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
In-Reply-To: <AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
To: linux-lvm@redhat.com

On 11/12/2010 07:17 PM, chris (fool) mccraw wrote:
> still curious about Zumastor--does anyone use this in production?
Zumastor would not speed up a single snapshot.  It solves the problem of
supporting multiple (as in lots of) snapsnots with the same performance
as a single snapshot (so that taking a snap every 5mins becomes
practical).  BTW, rewriting that 1G file would be normal speed, since
the modified chunks have already been copied to the snapshot.
