Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2AGWjD2022842
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 12:32:45 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2AGW63P006657
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 12:32:10 -0400
Received: from soda.linbit (office.linbit [86.59.100.100])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D7FB2DEAC73
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 17:32:00 +0100 (CET)
Date: Mon, 10 Mar 2008 17:32:00 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Restore LVM snapshot without creating a full
	dumpto an "external" device?
Message-ID: <20080310163200.GE5426@barkeeper1.linbit>
References: <A374F37068535C46BFCF8D48CF29AA7FB358AF@zen.zetex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A374F37068535C46BFCF8D48CF29AA7FB358AF@zen.zetex.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Mar 10, 2008 at 10:43:18AM -0000, Karl Wagner wrote:
> That is almost exactly what I was after.
> 
> Just one thing though... If I was to just take a backup of the COW
> device, assuming the underlying origin had not changed, would I just be
> able to restore this? (i.e. gzip < /path/to/cowdevice >
> /path/to/backupfile.gz and restore with zcat /path/to/backup/file.gz >
> /path/to/cowdevice, or similar.) Would this work with a newly created
> snapshot? (ie backup as above then lvcreate -s -n newsnapshot
> /path/to/origin; zcat /path/to/backup/file.gz > /path/to/new/cow/device)
> 
> I will just emphasize that the UNDERLYING ORIGIN WILL NEVER CHANGE, it
> is never mounted, never used for anything except as a snapshot origin.

won't work "just so."
just because you are messing with the storage does not mean the
in-kernel exception tables would be updated magically.

I mean, the equivalent is to dd back a file system image backup
below a mounted file system...

it may be possible to
lvcreate -s -n newsnapshot /path/to/origin
dmsetup table $that-new-snapshot
remember it.
dmsetup remove snapshot.
zcat image.gz > snapshot-cow
sync!!! maybe rather zcat | dd oflag=sync

dmsetup create snapshot with identical table again.

that in theory should make it read the
(just restored from backup) exeption table from storage again.

but I never tried.
and I think it is scary :-)

-- 
: Lars Ellenberg                           http://www.linbit.com :
: DRBD/HA support and consulting             sales at linbit.com :
: LINBIT Information Technologies GmbH      Tel +43-1-8178292-0  :
: Vivenotgasse 48, A-1120 Vienna/Europe     Fax +43-1-8178292-82 :
