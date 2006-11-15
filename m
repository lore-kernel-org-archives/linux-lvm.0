Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAFMSS2m022249
	for <linux-lvm@redhat.com>; Wed, 15 Nov 2006 17:28:28 -0500
Received: from web51010.mail.yahoo.com (web51010.mail.yahoo.com
	[206.190.39.129])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kAFMSCi0004993
	for <linux-lvm@redhat.com>; Wed, 15 Nov 2006 17:28:13 -0500
Date: Wed, 15 Nov 2006 14:28:07 -0800 (PST)
From: Richard Mollel <unixtipz@yahoo.com>
Subject: SOLVED: [linux-lvm] No label detected
In-Reply-To: <168918.46162.qm@web51015.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <79667.90282.qm@web51010.mail.yahoo.com>
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

OK....so i backed up all data on one partition...
vgchange -a n
fdisk /dev/sdb, /dev/sdc and /dev/sdd
delete the partition within...
ie. delete /dev/sdb1, /dev/sdc1 and /dev/sdd1
then;
pvscan .....Voila...all my PV's are back to life....
vgscan, vgchange -a y, mount! It all worked. No data
loss......
So i did not my backup after all.

Lessons:
Even though everything worked  OK under LVM1....when i
performed a pvscan under LVM2.....it did not like the
fact that PV is whole device (/dev/sdb) and there is
an underlying partition, (/dev/sdb1).

My issue, mystery solved.....
--- Richard Mollel <unixtipz@yahoo.com> wrote:

> I have an idea of what is going on...but no really
> how
> to correct it once and for all.
> The PV, VG, LV were created under Mandrake 10.0, in
> the days of LVM1. Then an upgrade install was done,
> to
> take it to Mandriva 2006.0, and thus the LVM1 was
> converted to LVM2 in the process.
> When i first created the LVM devices...i used whole
> device, sdb,sdc & sdd...even though there were
> partitions sdb1, sdc1 and sdd1 which comprise of
> whole
> disk. LVM1 it seems did not have an issue.
> Since i was adding disks, i believe it is the first
> time that i actually ran pvscan....which effectively
> dumped /etc/lvm/.cache and created a new one. 
> Under new one, since sdb1,sdc1 &sdd1 were of type
> LVM...it saw those, but not sdb, sdc and
> sdd.....which
> it says are unknown devices.
> Is there any way to correct it "online"...ie.
> without
> moving all data out, wipe out all info, rebuild the
> PVs, VG & LV?
> As a backup plan, i am mounting the whole devices,
> sdb, sdc & sdd as loop device using losetup...and
> that
> seems to work...though it is manual process....
> 
> _thanks
> 
> Rick
> --- Richard Mollel <unixtipz@yahoo.com> wrote:
> 
> > Hi,
> > 
> > Mandriva 2006.0
> > Kernel 2.6.12-24
> > lvm2-2.01.09-1mdk
> > 
> > LVM installed on whole devices, /dev/sdb, sdc and
> > sdd.
> > It has worked for over 2 years. Not sure if
> > something
> > in Mandriva regular update changed anything
> > related....but now, upon reboot, the whole devices
> > are
> > seen as PV's. I have to run losetup (set them up
> as
> > loop devices basically) then
> > vgscan,pvscan,lvmdiskscan
> > can see them, and i can mount my VG. What actually
> > controls pvscan/vgscan commands?
> > 
> > /dev/sdb1: No label detected
> > /dev/sdc1: No label detected
> > /dev/sdd1: No label detected
> >       Locking /var/lock/lvm/V_ASSIM_VG RB
> > Finding volume group "ASSIM_VG"
> >   /dev/loop0: lvm2 label detected
> >   /dev/loop1: lvm2 label detected
> >   /dev/loop2: lvm2 label detected
> > 
> > _Thanks
> > 
> > Richard
> > 
> > 
> >  
> >
>
____________________________________________________________________________________
> > Cheap talk?
> > Check out Yahoo! Messenger's low PC-to-Phone call
> > rates.
> > http://voice.yahoo.com
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> > http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> 
> 
> 
>  
>
____________________________________________________________________________________
> Sponsored Link
> 
> Mortgage rates near 39yr lows. 
> $510k for $1,698/mo. Calculate new payment! 
> www.LowerMyBills.com/lre
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 



 
____________________________________________________________________________________
Sponsored Link

Mortgage rates near 39yr lows. 
$510k for $1,698/mo. Calculate new payment! 
www.LowerMyBills.com/lre
