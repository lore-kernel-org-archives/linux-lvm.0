Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0TIQj9f005194
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 13:26:45 -0500
Received: from n22.bullet.mail.ukl.yahoo.com (n22.bullet.mail.ukl.yahoo.com
	[87.248.110.139])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o0TIQVZW002102
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 13:26:32 -0500
Message-ID: <359398.31635.qm@web87102.mail.ird.yahoo.com>
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
	<4B62A89E.5060201@redhat.com>
Date: Fri, 29 Jan 2010 18:26:31 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <4B62A89E.5060201@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] alternative to pvmove on root volume
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
Content-Type: text/plain; charset="us-ascii"
To: Milan Broz <mbroz@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

> On 01/28/2010 09:11 PM, chris procter wrote:

> > pvmove has a nasty habit of deadlocking the machine when used on root
> > volumes.
> 
> please report bug then, with system configuration (lvmdump)
> and process backtrace (log from echo t>/proc/sysrq-trigger)
> when it deadlocks.
> 
> pvmove should work for moving root volume
> (except some special situations, like when you increase log level
> and log itself is on moved LV)
> 
> (And I used pvmove several times myself to move system disk to another
> without any problems on RHEL5.3)

Unfortuately this project is mostly RHEL4 boxes (its an old SAN, nothing new has been added to it in a couple of years) and so thats what I've been testing with (RHEL4.5 to be precise) so if you really want me too I'll file a bug but I'm pretty sure it will just get closed with "upgrade to a modern version of lvm" :)

chris



      
