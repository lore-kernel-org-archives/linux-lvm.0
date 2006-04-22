Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MHUEMT025628
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:30:14 -0400
Received: from smtp-out2.email.it (smtp-out2.email.it [80.247.70.37])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3MHUCmW032465
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 13:30:12 -0400
Received: from [192.168.2.2] (host161-56.pool8711.interbusiness.it
	[87.11.56.161])by smtp-out2.email.it (Email.it) with ESMTP id
	12C2D1BC354for <linux-lvm@redhat.com>;
	Sat, 22 Apr 2006 19:30:13 +0200 (CEST)
Subject: Re: [linux-lvm] Existing VG (created here) takes precedence over VG
From: Simone Gotti <simone.gotti@email.it>
In-Reply-To: <444A6634.5050406@admin-box.com>
References: <4449E411.7050505@admin-box.com><444A6634.5050406@admin-box.com>
Date: Sat, 22 Apr 2006 19:30:16 +0200
Message-Id: <1145727017.2819.1.camel@localhost>
Mime-Version: 1.0
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

On Sat, 2006-04-22 at 19:21 +0200, Daniel Troeder wrote:
> Hi :)
> 
> It seems, that the unstable version of lvm2 caused the problem. Maybe
> that's also the case for Moshe (also running gentoo).
> 
> I was running 2.01.09 and later 2.02.02, and that seems OK, but when
> upgrading to 2.02.04 I got the problem (see posting "[linux-lvm]
> Existing VG (created here) takes precedence over VG").
> 
> I downgraded to 2.01.09, and everything's fine now :)
> 
> If somebody wants me to debug something, or wants to know further info
> about my setup, feel free to mail me.

The problem was fixed yesterday in CVS. You can look at this thread:

https://www.redhat.com/archives/linux-lvm/2006-April/msg00084.html
> 
> Bye,
> the-happy-Daniel :)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

 
 
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
 
 Sponsor:
 SuperEnalotto online: 35.000.000 milioni di Euro. Gioca subito la tua schedina online! 
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=5062&d=22-4
