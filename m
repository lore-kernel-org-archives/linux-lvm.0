Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0574317A76
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 10:27:42 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D913280F6D
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 10:27:40 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 864CD40C0A27
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 12:27:39 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 16 Apr 2017 12:27:39 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <c896c680a406c4b3b788b244c3d05948@xenhideout.nl>
References: <c896c680a406c4b3b788b244c3d05948@xenhideout.nl>
Message-ID: <9df445a42e58af4a5b73889456c672bb@xenhideout.nl>
Subject: Re: [linux-lvm] thin volume usage report
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
To: Linux lvm <linux-lvm@redhat.com>

Xen schreef op 16-04-2017 11:47:

> This script will take a thin pool as a parameter (or search for all 
> existing)
> and obtain all non-snapshot volumes.

Currently though it will paste the reports together in parallel if it 
finds more than one pool :p

      name             pct      size        name             pct      
size
      ------------------------------        
------------------------------
      crazy             0%     0.00m        data          38.66%    
15.43g
      ------------------------------ +      home           8.22%     
3.28g
      total             0%     0.00m        sites         33.55%    
13.39g
                                            
------------------------------ +
      reported       0.00%     0.00m        total         80.43%    
32.11g
      available    100.00%    32.00m
      ------------------------------ +      reported      80.50%    
32.13g
      full size    100.00%    32.00m        available     19.50%     
7.78g
                                            
------------------------------ +
                                            full size    100.00%    
39.91g

I don't know how many thin pools people might have :p.

I guess I should make a number of forms available but it is so much work 
:p.

Lol.

Current version is at : 
http://www.xenhideout.nl/scripts/thin_size_report.sh.txt

Running it will crash your system and send your brain contents to NASA.

But it might also produce the above output or something similar.

It needs access to /sbin/lvs and /sbin/vgdisplay but I guess there is 
really only one binary.
