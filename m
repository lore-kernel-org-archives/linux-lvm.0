Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i250DQ812850
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 19:13:26 -0500
Received: from gw.mml.usyd.edu.au (client-101.mml.usyd.edu.au [129.78.188.101])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i250DOb11445
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 19:13:25 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gw.mml.usyd.edu.au (Postfix) with ESMTP id 0D16F465A
	for <linux-lvm@redhat.com>; Fri,  5 Mar 2004 11:11:48 +1100 (EST)
Received: from gw.mml.usyd.edu.au ([127.0.0.1])
 by localhost (gw.mml.usyd.edu.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04977-04 for <linux-lvm@redhat.com>;
 Fri,  5 Mar 2004 11:11:47 +1100 (EST)
Received: from cerebus.mml.usyd.edu.au (cerebus.mml.usyd.edu.au [192.168.1.82])
	by gw.mml.usyd.edu.au (Postfix) with ESMTP id 808614651
	for <linux-lvm@redhat.com>; Fri,  5 Mar 2004 11:11:47 +1100 (EST)
From: Franc Carter <franc@tech.sirca.org.au>
Subject: Re: [linux-lvm] LVM Multi Path Support
References: <20040303190349.14912.qmail@web60910.mail.yahoo.com> <20040304093054.GS662@reti>
In-Reply-To: <20040304093054.GS662@reti>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200403051112.38529.franc@tech.sirca.org.au>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar  4 19:11:08 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I have a related question.

I have just set up LVM on the LUNS from a HDS-9570 with a
qla-2300 driver in failover mode. This results in each
LUN being exposed to the operating system twice, once for
each controller. However when a controller fails the
card transparently maps the requests to the secondary
controller so that the original scsi target still works.

LVM appears to do the 'right thing for me' in that it recognises
that the the two PVs are one (I assume via the UUID) and ignore
the second LUN.

I'd like to know if this is just good luck, or if it's behaviour
I can rely ?

thanks

On Thursday 04 March 2004 20:30, Joe Thornber wrote:
> On Wed, Mar 03, 2004 at 04:03:49PM -0300, Eduardo Dias wrote:
> > Dear All,
> >  
> > I would like to know if LVM Linux has (or will) support to multi path 
links?
> 
> There is a v. old patch kicking around that adds some sort of multipath
> support to LVM1.  Search this list to find it.  It hasn't ever been
> part of an official release.
> 
> LVM2 doesn't support multipath but we're currently developing a
> multipath target for device-mapper, and Christophe Varoqui is writing
> a standalone userland tool to drive it.  The current thinking is that
> the LVM2 tools will just use the devices that Christophes tool
> creates.
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 

-- 
Franc Carter     Ph:61-2-8374-5071      Fax: 61-2-8374-5070
Systems Manager, SIRCA Ltd              http://www.sirca.org.au/

DISCLAIMER: The contents of this email, inclusive of attachments, may
be legally privileged and confidential. Any unauthorised use of the
contents is expressly prohibited. If you have received this message in
error or are not the intended recipient, you should destroy the email
message along with any attachment(s).  Unintended recipients of this
email are prohibited from retaining, disclosing, distributing or using
any information contained herein.  This email is also subject to
copyright. No part of it should be reproduced, adapted or transmitted
without the written consent of the copyright owner.
