Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m07LZpFs005752
	for <linux-lvm@redhat.com>; Mon, 7 Jan 2008 16:35:51 -0500
Received: from services.cse.ucsc.edu (services.cse.ucsc.edu [128.114.48.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m07LZSKp007989
	for <linux-lvm@redhat.com>; Mon, 7 Jan 2008 16:35:28 -0500
Received: from services.cse.ucsc.edu (localhost [127.0.0.1])
	by services.cse.ucsc.edu (8.13.6/8.13.1) with ESMTP id m07LZRgS021768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Jan 2008 13:35:27 -0800 (PST)
Received: from localhost (weiler@localhost)
	by services.cse.ucsc.edu (8.13.6/8.12.1/Submit) with ESMTP id
	m07LZRNp021765
	for <linux-lvm@redhat.com>; Mon, 7 Jan 2008 13:35:27 -0800 (PST)
Date: Mon, 7 Jan 2008 13:35:27 -0800 (PST)
From: Erich Weiler <weiler@soe.ucsc.edu>
Subject: Re: [linux-lvm] How to 'copy' a volume?
In-Reply-To: <Pine.LNX.4.44.0801041606310.5937-100000@bmsred.bmsi.com>
Message-ID: <Pine.GSO.4.58.0801071324210.8567@services.cse.ucsc.edu>
References: <Pine.LNX.4.44.0801041606310.5937-100000@bmsred.bmsi.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

OK, cool, this worked great!  Was able to dd the contents of one LV to
another and it worked.

So the next thing I did was reduce the size of one of the filesystems on
the Xen VM from 500GB to 5GB.  Then I reduced the size of the Logical
Volume that the VM was sitting on from 524GB to 30GB.  Again, worked fine,
still enough space to house all the data in the VM.  The filesystem resize worked fine.  Then
I rebooted the VM.  Now I'm getting odd error during the VM's boot that say
something about the disk being not the correct size, or something along
those lines.

[root@xenvm ~]# fdisk -l

Disk /dev/xvda: 32.2 GB, 32212254720 bytes
255 heads, 63 sectors/track, 3916 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/xvda1   *           1          13      104391   83  Linux
/dev/xvda2              14        1288    10241437+  83  Linux
/dev/xvda3            1289        2308     8193150   82  Linux swap /
Solaris
/dev/xvda4            2309       67620   524618640    5  Extended
/dev/xvda5            2309       67620   524618608+  83  Linux
[root@xenvm ~]#

Notice it says that /dev/xvda is 32.2GB (which is what I want, and is
correct), but the
filesystem that I reduced from 500GB to 5GB, /dev/xvda5, is still listed
as being 524GB, even though it is no longer that big!  Even though the
filesystem on /dev/xvda5 is just 5GB:

[root@xenvm ~]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/xvda2            9.5G  2.0G  7.1G  22% /
/dev/xvda5            5.0G  4.4G  365M  93% /data
/dev/xvda1             99M   19M   76M  20% /boot
tmpfs                 2.0G     0  2.0G   0% /dev/shm
[root@xenvm ~]#

This makes me think the disk label is not showing the correct block device
size.  The VM still boots and runs fine despite the errors, but I'd like
to fix it because I'll be resizing stuff often and want things to go
smoothly when the resizes happen.  Does anyone know of a way to correct
this?

Thanks so much for the help!

-erich

On Fri, 4 Jan 2008, Stuart D. Gathman wrote:

> On Fri, 4 Jan 2008, Erich Weiler wrote:
>
> > > # dd if=/dev/volgroup00/original of=/dev/volgroup00/clone bs=300k
> >
> > It was probably slow, as you say, but it turns out our machines were
> > powered off by one of the other guys in our group because the UPS was
> > draining fast.  Power was lost because of a major storm on the central
> > California coast.
>
> You can use iostat to see throughput while dd is in progress.  If
> you're ambitious, you can try various blocksizes to find the optimum
> for your system.
>
> Oh.  And *don't* get source and target mixed up with dd.  I did that
> once ....
>
> --
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
