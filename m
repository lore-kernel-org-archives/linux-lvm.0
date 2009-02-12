Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1C0cEd7001614
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 19:38:14 -0500
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1C0bwZv011372
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 19:37:58 -0500
Received: by bwz4 with SMTP id 4so695186bwz.3
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 16:37:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1234389833.8851.3.camel@geeko>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
	<1234389833.8851.3.camel@geeko>
Date: Thu, 12 Feb 2009 00:37:57 +0000
Message-ID: <b072968d0902111637r782d90f4gb576eeb107321ef1@mail.gmail.com>
Subject: Re: [linux-lvm] About fstab and fsck
From: David Robinson <zxvdr.au@gmail.com>
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

On Wed, Feb 11, 2009 at 10:03 PM, Chris Cox <chris_cox@stercomm.com> wrote:
> On Wed, 2009-02-11 at 21:58 +0000, David Robinson wrote:
> ...
>> Usually you'd want to have fsck enabled for your root filesystem, but
>> by the looks of it the LV and filesystem you grew _is_ your root
>> filesystem... so considering its size, I'd turn it off. Hopefully the
>> "fsck takes _forever_" problem will die when btrfs becomes the
>> standard filesystem.
>
> I'm not aware of any feature in btrfs that will prevent
> the fsck time issue on very large fs's.
>
> Until something fairly radical happens in fs design, I'd avoid
> very large fs's.

btrfs isn't a radically different design? Perhaps I should have
rephrased what I said - rather than btrfs being quicker at checking
and repairing the filesystem (ala fsck) it (in theory) prevents you
from ever needing to fsck in the first place. It basically trusts
nothing and checksums everything. A quick look at the features page
[1] lists:

- Checksums on data and metadata (multiple algorithms available)
- Online filesystem check
- Very fast offline filesystem check

[1] http://btrfs.wiki.kernel.org/index.php/Main_Page

--Dave
