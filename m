Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9U01BKm003851
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 20:01:11 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9U00rQ7006925
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 20:00:53 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1N3evD-0005yR-UQ
	for linux-lvm@redhat.com; Thu, 29 Oct 2009 17:00:52 -0700
Date: Thu, 29 Oct 2009 19:00:51 -0500
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] Best Practices deploying LVM
References: <868096450910291645k49ebb1dfn1e55e5132805011e@mail.gmail.com>
In-Reply-To: <868096450910291645k49ebb1dfn1e55e5132805011e@mail.gmail.com>
	(from jockah@gmail.com on Thu Oct 29 18:45:39 2009)
Message-Id: <1256860851.19833.14@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

    I don't know about a whitepaper, but I can address
your example.

> he makes one volume group for each logical volume (more or less)

    If each one has one volume, that's not exactly a volume
GROUP, is it?  If groups and volumes are basically synomous,
he gives up all the benfits of groups.  In fact, he gives
up most of the benefits of logical volumes, since each PV
has to be in one group, and each VG is one LV, you're left
with one LV per PV - might as well just use partitions
directly.
--
Ray Morris
support@bettercgi.com



On 10/29/2009 06:45:39 PM, Abraham P�rez wrote:
> Hi everyone,
> 
> I'm looking for some whitepapper or similar document to find any kind  
> of
> best practices using LVM.
> 
> For example, usually i make only one volume group in each server and  
> inside
> it I create different logical volumes for different purposes, but  
> talking
> with one colleague, we discover that he makes one volume group for  
> each
> logical volume (more or less)... so my final question is: in  
> performance
> terms, what configuration is more efficient and why?
> 
> Please excuse my writen english, but I don't use it very often.
> 
> Thanks for your attention,
> Abraham P�rez
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
