Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAE11Jr14911
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 20:01:19 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAE117gI015512
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 20:01:13 -0500
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CT8lO-0001MO-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 02:01:06 +0100
Received: from 76.80-203-227.nextgentel.com ([80.203.227.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 02:01:06 +0100
Received: from mru by 76.80-203-227.nextgentel.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 02:01:06 +0100
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@inprovide.com>
Date: Sun, 14 Nov 2004 01:41:40 +0100
Message-ID: <yw1x1xexjm7v.fsf@ford.inprovide.com>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: raid 1 on a single disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Greg Freemyer <greg.freemyer@gmail.com> writes:

>> 
>> P.S. I'd be really tempted to talk to the person asking you to do
>> this, and ask them what they hope to achieve...
>> 
> I can almost envision times it would be useful.  i.e. disk speed is
> unimportand, disk data rarely changes, but when it does it is very
> important, and traditional backups are not feasible for some unknown
> reason?
>
> By having the data written to 2 different places on the disk, the
> likelyhood of a failure making it  truly unrecoverable is extremely
> small.

Shall I tell you about the 80GB disk I had that suddenly dropped dead,
refusing all form of communication?

> ie. If you have disk media problems, likely only one location of the
> other will be affected.
>
> If you have a drive electronics failure, you can ship the drive off to
> have recovery performed.  (Over $1000 I know, but if the data is
> important.)

I'd rather pay the $100 for a mirror disk, which is also what I do in
my systems, after the lesson learned from the aforementioned failure.
I got four new disks, and configured them as RAID5.  Within a month,
one of them failed.

-- 
M�ns Rullg�rd
mru@inprovide.com
