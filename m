Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i25ATY801720
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 05:29:34 -0500
Received: from gw.mml.usyd.edu.au (client-101.mml.usyd.edu.au [129.78.188.101])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i25ATWb17536
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 05:29:33 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gw.mml.usyd.edu.au (Postfix) with ESMTP id EC401465F
	for <linux-lvm@redhat.com>; Fri,  5 Mar 2004 21:27:55 +1100 (EST)
Received: from gw.mml.usyd.edu.au ([127.0.0.1])
 by localhost (gw.mml.usyd.edu.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06916-04 for <linux-lvm@redhat.com>;
 Fri,  5 Mar 2004 21:27:55 +1100 (EST)
Received: from prog.mml.usyd.edu.au (prog.mml.usyd.edu.au [192.168.1.3])
	by gw.mml.usyd.edu.au (Postfix) with ESMTP id 71E1B465A
	for <linux-lvm@redhat.com>; Fri,  5 Mar 2004 21:27:55 +1100 (EST)
From: Franc Carter <franc@mml.usyd.edu.au>
Subject: Re: [linux-lvm] LVM Multi Path Support
Message-ID: <20040305102755.GA16780@prog.mml.usyd.edu.au>
References: <20040303190349.14912.qmail@web60910.mail.yahoo.com> <20040304093054.GS662@reti> <200403051112.38529.franc@tech.sirca.org.au> <20040305090741.GD744@reti>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040305090741.GD744@reti>
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
Date: Fri Mar  5 16:35:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Ahh, that makes sense (the undefined first PV) and explains
why the 'current-controller' is not the 'default-controller'
for one of the LUNs

It doesn't seem to matter if it uses the other device. I think it
just causes the array to do a tresspass and swap controllers. The
downside being that I can't reliably balance the I/O across the
two controllers. But that's not catastrophic.

I'm using lvm1, which I don't beleive has an lvm.conf - correct ?

thanks


On Fri, Mar 05, 2004 at 09:07:41AM +0000, Joe Thornber wrote:
> On Fri, Mar 05, 2004 at 11:12:38AM +1100, Franc Carter wrote:
> > LVM appears to do the 'right thing for me' in that it recognises
> > that the the two PVs are one (I assume via the UUID) and ignore
> > the second LUN.
> 
> Yes, LVM writes a label to the start of a PV to identify it.
> 
> > I'd like to know if this is just good luck, or if it's behaviour
> > I can rely ?
> 
> I don't think it's defined which of the 2 devices LVM will choose,
> does this matter ?  If so you could always set up a filter in lvm.conf
> to remove one (probably advisable anyway).
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
