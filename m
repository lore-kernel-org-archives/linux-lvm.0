Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDJfO119293
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 14:41:24 -0500
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBDJfN8k015188
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 14:41:23 -0500
Subject: Re: [linux-lvm] Re: If one disk fails i loose everything?
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <439F07E3.80804@cox.net>
References: <200512131624.jBDGO5ui009897@cichlid.com> <439F07E3.80804@cox.net>
Date: Tue, 13 Dec 2005 11:41:10 -0800
Message-Id: <1134502870.14744.51.camel@seki.nac.uci.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, rascal.jumper-747@redhat.com


It really shouldn't work that way.  RAID 5 is based on XOR, and I'm
pretty sure XOR can only recover from a single-number failure.

-But-, if you had a hot spare or warm spare configured, then it would've
been possible for one drive to die, the RAID 5 to be resync'd, another
drive to die, and then still be OK.


On Tue, 2005-12-13 at 12:41 -0500, Old Fart wrote:
> Andrew Burgess wrote:
> >> Good discussion....the need to protect data under various contingencies 
> >> is why I use raid5 sets as the PVs.  You can lose up to two and keep 
> >> your data, hot add, have spares, etc.
> >>     
> >
> > You mean raid6
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >   
> Actually I meant raid 5 based on actual 2 disk dropouts experienced on 
> test systems and the LVM data was still available.  Probably lucky.  
> Thanks for the note.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
