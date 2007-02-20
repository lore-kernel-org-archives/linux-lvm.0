Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KJCEWA001972
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 14:12:14 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.175])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KJBLoa012537
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 14:12:12 -0500
Received: by ug-out-1314.google.com with SMTP id x30so821800ugc
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 11:12:12 -0800 (PST)
Message-ID: <87f94c370702201112n725a6482gdf164bcd2f9c4fc1@mail.gmail.com>
Date: Tue, 20 Feb 2007 14:12:12 -0500
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] LVM & snapshots
In-Reply-To: <Pine.LNX.4.64.0702201452390.27267@lion.drogon.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
	<45DAFBE8.2040009@gmail.com>
	<Pine.LNX.4.64.0702201452390.27267@lion.drogon.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 2/20/07, Gordon Henderson <gordon@drogon.net> wrote:
> On Tue, 20 Feb 2007, Les Mikesell wrote:
>
> > You might want to look at backuppc (http://backuppc.sourceforge.net/) to
> > manage the on-line backups.  It uses a scheme of compression and hard-linking
> > duplicate files to greatly reduce the storage space you need when keeping a
> > long history - especially if many files are unchanged over that time.   With
> > something that size you might still have to play some tricks with snapshots
> > or break it down into smaller directory runs.  It uses tar, smb, or rsync to
> > do the actual copies, then has some extra overhead for the compression and
> > linking jobs.  If it is too slow, you might run it against your existing
> > uncompressed copy so it has all day to make the long-term archive version.
>
> Interesting, especially for the Win side of things, thanks!
>
> However one of the things I may need is to use the backup server as a
> "live" server, should the original server ever catch fire (or whatever),
> so pull the backup from the bunker, drive it across town and with minimal
> changes, have it take the place of the live server (turn on nfs/samba on
> the appropriate locations) until we get a new one installed... So it's
> compression would be of minimal use, but it may have other uses...
>
> Thanks,
>
> Gordon
>
You might want to look into rdiff-backup.

It keeps a uncompressed copy of all backed up data.  Then compressed
deltas to get you to older revisions.

The uncompressed copy should be easy to serve via Samba / NSF.

Suse has been including it in their distro for a while.  I don't know
about others.

It is written in python (I think), so it may not be fast enough for
you, but it only ships the deltas across the wire (like rsync), so it
is worth looking into.

Greg
-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
