Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KDlO49003107
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 08:47:25 -0500
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1KDlMp9023953
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 08:47:23 -0500
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.12.11.20060308/8.12.11) with ESMTP id
	l1KDlLSB031477
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 07:47:22 -0600
Received: from Jill-Mikesells-Computer.local (les2-openvpn.futuresource.com
	[10.200.1.18])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id l1KDlLh29246
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 07:47:21 -0600
Message-ID: <45DAFBE8.2040009@gmail.com>
Date: Tue, 20 Feb 2007 07:47:20 -0600
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM & snapshots
References: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
In-Reply-To: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Gordon Henderson wrote:
> 
> I tried LVM a few years back and "burnt my fingers" as it were - I found 
> it slow and unstable, but times are changing, progress being made, etc. 
> so does anyone have any input on it's current stability and usability?
> 
> Basically, I'm running out of steam on some backup servers I have - 
> trying to copy several TB of data using cp -al, then rsyncing on top of 
> it (and then copying the copy, etc. to give me 30 days of backups) has 
> been working well for some time, but the data-set is increasing all the 
> time, and the cp -al is currently taking 4-5 hours, so snapshotting via 
> LVM is looking like it's something I think I ought to be looking into 
> again.
> 
> The current data-set is 5TB, and having 150TB of storage isn't an option 
> right now... Essentially I need to be able to keep 30 cycles (days) of 
> snapshots on a server that is not a live server (ie. it's a huge disk 
> array, in a secure bunker backing up several remote servers every day, 
> and dumping the occasional snapshot to tape for archive. Data comes into 
> the server via a 100Mb line & rsync from the remote servers).
> 
> So is LVM(2) up to this task these days, or should I really be looking 
> at something else?

You might want to look at backuppc (http://backuppc.sourceforge.net/) to 
manage the on-line backups.  It uses a scheme of compression and 
hard-linking duplicate files to greatly reduce the storage space you 
need when keeping a long history - especially if many files are 
unchanged over that time.   With something that size you might still 
have to play some tricks with snapshots or break it down into smaller 
directory runs.  It uses tar, smb, or rsync to do the actual copies, 
then has some extra overhead for the compression and linking jobs.  If 
it is too slow, you might run it against your existing uncompressed copy 
so it has all day to make the long-term archive version.

-- 
   Les Mikesell
    lesmikesell@gmail.com
