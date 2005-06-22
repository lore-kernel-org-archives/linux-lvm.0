Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5MFZj3N007088
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 16:35:45 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dl7GS-0007eh-SS
	for linux-lvm@redhat.com; Wed, 22 Jun 2005 16:35:44 +0100
Date: Wed, 22 Jun 2005 16:35:44 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 2.01.12 fails to read lvm1 metadata
Message-ID: <20050622153544.GZ4195@agk.surrey.redhat.com>
References: <20050622074627.GA1892@wavehammer.waldi.eu.org>
	<20050622145859.GE22056@null.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050622145859.GE22056@null.msp.redhat.com>
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

On Wed, Jun 22, 2005 at 09:58:59AM -0500, AJ Lewis wrote:
> Again - this is an experimental patch - please treat it with caution.
 
That's a correct patch.
There's another patch needed for lvcreate (see CVS).

Note that this was an internal error that should not have affected
on-disk metadata.  [An assertion designed to avoid corrupt metadata
reaching disk.]

Alasdair
-- 
agk@redhat.com
