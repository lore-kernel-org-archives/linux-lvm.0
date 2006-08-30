Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7U28tMQ027967
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 22:08:55 -0400
Received: from swlx166.swmed.edu (swlx166.swmed.edu [199.165.152.166])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7U28nde003049
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 22:08:49 -0400
Received: from peters.swmed.org ([129.112.118.137])
	by swlx166.swmed.edu with esmtp (Exim 4.44) id 1GIFVT-0007vt-9E
	for linux-lvm@redhat.com; Tue, 29 Aug 2006 21:08:43 -0500
Message-ID: <44F4F32B.2070806@utsouthwestern.edu>
Date: Tue, 29 Aug 2006 21:08:43 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <20060826230337.49756.qmail@web30305.mail.mud.yahoo.com>
In-Reply-To: <20060826230337.49756.qmail@web30305.mail.mud.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Lost logical volume?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tom+Dale wrote:

> Greetings.
> I am hoping that some LVM experts can help me out. I have a partial=20
> volume group that spans two drives and I would like to recover the=20
> logical volume that was on it so that the data is accessible. The=20
> group (VolGroup00) was originally set up spanning part of one drive=20
> and all of the other drive (both IDE). The group was entirely applied=20
> to a single logical volume (LogVol00) to be mounted as /video. This=20
> was working until I tried to make some changes and I fear that I may=20
> have lost the data. I cannot seem to resolve this problem anywhere=20
> else. I have spent almost two weeks searching for clues and asking for=20
> help in other forums, but I do not yet have a solution. I hope to=20
> provide all of the useful information below.
> *History*
> I am relatively new to linux, having built my own PVR using Fedora and=20
> MythTV during the last year. I have relied heavily upon HowTos and=20
> guides written by other users. One of the guides that I followed=20
> instructed me to set up XFS using LVM which would allow me to span=20
> multiple hard disks. Recently, I added a new SATA drive to my MythTV=20
> system. The new drive was designated as /dev/sda. It appeared to add=20
> into the existing volume group without any problem, though I did not=20
> get it to the point where the space was accessible. I planned to=20
> further research that problem; however, the new hard drive failed=20
> before I got that far. Here=EF=BF=BDs what things looked like after remov=
ing=20
> the drive:
> [root[at]mythserver ~]# pvdisplay
> Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.
> Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.
> --- Physical volume ---
> PV Name /dev/hda5
> VG Name VolGroup00
> PV Size 66.12 GB / not usable 0
> Allocatable yes (but full)
> PE Size (KByte) 4096
> Total PE 16926
> Free PE 0
> Allocated PE 16926
> PV UUID 317l2C-oay1-TWFG-5NTX-XJS3-vLal-Xh5bBL
>
> --- Physical volume ---
> PV Name /dev/hdb
> VG Name VolGroup00
> PV Size 298.09 GB / not usable 0
> Allocatable yes (but full)
> PE Size (KByte) 4096
> Total PE 76311
> Free PE 0
> Allocated PE 76311
> PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-75SERQ
>
> --- Physical volume ---
> PV Name unknown device
> VG Name VolGroup00
> PV Size 232.88 GB / not usable 0
> Allocatable yes
> PE Size (KByte) 4096
> Total PE 59617
> Free PE 225
> Allocated PE 59392
> PV UUID fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv
>
>
Tom. I'm sorry that not too many people have looked into this with you.

First, what were the results of the "vgreduce --removemissing=20
VolGroup00" command? I'm generating a theory here. That VolGroup00 had a=20
single LV, LogVol00, and the disks /dev/hda5 and /dev/hdb. Then--I'm=20
guessing here--you did a "pvcreate /dev/sda" .. And followed that with a=20
"vgextend VolGroup00 /dev/sda" .. Then perhaps did you do a "lvextend -l=20
<some number> /dev/VolGroup00 /dev/sda"? After that, at some point,=20
/dev/sda went dead. Am I close? Could you recount to us what steps you=20
took to "expand" the VG? I realize you may have been asleep, but this=20
data is crucial. When I do any LVM work I typically record all my input=20
and output in a text editor and save it or print it out for safety..

So, the questions are:
1) Was that LV the ONLY LV in the VG?
2) You did try to expand the LV to include /dev/sda?
3) Did you use any GUI to do this? Or did you rely on the command line?

Peter
