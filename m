Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k15Hw8XG024419
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 17:58:08 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F5o9I-0005rD-JZ
	for linux-lvm@redhat.com; Sun, 05 Feb 2006 17:58:08 +0000
Date: Sun, 5 Feb 2006 17:58:08 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Accidental removal of logical volume - any way to
	salvage?
Message-ID: <20060205175808.GA22481@agk.surrey.redhat.com>
References: <77ec93690602050953r6ada49aat@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77ec93690602050953r6ada49aat@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Feb 05, 2006 at 06:53:45PM +0100, Martin Lindquist wrote:
> could anyone first of all tell me if there is any way at all to salvage the
> data from the logical volume "main"? 

man vgcfgrestore if you retained metadata backups from /etc from before
you deleted the LV.

Failing that, if you're using LVM2 you might still be able to salvage
the metadata from the from the front of the disk.

Alasdair
-- 
agk@redhat.com
