Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3NIw3sD005679
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 19:58:03 +0100
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Hg3jf-0000it-40
	for linux-lvm@redhat.com; Mon, 23 Apr 2007 19:58:03 +0100
Date: Mon, 23 Apr 2007 19:58:03 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] multiple levels of snapshots
Message-ID: <20070423185803.GM26983@agk.fab.redhat.com>
References: <fd8dc0d20704231154l4a512d7ag2df2405ebcb17cd2@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd8dc0d20704231154l4a512d7ag2df2405ebcb17cd2@mail.gmail.com>
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

On Mon, Apr 23, 2007 at 02:54:37PM -0400, Boris Ostrovsky wrote:
> From what I can see, LVM tools don't allow creating multiple levels of
> snapshots (i.e. creating a
> snapshot of a snapshot). Is this a fundamental property of LVM/device
> mapper architecture
> or is it that this feature simply hasn't made it to LVM (yet)?

You could indeed set it up outside LVM using dmsetup.
 
Alasdair
-- 
agk@redhat.com
