Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22IZg804123
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 13:35:42 -0500
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.25])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i22IZcb15756
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 13:35:41 -0500
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
          (InterMail vK.4.03.05.03 201-232-132-103 license 1cbf71897a39210db31154c99f0b4628)
          with ESMTP id <20040302183537.MIFM15612.pegasus@kudu.siol.net>
          for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 19:35:37 +0100
Received: from vector ([193.77.156.30]) by kudu.siol.net
          (InterMail vK.4.03.05.03 201-232-132-103 license 1cbf71897a39210db31154c99f0b4628)
          with SMTP id <20040302183537.QUNS1595.kudu@vector>
          for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 19:35:37 +0100
Message-ID: <002a01c40085$2c03e680$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
References: <001301c40041$7fdeab30$0400a8c0@vector> <yw1xy8qjxxgt.fsf@kth.se>
Subject: Re: [linux-lvm] Re: What if a drive dies ?
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 13:34:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Ahh I made a major typo .... it's a linear setup, not a striped one.

You mentioned anyway that a recovery would be somewhat possible.
I'm using ext3 journaling fs on my LV. Would I be able to mount this
LV if one PV died, meaning I would see all data except the part that
was lost with that drive or would I need to do anything special to make
the LV mountable again ?

---------
Perplexer

----- Original Message ----- 
From: "M�ns Rullg�rd" <mru@kth.se>
To: <linux-lvm@sistina.com>
Sent: Tuesday, March 02, 2004 1:08 PM
Subject: [linux-lvm] Re: What if a drive dies ?


> "Perplexer" <perplexer@thz.net> writes:
>
> > Hello.
> >
> > I'm sorry if I ask something that's be asked a million times before but I
> > prefer answers to my specific questions. I hope someone will try to help.
> >
> > I have a VG with several differently sized PVs and one LV. It is working
> > fine but I am affraid that one day one of the drives would fail.
>
> It happened to me.
>
> > I'd like to know what I'll be looking at when that happens. What if
> > one drive would fail in that VG ? Can I remove it and 'repair' the
> > VG/LV to run on with one drive less
>
> LVM2 can run readonly with some drives missing.
>
> > (data is written in striped mode).
>
> That lowers your odds considerably.  I wouldn't count on recovering
> anything at all.
>
> > That would mean I got my VG/LV back on-line but the data that was on
> > the bad disk would be missing (a small price to pay actually). Would
> > I need to resize the filesystem again with some tool or anything
> > special ?
>
> If you didn't run in striped mode you'd probably be able to recover
> most of the data from the remaining disks, the exact results would
> depend on the filesystem used and which part of it was lost.  However,
> in striped mode you'll lose fragments all over the place.  Recovering
> from that is more or less impossible.
>
> If your data is precious, use RAID1 or RAID5 and make regular backups.
>
> -- 
> M�ns Rullg�rd
> mru@kth.se
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
