Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4NJ7wV5024189
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 15:07:58 -0400
Received: from mail-pz0-f46.google.com (mail-pz0-f46.google.com
	[209.85.210.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4NJ7vpb006086
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 15:07:57 -0400
Received: by dady13 with SMTP id y13so13534387dad.33
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 12:07:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1205231419310.4474@bmsred.bmsi.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
	<4FBD03F0.9080809@redhat.com>
	<CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
	<4FBD1D47.204@redhat.com>
	<CAOAgVpz_b738-YwyUXMDMzjuzPYP_VV=YusaFjLVAUiMHvaOsA@mail.gmail.com>
	<alpine.LRH.2.02.1205231419310.4474@bmsred.bmsi.com>
Date: Wed, 23 May 2012 14:07:57 -0500
Message-ID: <CAOAgVpxUUAVbvS5qbPo6kVTcVzSoxMSR5P5gV4X4nRnkhpGnCA@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fun and games with mirroring
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: lvm@beer.org.uk

On Wed, May 23, 2012 at 1:32 PM, Stuart D Gathman <stuart@bmsi.com> wrote:
> >
>> The unfortunate part is that most linux distributions don't allow
>> installation on a 'broken mirror' or have a way to convert from
>> non-raid to raid after the install the way you can on a windows server
>> - or if there is, I haven't found it. �So even if you like the new
>> replacement that you tried on the single-disk install, you have to
>> throw it away and re-install on raid in the end.
>
>
> I do this all the time - but with MD raid. �Use custom install, and
> create RAID1 MD devices in the install with only 1 leg. �You can add
> mirrors later with mdadm.

I've done that manually in a separate virtual terminal during the
install, partly because the installer likes to re-arrange the order of
the partitions on the disk when you define them there and partly
because it didn't occur to me that the installer would accept a raid1
with only one member.  Maybe I'll give it another try.  But with the
installer willing to align things on 2M boundaries these days you'd
think there would be a way to set things up so you could back in
whatever MD needs later.

> My only complaint with the MD driver is that it doesn't divide up drives
> into small partitions. �I often end up creating 2 or 3 partitions on a
> drive,
> and mirroring each.

I thought these days you could raid the whole disk and put partitions
on the raid, although I've never done it that way.  I have 2
complaints about MD.  One is that it doesn't handle errors/retries on
members very well - it will kick members that are perfectly fine
running standalone or as the last remaining member, and the other is
that partitions over 2TB need a new format that the kernel doesn't
auto-detect.  Much of the reason I liked MD in the first place was its
ability to assemble things correctly at boot regardless of the drive's
physical attachment or location.

-- 
  Les Mikesell
    lesmikesell@gmail.com
