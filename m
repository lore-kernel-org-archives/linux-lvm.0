Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4M7NckN014006
	for <linux-lvm@redhat.com>; Sat, 22 May 2010 03:23:38 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4M7NR6R016594
	for <linux-lvm@redhat.com>; Sat, 22 May 2010 03:23:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 9882C86FF0
	for <linux-lvm@redhat.com>; Sat, 22 May 2010 09:23:26 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id ib8++NtpnAB0 for <linux-lvm@redhat.com>;
	Sat, 22 May 2010 09:23:21 +0200 (CEST)
Date: Sat, 22 May 2010 09:23:21 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100522072321.GB12294@maude.comedia.it>
References: <4BF5A883.7060503@tlinx.org>
	<20100521051021.GA1412@maude.comedia.it>
	<4BF62CBF.3070702@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BF62CBF.3070702@tlinx.org>
Subject: Re: [linux-lvm] Volume alignment over RAID
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, May 20, 2010 at 11:48:31PM -0700, Linda A. Walsh wrote:
> Luca Berra wrote:
>>> I'm using a RAID 'chunk' size of 64k as suggested by the RAID documentation
>>> and am using 6 disks to create a RAID6, giving 4 units of data/stripe.  Does
>> I suppose by raid you mean md, so i wonder what documentation you were
>> looking at?
> ---
> 	Well, doc in 2 different raid controllers LSI and rocket raid both
> suggest 64K as a unit size (forget, their exact term).
>
>> I think 64k might be small as a chunk size, depending on your array size
>> you probably want a bigger size.
> ---
> 	Really?  What are the trade offs?  Array size well 6 disks and 4 of data.
ok, i trew the stone ..
First we have to consider usage scenarios, i.e. average read and average
write size, large reads benefit from larger chunks, small writes with
too large chunks would still result on whole stripe Read-Modify-Write.

there were people on linux-raid ml doing benchmarks, and iirc using
chunks between 256k and 1m gave better average results

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
