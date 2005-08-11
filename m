Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7BGDTV08582
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 12:13:29 -0400
Received: from basie.internet2.edu (basie.internet2.edu [207.75.164.22])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7BGDTlE004008
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 12:13:29 -0400
Received: from localhost (unknown [127.0.0.1])
	by basie.internet2.edu (Postfix) with ESMTP id B10321CD605
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 12:13:28 -0400 (EDT)
Received: from basie.internet2.edu ([127.0.0.1])
	by localhost (basie.internet2.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03197-04 for <linux-lvm@redhat.com>;
	Thu, 11 Aug 2005 12:13:28 -0400 (EDT)
Date: Thu, 11 Aug 2005 12:13:28 -0400
From: Dan Pritts <danno@internet2.edu>
Subject: Re: [linux-lvm] Mirroring on LVM2
Message-ID: <20050811161328.GB30915@internet2.edu>
References: <38F73029B7ECB644A43CCA6D986DF70902DC261E@SHUSH.partnergsm.co.il>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38F73029B7ECB644A43CCA6D986DF70902DC261E@SHUSH.partnergsm.co.il>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't know if you can do LVM2 on release 3 - i think it needs a 2.6
kernel.

you could use software RAID (md), or for a non-realtime backup you could
rsync to the second disk.  

On Wed, Aug 10, 2005 at 09:10:54PM +0200, Oren Lalush wrote:
> Hi,
> 
> My name is Oren Lalush, and I work for Partner Communications Company in
> Israel (A cellular company).
> 
> I'm running Red Hat Enterprise Linux AS release 3 (Taroon Update 2), and
> I would like to know if can install LVM2 on this version ? and if LVM2
> got a feature to do mirror between disks ? If not, can you suggest on
> other ways to synchronize between disks ?
> 
>  
> 
> Regards,
> 
> Oren Lalush
> 
> Storage Administrator 
> Partner Communications Company Ltd.
> 
> Phon e: +972 54 7815487
> Mobile: +972 54 5619997
> Fax    : +972 54 7814714
> E-mail: oren.lalush@orange.co.il
> 
>  
> 
>  
> 
> 
> 
> ---------------------------------------------------------------------------------------------------------------
> 
> orange mail - Connect to your e-mail anywhere with any handset
> http://www.orange.co.il/web/corporate/app/omailadviser/webform1.aspx
> 
> ---------------------------------------------------------------------------------------------------------------
> This message contains information that may be confidential or privileged.
> If you are not the intended recipient, you may not use, copy or disclose
> to anyone any of the information in this message. If you have received
> this message and are not the intended recipient, kindly notify the sender
> and delete this message from your computer.
> 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


danno
--
dan pritts - systems administrator - internet2
734/352-4953 office        734/834-7224 mobile
