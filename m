Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2JJsWxV020880
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 15:54:32 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2JJsNsc003243
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 15:54:23 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1NsiGr-0005m9-Mv
	for linux-lvm@redhat.com; Fri, 19 Mar 2010 12:54:15 -0700
Date: Fri, 19 Mar 2010 14:54:24 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4BA3C87C.7020608@cfl.rr.com> (from psusi@cfl.rr.com on Fri Mar
	19 13:54:52 2010)
Message-Id: <1269028464.22396.2@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Data alignment
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> Then I waste 512k on the MBR, and another 512k on the pv header.
> I'd like to avoid that if possible and it seems like --dataalignoffset
> should let me do that, but it doesn't accept negative numbers.

    1 MB "wasted" on a 160,000 MB SDD = 99.999375% efficiency.
Inversely, that's 0.000625% "wasted", worth roughly 1/5 of
1 penny US, or $0.0002.  Your time spent thinking about it - $25.
Also, 10,000 sysadmins on this list X 2 minutes = 3333 hours X
$100/hour = $333,333.  I'd burn the 1MB and move on.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 03/19/2010 01:54:52 PM, Phillip Susi wrote:
> On 3/19/2010 2:36 PM, Eugene Vilensky wrote:
> > Align the partition?
> 
> Then I waste 512k on the MBR, and another 512k on the pv header.  I'd
> like to avoid that if possible and it seems like --dataalignoffset
> should let me do that, but it doesn't accept negative numbers.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
