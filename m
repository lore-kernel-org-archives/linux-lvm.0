Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0LGOjO28477
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 11:24:45 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.200])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0LGOd3J002097
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 11:24:39 -0500
Received: by wproxy.gmail.com with SMTP id 67so162803wri
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 08:24:29 -0800 (PST)
Message-ID: <87f94c3705012108241f812e0e@mail.gmail.com>
Date: Fri, 21 Jan 2005 11:24:29 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Why the dramatic increase in filesystem performance
	when usingxfs????
In-Reply-To: <1106304669.3943.14.camel@grma-lap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1106304669.3943.14.camel@grma-lap>
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
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
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 21 Jan 2005 10:51:09 +0000, Gary Mansell wrote:
> Hi,
> 
> I have always run ext3 filesystem with journalling on Redhat AS as it is
> the only supported filesystem.
> 
> One of my colleagues runs xfs, though, and on comparable hardware
> configs he gets twice the performance compared to my ext3 tests.
> 
> The test that I perform is to create a file at least twice the size of
> the RAM installed in the system to avoid the possibility of cacheing,
> measuring the time to write and read the file back gives me the
> performance figure that I am after. I realise that this is a very simple
> test of large sequential IO but it is good enough for my needs.
> 
> ie
> 
> Write test:
> 
> # time dd if=/dev/zero of=./testfile bs=16384 count=250000 ; time sync
> 
> Read test:
> 
> # time dd if=./testfile of=/dev/null bs=16384
> 
> As the xfs performance comes back about twice the performance of ext3
> for this test I am of the opinion that xfs must be cheating somehow. It
> has always been my opinion that the IO bottleneck is the hardware and
> not the filesystem hence changing the filesystem but using the same
> hardware should not make a huge difference to performance (you still
> have to get the same amount of data out to disk at the end of the day)
> 
> I am struggling to comprehend how xfs can cheat, though, as it can't
> cache such a huge file as there is not enough memory. Is it perhaps
> cheating because the file is comprised entirely of zero's?
> 
> Can someone please enlighten me
> 
> Thanks in advance
> 
> Gary Mansell
> --
> 
> This e-mail and any files transmitted with it are confidential and intended
> solely for the use of the individual or entity to whom they are addressed.
> If you have received this e-mail in error please notify the sender immediately
> and delete this e-mail from your system.  Please note that any views or opinions
> presented in this e-mail are solely those of the author and do not necessarily
> represent those of Ricardo (save for reports and other documentation formally
> approved and signed for release to the intended recipient).  Only Directors
> or Duly Authorised Officers are authorised to enter into legally binding
> obligations on behalf of Ricardo unless the obligation is contained within
> a Ricardo Purchase Order.
> 
> Ricardo may monitor outgoing and incoming e-mails and other telecommunications
> on its e-mail and telecommunications systems.  By replying to this e-mail you
> give consent to such monitoring.  The recipient should check this e-mail and
> any attachments for the presence of viruses.  Ricardo accepts no liability for
> any damage caused by any virus transmitted by this e-mail.  "Ricardo" means
> Ricardo plc and its subsidiary companies.
> 
> Ricardo plc is a public limited company registered in England with registered
> number 00222915.
> The registered office of Ricardo plc is Bridge Works, Shoreham-by Sea,
> West Sussex, BN43 5FG.
> 
Nobody is "cheating".

Different filesystems are tuned for different capabilities.

XFS is highly tuned to handle large files because SGI had a major
interest in video preparation and distribution capability.  This
tuning involves eliminating excess disk seeks to handle meta-data
while the actual data is being read/written.  (i.e. Modifying inodes,
etc. in the middle of a large write operation is very time consuming
because of the disk head seeks involved.)

Thus, your test is for exactly the enviroment XFS was designed to
handle efficiently.

OTOH, if you want to run a mail server or a Internet News Feed, you
need to handle lots of small files.  ReiserFS was tuned for this
environment a couple years ago, so it would be the way to go.

EXT3, is a good overall filesystem and I have heard people say it
survives unexpected power-outages the best.

You need to figure out what your needs are from a filesystem, then
find comparative studies of the various ones and see what fits your
needs.

Specifically, I would not recommend XFS for the core filesystems.  i.e
/, /var, /usr, etc.  A lot of debug tools still don't support XFS and
XFS brings no value to the party.

I personnally use ext3 for all my core filesystems, and XFS for my
data drives.  (I work with very large files, typically split down to
iso size.  I also keep a copy on tape, so filesystem reliability is
less important than speed to me.)

Greg
-- 
Greg Freemyer
