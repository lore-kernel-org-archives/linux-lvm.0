Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OJWjRf010841
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:32:45 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.249])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5OJWQhG007864
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:32:26 -0400
Received: by an-out-0708.google.com with SMTP id b38so515521ana.36
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 12:32:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
References: <4A42424B.1080208@gmail.com>
	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
Date: Wed, 24 Jun 2009 15:32:26 -0400
Message-ID: <87f94c370906241232w6b096bc3t1c1dbe54042e86dc@mail.gmail.com>
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
From: Greg Freemyer <greg.freemyer@gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jun 24, 2009 at 2:50 PM, Roy Sigurd Karlsbakk<roy@karlsbakk.net> wrote:
> On 24. juni. 2009, at 17.12, Mark Ruijter wrote:
<snip>
>> I am thinking about starting to work on a data deduplicating
>> blockdevice, a kernel module called blockless.
>
> If done smartly, this may perhaps be possible, but the problem is the
> filesystem's metadata. Is this going to be dedup'ed? How much will this
> take? A simple backup will update atime on all the files backed up, and
> although atime isn't always wanted or needed, the problem occurs elsewhere.
>

As of the 2.6.30 kernel a default mount option is "relatime".  That is
a relatively new mount option that drastically reduces the number of
atime updates.  ie. Not realtime, but relatime.

Greg
-- 
Greg Freemyer
Head of EDD Tape Extraction and Processing team
Litigation Triage Solutions Specialist
http://www.linkedin.com/in/gregfreemyer
First 99 Days Litigation White Paper -
http://www.norcrossgroup.com/forms/whitepapers/99%20Days%20whitepaper.pdf

The Norcross Group
The Intersection of Evidence & Technology
http://www.norcrossgroup.com
