Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i83JLTJ0021676
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 20:21:29 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C3Jcm-0000aR-Eg
	for linux-lvm@redhat.com; Fri, 03 Sep 2004 20:21:28 +0100
Date: Fri, 3 Sep 2004 20:21:28 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "broken" snapshot volume -- how to remove?
Message-ID: <20040903192128.GT6264@agk.surrey.redhat.com>
References: <20040903185214.GR6264@agk.surrey.redhat.com>
	<Pine.LNX.4.44.0409032110230.30515-100000@lothlorien.homelinux.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0409032110230.30515-100000@lothlorien.homelinux.net>
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

On Fri, Sep 03, 2004 at 09:14:14PM +0200, Helge Bahmann wrote:
> hm... the documentation does not clearly state that it does handle lvm1
> meta-data correctly, but I assume it does?
 
Yes.  Although LVM2/device-mapper is unable to *activate* an LVM1 
snapshot because of a change to the on-disk snapshot format, it can 
remove one OK.

Alasdair
-- 
agk@redhat.com
