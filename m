Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1A9KlRm002341
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2010 04:20:48 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1A9Kbo8012870
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2010 04:20:38 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1Nf8kP-0006XR-2T
	for linux-lvm@redhat.com; Wed, 10 Feb 2010 01:20:37 -0800
Date: Wed, 10 Feb 2010 03:20:36 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4B725455.1010109@tlinx.org> (from lvm@tlinx.org on Wed Feb 10
	00:38:13 2010)
Message-Id: <1265793636.27966.3@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvextend docmentation vs. implementation
 (lvm2-2.02.39), Suse-11.1
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

> It fails with: Invalid argument +5%LV

    You'd need to send the WHOLE command line you used
in order for us debug it for you, not just a couple of
characters from it.  That is, however, enough to see
a couple of problems you have.  This document may help
you solve two of your problems:
https://www.bettercgi.com/gpl/smart-questions.html

    I'm also going to guess that you tried throwing
"+5%LV" out there in the middle of the command line
rather than as the argument to -l.  The man
page says:

{
   -l/--extents   [+]LogicalExtentsNumber[%{VG|LV|PVS|FREE}]  |
   -L/--size [+]LogicalVolumeSize[kKmMgGtT]
}
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 02/10/2010 12:38:13 AM, Linda A. Walsh wrote:
> I have been trying to use the lvextend command using the documented
> size format:  of +[number][%{LV|PV|VG|FREE}] --
> specifically
> +50%LV.
> 
> tried multiple variations on LV -- no luck.  Is this broken or
> is this just not working in my setup, or am I doing something
> wrong?  It fails with:
> Invalid argument +5%LV
> Error during parsing of command line.
> 
> Advice?
> thanks,
> -linda
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
