Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4H7g3O12517
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 03:42:03 -0400
Received: from edmi.com.au (203-173-42-55.perm.iinet.net.au [203.173.42.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4H7fxOT027445
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 03:42:01 -0400
Received: from CHRISTIANH by edmi.com.au (MDaemon.PRO.v8.0.2.R)
	with ESMTP id md50000278286.msg
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 16:21:32 +1000
From: "Christian Hack" <christianh@edmi.com.au>
Subject: RE: [linux-lvm] disk capacity discrepancy: is it 1000 versus 1024?
Date: Tue, 17 May 2005 16:21:39 +1000
Message-ID: <022301c55aa8$afe42fe0$1c01010a@CHRISTIANH>
MIME-Version: 1.0
In-Reply-To: <87f94c3705051414416006a748@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Greg Freemyer
> Sent: Sunday, 15 May 2005 7:42 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] disk capacity discrepancy: is it 
> 1000 versus 1024?
> 
> 
> On 5/14/05, Greg Freemyer wrote:
> > On 5/14/05, Maurice Volaski wrote:
> > > I originally had a hardware RAID with fourteen 400 GB drives of
> > > usable capacity (Hitachi 7K400) . That's 5600 GB 
> altogether. That's
> > > what both fdisk and df report (filesystem was ext3).
> > >
> > > When I instead created an LVM2 physical volume on the 
> device, I get
> > > just 5.09 TB.
> > >
> > > Is LVM eating several hundreds gigabytes of space or is 
> it the case
> > > that LVM uses terminology in a strict multiply by 1024 
> fashion versus
> > > everything else, which is multiplying by 1000. In that 
> case, I guess
> > > the drives aren't really 400 GBs. :-(
> > >
> > > However, it appears that parameters passed to LVM commands are
> > > interpreted using x1000, not x1024.
> > >
> > > other keywords: gigabinarybytes, gibibytes, Gi, 
> terabinarybytes, tebibytes, Ti.
> > > --
> > >
> > > Maurice Volaski, mvolaski@aecom.yu.edu
> > > Computing Support, Rose F. Kennedy Center
> > > Albert Einstein College of Medicine of Yeshiva University
> > 
> > As Maurice implies NIST is making an effort (however small) to
> > standardize GB as 1000 * 1000 * 1000 bytes.
> > 
> > See http://physics.nist.gov/cuu/Units/binary.html
> > 
> > So per NIST:
> > GB = Gigabyte = 1,000 * 1,000 * 1,000 Bytes
> > GiB = Gibibyte  = 1,024 * 1,024 * 1,024 Bytes
> > 
> > Or for Maurice TB vs. TiB
> > 
> > BTW, the difference between TB and TiB is almost 10% so this has a
> > very user observable effect and would explain Maurice's discrepancy.
> > 
> > So if I understand Maurice's question, it becomes:
> >    "Is LVM reporting TiB units with a TB designation?"
> Maurice,
> 
> I forgot to add that disk drive manufactures have been selling disks
> by the GB for years, not the GiB.  Thus your 400 GB disk drive is most
> likely about 373 GiB.  (I used a calculator).
> 
> One way to tell for sure is to get the number of sectors and multiply
> it out.  Sectors are typically 512 bytes.  You can typically see the
> sector count or the paper label of newer drives, or with standard ide
> disks in /proc/ide/hdx/capacity.
> 

Although Greg has bascially done the maths, it works out exactly right as
5.09TiB

i.e. 14 * 400 * 10^9 = 5600 * 10^9 = 5.6 * 10^12 TB

In TiB

(5.6 * 10 ^12) / (1024 * 1024 * 1024 * 1024) = 5.09 TiB which is exactly
what you are seeing. 

I would guess LVM is simply reporting TiB with the suffix TB since the whole
Gibi, Tibi etc thing is yet to completely take off and not everyone is using
it.

It starts getting a bit rough when you lose 500GB due to 1024 vs 1000.

CH
