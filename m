Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7BJkrCd032442
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 15:46:54 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7BJkoo0007362
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 15:46:51 -0400
Received: from anubis.ankh.org ([172.22.128.3])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1T0HLY-0006hT-G6
	for linux-lvm@redhat.com; Sat, 11 Aug 2012 20:27:40 +0100
Message-ID: <5026B6A1.9040008@ankh.org>
Date: Sat, 11 Aug 2012 20:46:41 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <50267B69.7090505@mglug.de>
In-Reply-To: <50267B69.7090505@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] sparse copy i.e. /dev/sda3 -> /dev/mvlvm/mythinpool?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I no longer have it however I wrote a program to resparse files a long 
time ago. what it did was read a block of data, if it was zero it did 
nothing, if it had data it seeked to the beginning of where the data is 
and then wrote it, and when it got to the end it seeked to the end.

James

On 11/08/2012 16:34, Oliver Rath wrote:
> Hi list,
>
> is it possible, to copy a real device like /dev/sda3 to a thinpool
> device in a sparse way? I tried several things like dd_rescue -a .. ,
> but there was no sparse-effect :-(
>
> Any hints?
>
> Tfh!
>
> Oliver
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> -----
> No virus found in this message.
> Checked by AVG - www.avg.com
> Version: 2012.0.2197 / Virus Database: 2437/5192 - Release Date: 08/10/12
