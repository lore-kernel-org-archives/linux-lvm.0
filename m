Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5JN8Rlk031057
	for <linux-lvm@redhat.com>; Thu, 19 Jun 2008 19:08:27 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m5JN8Rdm026314
	for <linux-lvm@redhat.com>; Thu, 19 Jun 2008 19:08:27 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1K9TEx-0005GK-7n
	for linux-lvm@redhat.com; Fri, 20 Jun 2008 00:08:27 +0100
Date: Fri, 20 Jun 2008 00:08:27 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] snapshot bug
Message-ID: <20080619230827.GF20826@agk.fab.redhat.com>
References: <1213910624.9478.15.camel@iron.psg.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1213910624.9478.15.camel@iron.psg.net>
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

On Thu, Jun 19, 2008 at 02:23:44PM -0700, Ross Boylan wrote:
> seems to indicate that there is a bug in snapshotting that could affect
> even LVM2 based snapshots.

It's the format used for the metadata on disk that matters here.
If the default LVM2 metadata format is in use, there are no problems.
If the older LVM1 metadata format is used, you cannot create
and use new snapshots successfully.

To see which format you are using, run:
  vgs -o +vg_fmt

Alasdair
-- 
agk@redhat.com
