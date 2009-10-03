Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n93LP28P009316
	for <linux-lvm@redhat.com>; Sat, 3 Oct 2009 17:25:02 -0400
Received: from destar.net (mail.destar.net [12.12.38.18])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n93LOpE0006065
	for <linux-lvm@redhat.com>; Sat, 3 Oct 2009 17:24:52 -0400
Subject: Re: [linux-lvm] "Incorrect metadata area header checksum" after a
	pvmove and pvresize
From: Jon <jonr@destar.net>
In-Reply-To: <d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
References: <d60517f30909222050j77b16ce7x769f442043151bbd@mail.gmail.com>
	<d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
Date: Sat, 03 Oct 2009 13:24:42 -0800
Message-Id: <1254605082.5426.3.camel@laptop-jr.destar.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: jonr@destar.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Thu, 2009-09-24 at 03:55 +0000, Thiago Nunes wrote:
> Hi guys.
> 
> Excuse my english, I'm from Brazil.
> 
> Last day I pvresized the pv who had my vg and after a reboot I
> couldn't activate my vg anymore. I got the message "Incorrect metadata
> area header checksum".
> 
> The whole history:
> 
> My HD had a sda3 pv that had my whole vg. It's had around 55GB. Some
> days ago, because of an emergency situation, I transformed a 6GB
> partition (sda5) into an LVM pv and added it to the vg. Now to
> organize my HD I liberated space after sda5 and wanted to expand my
> sda3 to the end of my 80GB disk.
> 
> Then I took an auxiliar hard drive, booted my machine with system
> rescue cd, created a small sdb1 in the begining to temporary store the
> contents of sda5, pvcreated sdb1, "vgextend vg /dev/sdb1" and
> "pvmove /dev/sda5". 

Did you do a pvmove /dev/sda5 or pvmove /dev/sda5 /dev/sdb1?

Jon
