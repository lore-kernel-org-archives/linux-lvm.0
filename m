Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9GJqYQY030894
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 20:52:34 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIubS-0002U2-5E
	for linux-lvm@redhat.com; Sat, 16 Oct 2004 20:52:34 +0100
Date: Sat, 16 Oct 2004 20:52:34 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Missing volume group device
Message-ID: <20041016195234.GI24242@agk.surrey.redhat.com>
References: <41706483.8080409@gmx.net> <1097948615.3069.4.camel@adler>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1097948615.3069.4.camel@adler>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Oct 16, 2004 at 12:43:35PM -0500, David Mohr wrote:
> On Fri, 2004-10-15 at 19:00, langelino wrote:
> > [root]# ls -l /dev/vg*
> > ls: /dev/vg*: No such file or directory
> Just a guess, but what about vgmknodes?
 
And LVM2 tools ignore any '/dev/' prefix anyway in this
context - 'lvresize vg01/lvol1' is sufficient.

Alasdair
-- 
agk@redhat.com
