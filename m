Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SBDbO11256
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 07:13:37 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3SBDVgu023963
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 07:13:31 -0400
Received: from 113.red-83-49-30.pooles.rima-tde.net ([83.49.30.113]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DR6xP-0007EI-00
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 13:13:24 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DR6xC-00081M-00
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 13:13:11 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] pvmove hangs
Date: Thu, 28 Apr 2005 13:13:09 +0200
Message-Id: <20050428110649.M93697@pk25.com>
In-Reply-To: <4270B992.50805@nextra.ro>
References: <426F8DD4.1090801@nextra.ro> <20050428094506.M1118@pk25.com>
	<4270B992.50805@nextra.ro>
MIME-Version: 1.0
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

The / partition is diferent.

I am sure that your made the same but your import your vgs in other machine
and you moveit and you don't have problems.

the / patition has the modules, and many info that the systen can't move
becasue are in use (I suppose)....

Where you have the partions boot files?

lrwxrwxrwx    1 root     root           28 Apr 13 21:50 vmlinuz ->
boot/vmlinuz-2.4.30.20050413
lrwxrwxrwx    1 root     root           26 Apr 12 20:20 vmlinuz.old ->
boot/vmlinuz-2.4.30.050412

/dev/hda2              5763648   4796612    674252  88% /

I have kernel files in / :-D, yes I isn't the best way ....

:-|, I think that can be a good question for the developers :-)....

On Thu, 28 Apr 2005 13:23:14 +0300, Gergely Imre wrote
> the main question is, why it keeps hanging when i want to move "/" ? 
> it doesn't even begin to move the PEs. i tried to move some other 
> live partitions while writing on them, and it worked.
> 
> Diaz Rodriguez, Eduardo wrote:
> > too much dificult for me, only have one idea, update lvm to last version and
> > check changelog for some updates about pvmove.
> > 
> > If you solve the problem, please sumarice.
> > 
> > Good Luck!
> > 
> > On Wed, 27 Apr 2005 16:04:20 +0300, Gergely Imre wrote
> > 
> >>let me 'restart' this thread. i ran into another problem. or it's 
> >>the same?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=======================================================================================
En tus apuros y afanes, acude a los refranes. 
=======================================================================================
