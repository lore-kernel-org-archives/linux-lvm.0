Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADAfEr23015
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:41:14 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iADAf8A6009414
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:41:08 -0500
Received: by rproxy.gmail.com with SMTP id f1so363685rne
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 02:41:08 -0800 (PST)
Message-ID: <89af10f90411130241e20e2c2@mail.gmail.com>
Date: Sat, 13 Nov 2004 16:11:08 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <lg4h62-8vg.ln1@news.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
Reply-To: ashwin chaugule <ashwin.chaugule@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

yes i know its silly ... im doing what im told to do :p

ok so, i also do know, its performance is going to suck !
but i was under the impression that RAID 1 works on more that one disks only.

so you mean to say that, the linux RAID / md tools support raid 1 on
multiple partitiions of the same disk ?

Regards,
Ashwin
 



On Sat, 13 Nov 2004 11:33:25 +0100, Peter T. Breuer <ptb@lab.it.uc3m.es> wrote:
> ashwin chaugule <ashwin.chaugule@gmail.com> wrote:
> >          Im trying to get RAID 1 working on a single disk. Can anyone
> > tell me if thats possible ?
> 
> Yes, of course it is.
> 
> > Do I have to use LVM for that ?
> 
> No.
> 
> > So, far this is what i've understood ...
> > Now.. I have a separate disk on which I want RAID 1.
> > so I create one PV on that disk (/dev/hdd)
> 
> No you don't. LVM is not involved.
> 
> > create a logical vol grp.
> 
> 
> No you don't. LVM is not involved.
> 
> 
> > add 4 LV's , for four filesystems of the same type ...
> 
> No you don't. LVM is not involved.
> 
> > then in /etc/raidtab or whatever ..
> > say that i have 4 disks and for each disk specify each LV partition ..
> 
> No you don't, since LVM is not involved.
> 
> > then mkraid /dev/md0 ...
> >
> > Is this correct if I want data to be mirrored across all 4 partitions
> > , using RAID 1 on a single disk ?
> 
> So, you are talking about a mirror with 4 components, all of them
> partitions on the same disk?
> 
> Well, that's silly, but nothing stops you doing it. Just maek a raidtab
> for the mirror and name the partitions as raid-disk components there.
> The RAID howto or faq should tell you all you need to know, as should
> the mananpage for the conf file or mdadm, or whatever ...
> 
> Peter
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Ashwin Chaugule
Embedded Systems Engineer
Aftek Infosys ltd.
[Embedded Division]
