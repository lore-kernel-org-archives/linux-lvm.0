Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADDcwr14853
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 08:38:58 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iADDcp7S002213
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 08:38:51 -0500
Received: by rproxy.gmail.com with SMTP id f1so371413rne
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:38:50 -0800 (PST)
Message-ID: <89af10f90411130538533f8e45@mail.gmail.com>
Date: Sat, 13 Nov 2004 19:08:50 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <72dh62-4om.ln1@news.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<72dh62-4om.ln1@news.it.uc3m.es>
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

read my earlier mails ... 
it is silly , but not as silly as trying to modify the kernel code for
just one specific disk : )




On Sat, 13 Nov 2004 13:59:19 +0100, Peter T. Breuer <ptb@lab.it.uc3m.es> wrote:
> ashwin chaugule <ashwin.chaugule@gmail.com> wrote:
> 
> (please do not top post - fixing. Please take note!)
> 
> 
> 
> > > > Is this correct if I want data to be mirrored across all 4 partitions
> > > > , using RAID 1 on a single disk ?
> > >
> > > So, you are talking about a mirror with 4 components, all of them
> > > partitions on the same disk?
> > >
> > > Well, that's silly, but nothing stops you doing it. Just maek a raidtab
> > > for the mirror and name the partitions as raid-disk components there.
> > > The RAID howto or faq should tell you all you need to know, as should
> > > the mananpage for the conf file or mdadm, or whatever ...
> 
> > ok so, i also do know, its performance is going to suck !
> 
> No, it'll be fine - merely a couple or more times slower at writing
> large streams. In ordinary use you may sometimes see more latency, but
> provided you aren't streaming or running synchronous writes, you
> shouldn't notice. What's silly is that there's no point in doing it -
> you get no protection against the disk disappearing, because all the
> mirror components are on the same disk.
> 
> It's like making 3 sets of spare housekeys, and then putting them all
> in the same keyholder as the original set, and walking around like that.
> 
> Silly, no?
> 
> > but i was under the impression that RAID 1 works on more that one disks only.
> 
> I don't understand you. While a mirror with only one component is
> trivial, it is a mirror.
> 
> > so you mean to say that, the linux RAID / md tools support raid 1 on
> > multiple partitiions of the same disk ?
> 
> Nobody cares where the mirror components are physically sited except
> you.  Why should any tool care?  Its job is to do what you say.  I don't
> understand why you should think that the tool would even know (well,
> there is a chance that it could look and check, but I don't recall any
> significant code in the driver dedicated to optimizations based on that).
> 
> 
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
