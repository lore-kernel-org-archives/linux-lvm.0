Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jA4Mgnm1024601
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 22:42:49 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EYAGn-0007kS-3p
	for linux-lvm@redhat.com; Fri, 04 Nov 2005 22:42:49 +0000
Date: Fri, 4 Nov 2005 22:42:49 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] building LVM2 static fails
Message-ID: <20051104224249.GU26394@agk.surrey.redhat.com>
References: <436BB40C.6020601@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <436BB40C.6020601@mvista.com>
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

On Fri, Nov 04, 2005 at 12:18:36PM -0700, Dave Jiang wrote:
> Why is autoconf still attempting dynamic linking while with -static? I 
> can build successfully without --enable-static_link.
 
That flag builds both dynamic and static versions.

Alasdair
-- 
agk@redhat.com
