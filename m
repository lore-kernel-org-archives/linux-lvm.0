Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5O22Gu28585
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 22:02:16 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.192])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5O228hq026530
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 22:02:08 -0400
Received: by zproxy.gmail.com with SMTP id 16so77464nzp
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 19:02:03 -0700 (PDT)
Message-ID: <3cd4d9930506231902692daa15@mail.gmail.com>
Date: Fri, 24 Jun 2005 12:02:03 +1000
From: Jeff Ewing <jeffiewing@gmail.com>
In-Reply-To: <20050623081125.GB4195@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <3cd4d99305062204374db9549@mail.gmail.com>
	<20050622141522.GD22056@null.msp.redhat.com>
	<3cd4d99305062218025d6c3059@mail.gmail.com>
	<20050623081125.GB4195@agk.surrey.redhat.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: PV segments corrupted in vg1 : LVM corrupted
Reply-To: Jeff Ewing <jeffiewing@gmail.com>,
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

Solved. Thankyou to Aj, Alasdair (and Redhat).

vgcfgrestore -M1 vg1
vgconvert -M2 vg1 
reboot

1. I do not know how I missed this, it is clearly in the FAQ
2. This only appeared after reconfiguring logical volumes, several
weeks/reboots after "converting" to lvm2 (clearly not complete converion,
was using lvm2inird but must have been reading the lvm1 formats. 

On 6/23/05, Alasdair G Kergon <agk@redhat.com> wrote:
> On Thu, Jun 23, 2005 at 11:02:52AM +1000, Jeff Ewing wrote:
> > The output from "vgcfgrestore vg1" is 
> >   PV /dev/md1 is a different format (seqno lvm1)
> 
> Add -M1 to force it to use lvm1 metadata format (default
> is new format - or change default globally in lvm.conf).
> 
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
