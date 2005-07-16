Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6GGRtV25599
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 12:27:55 -0400
Received: from prix.pricom.com.au (80-166.dsl.connexus.net.au [203.222.80.166])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j6GGRkI1004013
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 12:27:49 -0400
Date: Sat, 16 Jul 2005 16:27:40 +0000
From: Philip Rhoades <phil@pricom.com.au>
Subject: Re: [linux-lvm] lvm and reducing vols/ext3
References: <5A14AF34CFF8AD44A44891F7C9FF4105046D643A@usahm236.amer.corp.eds.com>
In-Reply-To: <5A14AF34CFF8AD44A44891F7C9FF4105046D643A@usahm236.amer.corp.eds.com>
	(from mark.post@eds.com on Sat Jul 16 06:06:37 2005)
Message-Id: <1121531260l.9382l.0l@prix.pricom.com.au>
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Mark,

OK, but doesn't the same argument apply to non-root file systems? -  
don't I still have to resize the file system as well as resizing the LV?

I can see that LVs might be quite convenient spread over multiple  
physical drives but I can't see that much advantage on one drive . .

Thanks,

Phil.


On 2005.07.16 06:06, Post, Mark K wrote:
> I've always recommended not having the root file system on a logical
> volume.  For reasons other than this, but my advice still stands.
> 
> 
> Mark Post
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com  
> [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Philip Rhoades
> Sent: Friday, July 15, 2005 4:02 PM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] lvm and reducing vols/ext3
> 
> 
> People,
> 
> I have looked around at the docs and googled and it seems if I want to
> 
> reduce a root vol/partition I have to:
> 
> - boot on an emergency CD
> 
> - resize the root ext3 partition
> 
> - reduce the lv
> 
> Isn't this process just making the exercise more complicated than it
> would have been if I didn't have LVs?
> 
> Thanks,
> 
> Phil.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> 

-- 
Philip Rhoades

Pricom Pty Limited  (ACN 003 252 275  ABN 91 003 252 275)
GPO Box 3411
Sydney NSW	2001
Australia
Mobile:  +61:(0)411-185-652
Fax:     +61:(0)2-8221-9599
E-mail:  phil@pricom.com.au
