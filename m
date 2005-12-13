Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBDD4KBM029603
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 13:04:20 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Em9pM-0004MP-0A
	for linux-lvm@redhat.com; Tue, 13 Dec 2005 13:04:20 +0000
Date: Tue, 13 Dec 2005 13:04:19 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Meta-flag: don't activate on boot
Message-ID: <20051213130419.GH25866@agk.surrey.redhat.com>
References: <15tbqzlmegk.fsf@surveyor.uio.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15tbqzlmegk.fsf@surveyor.uio.no>
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

On Tue, Dec 13, 2005 at 12:19:39PM +0100, Trond Hasle Amundsen wrote:
> It would be neat if there was a way to flag that a particular volume
> group should not be activated by default, typically at boot time,
> i.e. running 'vgchange -ay' shouldn't activate it. This is especially
> useful in clustering environments, when you want to "share" a volume
> group across several nodes for redundancy, but only activate it on one
> node at a time.
 
You can already do this using tagging.

Documentation:
  Man pages for lvm, lvm.conf, vgchange, lvchange & lvcreate.

  http://people.redhat.com/agk/talks/LVM2-LinuxTag2005/
    Tagging, Slide 30 onwards

  http://sources.redhat.com/cgi-bin/cvsweb.cgi/~checkout~/LVM2/doc/tagging.txt?rev=1.1&content-type=text/plain&cvsroot=lvm2
    original specification

Alasdair
-- 
agk@redhat.com
