Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2B3njn06216
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 22:49:45 -0500
Received: from pd4mo1so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2B3ndup001775
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 22:49:39 -0500
Received: from pd2mr1so.prod.shaw.ca
	(pd2mr1so-qfe3.prod.shaw.ca [10.0.141.110]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0ID600F1H58N85N2@l-daemon> for linux-lvm@redhat.com; Thu,
	10 Mar 2005 20:48:23 -0700 (MST)
Received: from pn2ml2so.prod.shaw.ca ([10.0.121.146])
	by pd2mr1so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0ID600KSN58NS870@pd2mr1so.prod.shaw.ca> for
	linux-lvm@redhat.com; Thu, 10 Mar 2005 20:48:23 -0700 (MST)
Received: from [192.168.1.124]
	(S01060050ba84447c.vc.shawcable.net [24.86.200.241])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0ID600L8N58N6N@l-daemon> for linux-lvm@redhat.com; Thu,
	10 Mar 2005 20:48:23 -0700 (MST)
Date: Thu, 10 Mar 2005 19:48:22 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Subject: Re: [linux-lvm] LVM Broken on boot.
In-reply-to: <200503101941.52371.t-rigby@shaw.ca>
Message-id: <200503101948.22955.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <200503101633.54212.t-rigby@shaw.ca>
	<200503101941.52371.t-rigby@shaw.ca>
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
To: linux-lvm@redhat.com

I tried mounting the device manually "mount -t 
reiserfs /dev/4474/storage /storage" and IT WORKED.  It doesnt work without 
specifying the filesystem but at least it works.  I basically removed all 
drives from the lv and removed the info on the drive using pvremove. Then I 
complety restarted from scratch (following the howto at tldp.org) making sure 
I added the devices in the same order as I originally had them.

Thats about all I can offer for advice.  I don't even know if it is dangerous 
to do it this way or not but it worked for me, maybe it will work for someone 
else one day also.

Terry

On March 10, 2005 07:41 pm, Terry Rigby wrote:
> Well, I might be somewhere now but I might have also screwed up all my data
> on the device.  I fixed the initial problem and ended up having to
> basically start fron scratch to create the LV again.  I didnt format
> anything, the only thing I did havnt to do with a filesystem was to do
> resize_reiserfs -f /dev/4474/storage.  All went fine except when I try to
> mount the device.
>
> mount /dev/4474/storage (setup in my fstab)
>
> mount: wrong fs type, bad option, bad superblock on /dev/4474/storage,
>        or too many mounted file systems
>
> :(  Dont know where to go from here
> :
> >Re: [linux-lvm] LVM Broken on boot.
> >(Sam Vilain, Thu Mar 10 18:48:40 2005)
> >Hmm, that looks nasty.  You might get somewhere using the -P option to the
> >commands... something like
> >
> >vgscan -P
> >vgchange -P -ay
> >vgreduce --removemissing myvg
> >
> >Please follow-up to the list on success!
> >
> >Sam.
>
> On March 10, 2005 04:33 pm, Terry Rigby wrote:
> > Today I rebooted my system and upon reboot my LVM wouldnt mount saying
> > "you must specify filesystem".  So I tried specifying the filesystem and
> > I got the error "mount: special device /dev/4474/storage does not exist".
> >
> > I am pretty new to LVM so I did some googling and found that pvscan
> > should show my PV's.  This returned the following;
> > fileserver:~# pvscan
> >   Couldn't find device with uuid
> > 'pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4'. Couldn't find device with uuid
> > 'pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4'. Couldn't find device with uuid
> > 'pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4'. PV /dev/hda2        VG 4474  
> > lvm2 [18.18 GB / 18.18 GB free]
> >   PV /dev/hdb         VG 4474   lvm2 [74.52 GB / 74.52 GB free]
> >   PV /dev/hdc         VG 4474   lvm2 [74.52 GB / 74.52 GB free]
> >   PV unknown device   VG 4474   lvm2 [74.52 GB / 74.52 GB free]
> >   Total: 4 [241.75 GB] / in use: 4 [241.75 GB] / in no VG: 0 [0   ]
> >
> > the "unknown" device is /dev/hdd.  When I have a look at /dev/hdd using
> > pvdisplay it shows the following.
> > fileserver:~# pvdisplay /dev/hdd
> >   --- Physical volume ---
> >   PV Name               /dev/hdd
> >   VG Name               4474
> >   PV Size               74.52 GB / not usable 0
> >   Allocatable           yes
> >   PE Size (KByte)       4096
> >   Total PE              19078
> >   Free PE               19078
> >   Allocated PE          0
> >   PV UUID               pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4.
> >
> > I really have no idea where to go from here.  Thanks to anyone that
> > responds. I'll keep the mailing list updated for archiving purposes.
> >
> > Terry Rigby
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
