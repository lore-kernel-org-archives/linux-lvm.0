Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3KFY2p05185
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 11:34:02 -0400
Received: from gw-nl3.philips.com (gw-nl3.philips.com [161.85.127.49])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3KFY1Mc029661
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 11:34:01 -0400
Received: from smtpscan-nl2.philips.com (smtpscan-nl2.philips.com
	[130.139.36.22])
	by gw-nl3.philips.com (Postfix) with ESMTP id D6F192B37B
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:34:00 +0200 (MEST)
Received: from smtpscan-nl2.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 4BB1C19C4C
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:34:00 +0200 (MEST)
Received: from smtprelay-nl2.philips.com (smtprelay-eur2.philips.com
	[130.139.36.35])
	by smtpscan-nl2.philips.com (Postfix) with ESMTP id 7587919C4E
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:33:59 +0200 (MEST)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125]) 
	by smtprelay-nl2.philips.com (8.9.3p3/8.8.5-1.2.2m-19990317) with ESMTP
	id RAA22361
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:33:59 +0200 (MEST)
From: darren.miller@philips.com
Subject: Re: [linux-lvm] LVM2-Snapshot 2.6.5 with udm2
Message-ID: <OF637C0467.54CC8854-ON80256E7C.00553819-80256E7C.00558141@philips.com>
Date: Tue, 20 Apr 2004 16:32:07 +0100
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>





Thanks Christophe, whats LKML? do you have a link?

I am guessing maybe, Linux Kernel Mailing List?

==============================================================================

Darren Miller
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681


                                                                                                                                      
                                                                                                                                      
                                                   To:   LVM general discussion and development <linux-lvm@redhat.com>                
                                                   cc:   (bcc: Darren Miller/SOU/SC/PHILIPS)                                          
                                                   Subject:    Re: [linux-lvm] LVM2-Snapshot 2.6.5 with udm2                          
                                                                                                                                      
               Christophe Saout                    Classification:                                                                    
               <christophe@saout.de>                                                                                                  
                                                                                                                                      
               Sent by:                                                                                                               
               linux-lvm-bounces@redhat                                                                                               
               .com                                                                                                                   
                                                                                                                                      
               19/04/2004 15:21                                                                                                       
               Please respond to LVM                                                                                                  
               general discussion and                                                                                                 
               development                                                                                                            
                                                                                                                                      
                                                                                                                                      




Am Mo, den 19.04.2004 schrieb darren.miller@philips.com um 14:16 Uhr
+0100:

> it would appear that xfs_freeze is the source of my problems, LVM2
doesn't
> appear to work well with SGI's XFS, unless there is a tool version issue
> here, or do I not need to do xfs_freeze with LVM2?

Christoph Hellwig has a set of patches ready that fix the problem. He
posted them some days ago, you can search on the LKML archive.


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
