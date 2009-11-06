Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA6DPD81012040
	for <linux-lvm@redhat.com>; Fri, 6 Nov 2009 08:25:13 -0500
Received: from mail2.ontariocreditcorp.com (mail2.ontariocreditcorp.com
	[209.217.204.70])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA6DP52S029957
	for <linux-lvm@redhat.com>; Fri, 6 Nov 2009 08:25:05 -0500
Received: from backoffice.bplinux.com
	(pool-98-118-141-73.bflony.fios.verizon.net [98.118.141.73])
	by mail2.ontariocreditcorp.com (8.12.10/8.12.10) with ESMTP id
	nA6DP4Zv010679
	for <linux-lvm@redhat.com>; Fri, 6 Nov 2009 08:25:04 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by backoffice.bplinux.com (Postfix) with ESMTP id 82AB83E8002
	for <linux-lvm@redhat.com>; Fri,  6 Nov 2009 08:22:54 -0500 (EST)
Received: from backoffice.bplinux.com ([127.0.0.1])
	by localhost (backoffice.bplinux.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 5vOLJzACmIFn for <linux-lvm@redhat.com>;
	Fri,  6 Nov 2009 08:22:50 -0500 (EST)
Received: from backoffice.bplinux.com (backoffice.bplinux.com [192.168.1.4])
	by backoffice.bplinux.com (Postfix) with ESMTP id 0574E3E8001
	for <linux-lvm@redhat.com>; Fri,  6 Nov 2009 08:22:49 -0500 (EST)
Date: Fri, 6 Nov 2009 08:22:49 -0500 (EST)
From: Christopher Hawkins <chawkins@bplinux.com>
Message-ID: <18509991.541257513769674.JavaMail.javamailuser@localhost>
In-Reply-To: <30734004.271257449907251.JavaMail.javamailuser@localhost>
Subject: Re: [linux-lvm] kernel panic on lvcreate
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Updated to 2.6.18-164.6.1.el5, same crash. Stuart, can you post a link to your bug report if you do one? And if not, please let me know and I will work on one. 

Thanks!

Christopher Hawkins

----- "Christopher Hawkins" <chawkins@bplinux.com> wrote:

> I have not, but I can within a few hours. Will post the results.
> 
> Christopher Hawkins
> 
> ----- "Stuart D. Gathman" <stuart@bmsi.com> wrote:
> 
> > On Wed, 4 Nov 2009, Stuart D. Gathman wrote:
> > 
> 
> > Anyone tested the new 164.6.1 kernel release to see if this crasher
> is
> > fixed?
> > The changelog doesn't mention anything that sounds like it. 
> > (Regressions
> > are usually fixed quickly.)
> > 
> > Has this been reported?  If 164.6.1 still has the problem, I can
> work
> > on a bug report.
> > 
> > -- 
> > 	      Stuart D. Gathman <stuart@bmsi.com>
> >     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> > 591-6154
> > "Confutatis maledictis, flammis acribus addictis" - background song
> > for
> > a Microsoft sponsored "Where do you want to go from here?"
> > commercial.
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
