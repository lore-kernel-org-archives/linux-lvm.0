Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l93JSkmP006036
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:28:46 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Id9tm-0007Fk-NR
	for linux-lvm@redhat.com; Wed, 03 Oct 2007 20:28:46 +0100
Date: Wed, 3 Oct 2007 20:28:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Poison pills
Message-ID: <20071003192846.GP18444@agk.fab.redhat.com>
References: <Pine.LNX.4.44.0710031449370.29351-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0710031449370.29351-100000@bmsred.bmsi.com>
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

On Wed, Oct 03, 2007 at 03:06:42PM -0400, Stuart D. Gathman wrote:
> What happens in linux LVM?  If it sees 
> two conflicting metadatas for the same VGID, what happens?
 
It'll apply some simple rules to distinguish them (e.g. if one has the
current hostname written into its metadata identifying the machine where
it was created and the other doesn't it'll select that one), but if it
can't tell them apart it will pick one at random (not in the strict
sense of that word - in identical external conditions it'll always
choose the same one) and use that.   [The hostname test is less use than
you might think, as many VGs are created with identical hostnames during
installation, and others are accessed early in the boot sequence before
the hostname has been set.]

BTW vgrename accepts the VGID as a parameter.

Alasdair
-- 
agk@redhat.com
