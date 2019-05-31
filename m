MIME-Version: 1.0
From: Shawn Guo <shawn.gsc@gmail.com>
Date: Fri, 31 May 2019 15:13:39 +0800
Message-ID: <CAJBJ56LoBQF_cqfXwKdHVqhJfRHioBN9BJCy_fiqDRW36pCPuA@mail.gmail.com>
Subject: [linux-lvm] A couple of questions on locking library
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

Hi David, Zdenek,

Comparing to stable-2.02 branch, I noticed that there are significant
changes around locking infrastructure on master branch.  I have a
couple of questions regarding to these changes.

1. I see External Locking support was removed as part of clvmd
removal. What's the reason for dropping External Locking support?  I'm
asking because we are investigating the possibility to use hardware
assisted locking for cluster, in form of External Locking extension.

2. It seems there have never been real support for LV (Logic Volume)
locking.  On stable-2.02 branch, the LV locking interface is used as
activation path instead of real locking on LV.  And on master branch,
activation path gets separated off from locking infrastructure.  As
the result, the LV interface is dropped completely from locking
infrastructure.  My question is why there have never been LV locking
support.  Is the LV locking support an invalid requirement at all?  Or
it's just because no one cares about it enough to add the support?

Thanks for your time, and appreciate any comment you would give here.

Regards,
Shawn
