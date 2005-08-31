Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7VLDfHQ024772
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 22:13:41 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAZtt-0004ik-AC
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 22:13:41 +0100
Date: Wed, 31 Aug 2005 22:13:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgscan & CDROM Solved
Message-ID: <20050831211341.GH15141@agk.surrey.redhat.com>
References: <20050829200548.GB11271@gutek.swissptt.ch>
	<20050831154651.GD15141@agk.surrey.redhat.com>
	<20050831211044.GB11522@gutek>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050831211044.GB11522@gutek>
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

On Wed, Aug 31, 2005 at 11:10:44PM +0200, Chris Osicki wrote:
>      filter = [ "r|/dev/cdrom.*|", "r|/dev/cdroms.*|" ]

Which is the same as:

  filter = [ "r|/dev/cdrom|" ]

The trailing .* is implied unless you append $ .

Alasdair
-- 
agk@redhat.com
