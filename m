Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104181815.f3IIF9JW030481@webber.adilger.int>
Subject: Re: [linux-lvm] Strangenesses with snapshots, 0.9.1-beta6.
In-Reply-To: <20010417234127.B3388@sistina.com> "from AJ Lewis at Apr 17, 2001
 11:41:27 pm"
Date: Wed, 18 Apr 2001 12:15:09 -0600 (MDT)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

AJ writes:
> Are you sure those files were in a consistant state when you took the
> snapshot?  You really need to get your file system into a consistant state,
> otherwise the metadata could be partially written out when the snapshot is
> made.  There are hooks put into the 2.4x series kernels for ReiserFS to
> allow it to prepare for snapshots...but i don't think ext2 uses any
> mechanisms like this.  I don't know a whole lot about it, but that's what it
> looks like to me.

Well, before the LVM snapshot is created, it does a full sync of the device,
so the amount of metadata that could be out-of-date would be very small (if
any).

Granted, there is a possibility that the original data is corrupt, but 
Vegard reports everything OK on the original filesystem.  I assume that
e2fsck -f on the unmounted /dev/vg/nhome works OK?

> > cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/314': Input/output error
> > cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/315': Input/output error
> > cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/316': Input/output error
> > cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/317': Input/output error
> > 
> > [ *** This is another strangeness *** ]
> > middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# ls -l
> > .....
> > -rw-------    1 vegard   vegard       3454 Dec 11  1999 309
> > -rw-------    1 vegard   vegard       4530 Sep  9  1999 31
> > -rw-------    1 vegard   vegard       4147 Dec 11  1999 310
> > -rw-------    1 vegard   vegard       3294 Dec 11  1999 311
> > -rw-------    1 vegard   vegard       3452 Dec 11  1999 312
> > -rw-------    1 vegard   vegard       5775 Dec 13  1999 313
> > -rw-------    1 vegard   vegard       3292 Dec 22  1999 318
> > -rw-------    1 vegard   vegard       4318 Dec 22  1999 319
> > -rw-------    1 vegard   vegard       4384 Sep 11  1999 32

The same files with IO errors are those missing from the directory listing.
Based on the file timestamps, I would assume that these files have not
been changed in a long time, so it is not a metadata consistency issue.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
