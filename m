Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4CCt7Rl017608
	for <linux-lvm@redhat.com>; Wed, 12 May 2010 08:55:07 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4CCjoP0020217
	for <linux-lvm@redhat.com>; Wed, 12 May 2010 08:48:59 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OCBJq-0003QW-Gm
	for linux-lvm@redhat.com; Wed, 12 May 2010 05:45:46 -0700
Date: Wed, 12 May 2010 07:53:33 -0500
From: Ray Morris <support@bettercgi.com>
References: <201005122021190311429@163.com>
In-Reply-To: <201005122021190311429@163.com> (from ouyangmaochun@163.com on
	Wed May 12 07:21:21 2010)
Message-Id: <1273668813.17308.7@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] My root filesystem based on LVM went down.
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

    I'm not sure what "can not nomally start today" means, what
is the error message?  If your question is "how can I make the
LV visible in rescue mode", see "man lvm".  Something like:

lvm pvscan # look to see if the PVs are there.
lvm vgscan # is the volume group detected?
lvm lvscan # are all of the volumes found OK?
lvm vgchange -ay # activate all VGs
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 05/12/2010 07:21:21 AM, ouyangmaochun wrote:
> 
>    My root filesystem is formated as ext3 which is a logical volume  
> ,and it can not nomally start today,how can I fix this problem. I've  
> tried boot into rescue mode(boot through cdrom) and run e2fsck to  
> scan,but in rescue mode there is no logical volume ,what am I  
> surpposed to do in such  circumstances?
> 
> 
> 
> ouyangmaochun
> 2010-05-12
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
