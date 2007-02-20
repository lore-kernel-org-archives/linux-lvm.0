Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KF2nog012723
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 10:02:49 -0500
Received: from lion.drogon.net (lion.drogon.net [195.10.231.26])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KF2h4b004665
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 10:02:44 -0500
Received: from lion.drogon.net (localhost [127.0.0.1])
	by lion.drogon.net (8.13.8/8.13.8) with ESMTP id l1KF2brN005374
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:02:37 GMT
Received: from localhost (gordon@localhost)
	by lion.drogon.net (8.13.8/8.13.8/Submit) with ESMTP id l1KF2bwn005371
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:02:37 GMT
Date: Tue, 20 Feb 2007 15:02:37 +0000 (GMT)
From: Gordon Henderson <gordon@drogon.net>
Subject: Re: [linux-lvm] LVM & snapshots
In-Reply-To: <45DAFBE8.2040009@gmail.com>
Message-ID: <Pine.LNX.4.64.0702201452390.27267@lion.drogon.net>
References: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
	<45DAFBE8.2040009@gmail.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 20 Feb 2007, Les Mikesell wrote:

> You might want to look at backuppc (http://backuppc.sourceforge.net/) to 
> manage the on-line backups.  It uses a scheme of compression and hard-linking 
> duplicate files to greatly reduce the storage space you need when keeping a 
> long history - especially if many files are unchanged over that time.   With 
> something that size you might still have to play some tricks with snapshots 
> or break it down into smaller directory runs.  It uses tar, smb, or rsync to 
> do the actual copies, then has some extra overhead for the compression and 
> linking jobs.  If it is too slow, you might run it against your existing 
> uncompressed copy so it has all day to make the long-term archive version.

Interesting, especially for the Win side of things, thanks!

However one of the things I may need is to use the backup server as a 
"live" server, should the original server ever catch fire (or whatever), 
so pull the backup from the bunker, drive it across town and with minimal 
changes, have it take the place of the live server (turn on nfs/samba on 
the appropriate locations) until we get a new one installed... So it's 
compression would be of minimal use, but it may have other uses...

Thanks,

Gordon
