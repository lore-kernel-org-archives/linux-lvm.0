Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBKBk19A007954
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 11:46:01 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CgLzF-0006JN-OA
	for linux-lvm@redhat.com; Mon, 20 Dec 2004 11:46:01 +0000
Date: Mon, 20 Dec 2004 11:46:01 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] patch for separator option
Message-ID: <20041220114601.GZ26670@agk.surrey.redhat.com>
References: <20041214093850.GA16922@suse.de> <20041216110052.GA4410@suse.de>
	<20041218203208.GN26670@agk.surrey.redhat.com>
	<20041220114135.GA8861@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041220114135.GA8861@suse.de>
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

On Mon, Dec 20, 2004 at 12:41:35PM +0100, Arvin Schnell wrote:
> '-s' is never documented as a shortcut for '--separator', neither
> in the help text nor in the man pages.  So 'vgs -s' does not have
> to work.  

Yes it does, because it's a very commonly-used option 
interactively so should have a short form, though the review 
might turn up an alternative letter that's suitable.

Alasdair
-- 
agk@redhat.com
