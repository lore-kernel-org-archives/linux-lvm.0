Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v076pVm0000702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 7 Jan 2017 01:51:31 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FCD0C0567A3
	for <linux-lvm@redhat.com>; Sat,  7 Jan 2017 06:51:29 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 2A6FE3682C
	for <linux-lvm@redhat.com>; Sat,  7 Jan 2017 07:51:27 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 07 Jan 2017 07:51:27 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <b08533d31b541af265bd284c4dfbad2b@xenhideout.nl>
References: <b08533d31b541af265bd284c4dfbad2b@xenhideout.nl>
Message-ID: <dcfb634ad9c2dfc58cdd35a602277850@xenhideout.nl>
Subject: Re: [linux-lvm] inner VG inside chroot not visible inside chroot
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

Xen schreef op 07-01-2017 1:48:

> Why does it not show the mounted LV in the "lvs" table and why does it
> not show the PV that IS visible in the "lvs" table in the output of
> "vgdisplay -v" ?

I am sorry.

I had followed Zdenek's advice at some point and had edited some config 
file to set filters.

It was no help at the time for whatever reason but I had forgotten I had 
set it and it had made it to the new system. At which point it caused 
the behaviour described above.

Being new to filters I could not imagine what was causing it ;-).

So much time lost again... and my filesystem is now messed up because of 
the way the old LVM (133) was constantly "exchanging" physical volumes.

The filesystem would enter read-only state but not before causing 
gigantic corruption.

Only to files opened or in use at the time (so mostly cache files etc) 
but still.

lost+found now contains 505 files/dirs on this disk.

And now I am left with the task of returning this filesystem to a proper 
state... it doesn't really get better, this life.

Sorry. Another problem to fix and no time for any of it.
