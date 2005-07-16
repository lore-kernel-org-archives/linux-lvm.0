Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6GKFBV24854
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 16:15:11 -0400
Received: from ahmler1.mail.eds.com (ahmler1.mail.eds.com [192.85.154.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6GKF9fv008070
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 16:15:09 -0400
Received: from ahmlir5.mail.eds.com (ahmlir5-2.mail.eds.com [192.85.154.135])
	by ahmler1.mail.eds.com (8.13.4/8.12.10) with ESMTP id j6GKF1WK025228
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 16:15:01 -0400
Received: from ahmlir5.mail.eds.com (localhost [127.0.0.1])
	by ahmlir5.mail.eds.com (8.13.4/8.12.10) with ESMTP id j6GKEA7P008112
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 16:14:10 -0400
Received: from usahm011.amer.corp.eds.com ([130.175.214.152])
	by ahmlir5.mail.eds.com (8.13.4/8.12.10) with ESMTP id j6GKEAjA008107
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2005 16:14:10 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvm and reducing vols/ext3
Date: Sat, 16 Jul 2005 16:13:59 -0400
Message-ID: <5A14AF34CFF8AD44A44891F7C9FF4105046D6477@usahm236.amer.corp.eds.com>
From: "Post, Mark K" <mark.post@eds.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Not really.  Root file systems tend to be _very_ static in terms of
size.  Other file systems are not like that at all.  Being able to
adjust file system sizes "on the fly," so to speak, is a tremendous
help.  Typically, when my team builds systems, we don't allocate all of
the internal storage up front.  We use what we think is needed, and
leave the rest as part of the LVM "pool."  As file systems grow, we can
add to them without a whole lot of effort.  Using fixed partitions to do
the same thing is a lot more painful.


Mark Post

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Philip Rhoades
Sent: Saturday, July 16, 2005 12:28 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] lvm and reducing vols/ext3


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
> linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
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


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
