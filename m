Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l23BjCaB021178
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 06:45:12 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l23BjAQn020504
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 06:45:11 -0500
Date: Sat, 3 Mar 2007 12:45:08 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] partition table needed for lvm ?
Message-ID: <20070303114507.GD12744@percy.comedia.it>
References: <20070301171425.30ktkd2oroo4cco0@www.mail.yale.edu>
	<20070301231907.GG3319@agk.surrey.redhat.com>
	<20070302140153.GB12744@percy.comedia.it>
	<20070302165837.GB28190@homer.panici.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070302165837.GB28190@homer.panici.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 02, 2007 at 04:58:37PM +0000, paddy@panici.net wrote:
>On Fri, Mar 02, 2007 at 03:01:53PM +0100, Luca Berra wrote:
>> On Thu, Mar 01, 2007 at 11:19:07PM +0000, Alasdair G Kergon wrote:
>> >On Thu, Mar 01, 2007 at 05:14:25PM -0500, Chris Hunter wrote:
>> >>Do I reallly need to make partition tables on all my disks to use lvm2 ?
>> >
>> >Other packages such as the installer like to have them.
>> 
>> what about the fact that on many storage creating an ms-dos compatible
>> partition usually results in screwing io alignment?
>
>interesting.  
>
>Although it comes as no surprise that the CHS boundaries are not aligned
>with the hardware anymore (like they were back in the days of say MFM),
>I thought that systems that attempted to use this level of information 
>about a disk were fairly rare these days ?
The problem comes from smart storage system which like to do IO with
big block sizes (usually 32K to 64K) from the beginning of the LUN that
is presented to the OS.
If sda1 starts at 31.5K into sda and we assume 4k as a default block
size and 32K as storage block size we will notice that IO on every 8th
block will require two IOs on the storage.
If we really have to partition it would not hurt knowing the block
size of the storage and manually aligning the start of partition to
that, it might waste a few sectors at the beginning but who cares.

>> Do _NOT_ use partitions, they are evil and should have been shot long
>> ago.
>
>:-)
>
>agreed, there are plenty of reasons to retire msdos partitions.
>
>What would you recommend as a setup for boot drives where the bios
>expects to boot from an msdos partition table (or more specifically
>the code at the begining of a sector with the magic of an msdos 
>partitiontable) on sector 0 ?
Fortunately plain disks (which are mostly used as boot device) does not
suffer from the above mentioned issue. So partitioning them is not that
bad.
Moreover if you have /boot as a separate partition at the beginning of
the disk only that would be affected, the other partitions should be
aligned...

My preference would still be for not having msdos partitions on any drive at all
and, since lvm2 does not touch the first 512 bytes of a PV, fitting a
grub boot block in there is not going to be that difficult.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
