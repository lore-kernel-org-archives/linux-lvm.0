Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4HIRd027974
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 14:27:39 -0400
Received: from mail.ipax.tk (postfix@ipax.tk [213.158.115.2])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4HIRbRm018483
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 14:27:38 -0400
Received: from ipax.tk (raoul.bhatia.at [80.109.78.225])
	by mail.ipax.tk (Postfix) with ESMTP id 4949C86B6C
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 20:27:13 +0200 (CEST)
Message-ID: <40A90413.905@ipax.tk>
Date: Mon, 17 May 2004 20:27:31 +0200
From: raoul bhatia <r.bhatia@ipax.tk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /boot on lvm?
References: <40A72846.5050801@mlug.missouri.edu> <22463-19176@sneakemail.com>
In-Reply-To: <22463-19176@sneakemail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

what about compiling these modules into your kernel, since they are an 
integrated part of your setup?

best regards,
raoul bhatia

Peter Valdemar Morch wrote:

> Running RH9 with /root on LVM gave me no end of headaches when upgrading 
> to 2.6 kernels. Primarily because I had to make a initrd RAM disk image.
> 
> So now it works fine. But next time I set up my own box, I'll make sure 
> that at least /boot and /root are no-frills partitions.
> 
> Peter
> 
> Michael mogmios-at-mlug.missouri.edu |Lists| wrote:
> 
>> Is it okay to put everything, including /boot and other critical Linux 
>> files on an LVM drive? How about swap space?
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 

-- 
____________________________________________________________________
raoul bhatia                              email.    r.bhatia@ipax.tk
- ipax.tk -                               web.    http://www.ipax.tk
chief technician, support                 irc.      #ipax (quakenet)
____________________________________________________________________
