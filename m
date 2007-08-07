Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l77LYCDd009022
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 17:34:12 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IIWgu-0006Sz-EE
	for linux-lvm@redhat.com; Tue, 07 Aug 2007 22:34:12 +0100
Date: Tue, 7 Aug 2007 22:34:12 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Best practice: metadata backup
Message-ID: <20070807213412.GC2064@agk.fab.redhat.com>
References: <20070807190153.GV2064@agk.fab.redhat.com>
	<Pine.LNX.4.44.0708071653390.17321-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0708071653390.17321-100000@bmsred.bmsi.com>
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

On Tue, Aug 07, 2007 at 04:56:01PM -0400, Stuart D. Gathman wrote:
> I meant metadata backups.  AIX keeps a copy on each physical volume
> (using quorum to ensure a majority of the copies agree).  I was wondering
> how linux LVM would handle metadata backup on an all LVM system.  Seems
> like you would still need a small non LVM filesystem just for that.

The backups in /etc/lvm are backups in case you lost or overwrote the metadata
accidentally.

There are already copies (and backups of previous copies) on each physical
volume (in the default configuration) and there's an automated process to deal
with simple problems like power failure during a metadata update leading to
disagreement between the copies.
 
Alasdair
-- 
agk@redhat.com
