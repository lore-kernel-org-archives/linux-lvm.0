Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n09Ho4Q6000388
	for <linux-lvm@redhat.com>; Fri, 9 Jan 2009 12:50:04 -0500
Received: from mo-p00-ob.rzone.de (mo-p00-ob.rzone.de [81.169.146.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n09HnkWD003985
	for <linux-lvm@redhat.com>; Fri, 9 Jan 2009 12:49:47 -0500
Received: from [192.168.255.25] (p57916A64.dip.t-dialin.net [87.145.106.100])
	by post.strato.de (klopstock mo52) (RZmta 18.8)
	with ESMTP id B042b3l09Hd5UE for <linux-lvm@redhat.com>;
	Fri, 9 Jan 2009 18:49:46 +0100 (MET)
Subject: Re: [linux-lvm] Please help, [Incorrect metadata area header checksum]
From: Ralf Sparr <lvm@soulsweeper.org>
In-Reply-To: <FD632E0A-0460-4148-9B47-5B4590F5B4A8@redhat.com>
References: <1230986630.9671.40.camel@fraws70-gentoo>
	<FD632E0A-0460-4148-9B47-5B4590F5B4A8@redhat.com>
Date: Fri, 09 Jan 2009 18:49:36 +0100
Message-Id: <1231523376.7947.54.camel@fraws70-gentoo>
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


Jonathan,

thanks for the reply. I fixed the problem with 'pvcreate' & 
'vgcfgrestore'. The real problem sat in front of the keyboard
(as always :) ). I missed an argument for pvcreate. 
I didn't specify my physicalvolume, instead I put my vgname
'alice' instead of /dev/loop as an argument. After that, I
run vgcfgrestore and everything is fine again :)

Ralf

> On Wed, 2009-01-07 at 14:43 -0600, Jonathan Brassow wrote:
> Could you do a 'pvscan -vvvv' and post (attach) the output?
> 
> You could also copy the first several MB of the PVs that compose  
> "alice".  We could then either look directly at them, or you could  
> feel free to be more brave with #2 and #3 below - given that you will  
> have a backup of the front of each disk.
> 
>   brassow
> 
> On Jan 3, 2009, at 6:43 AM, me wrote:
> 
> > Hello list,
> >
> > i've got a (hopefully not) serious problem with my lvm installation.
> >
> > I did some changes in my XEN-networking and wanted to reboot my  
> > server.
> > For this I did shutdown every DOM-U and tried to stop lvm with  
> > 'vgchange
> > -a n'. At this point lvm states 'Incorrect metadata area header
> > checksum', before this every worked fine. I tried to start lvm
> > immediately without success, a reboot didn't help either.
> > I searched the net (almost two days now) for a solution, without
> > success.
> >
> > 1) It's not a filter-issue (lvm.conf), only loop-devices are scanned.
> > 2) vgcfgrestore doesn't work either (tried only testrun)
> > 3) pvcreate --uuid xxx --restorefile /etc/lvm/archive/xxx_00039.vg xxx
> > says, the uuid is already in use on /dev/loopX (correct device). I
> > didn't try the '--force'-option, I'm a coward at last :(
> >
> > The last change (and reboot) was in november. I added two new drives  
> > and
> > growed the raid, rebooted the server and growed one lv. All without  
> > any
> > error. There's only one PV.
> >
> > If you need any information (configs etc), I'll post everything ;)
> >
> >
> > --- snip ---
> >
> > $>pvscan
> >  Incorrect metadata area header checksum
> >  Incorrect metadata area header checksum
> >  WARNING: Volume Group alice is not consistent
> >  PV /dev/loop53   VG alice   lvm2 [6.37 TB / 408.57 GB free]
> >  Total: 1 [376.57 GB] / in use: 1 [376.57 GB] / in no VG: 0 [0   ]
> >
> >
> > Any help is appreciated!
> >
> > greets
> > ralf
> >
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
