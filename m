Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i83IvnJ0019599
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 19:57:49 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C3JFs-0005eQ-SU
	for linux-lvm@redhat.com; Fri, 03 Sep 2004 19:57:48 +0100
Date: Fri, 3 Sep 2004 19:57:48 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "broken" snapshot volume -- how to remove?
Message-ID: <20040903185748.GS6264@agk.surrey.redhat.com>
References: <Pine.LNX.4.44.0409032009040.30366-200000@lothlorien.homelinux.net>
	<20040903185214.GR6264@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040903185214.GR6264@agk.surrey.redhat.com>
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

And to run the lvm2 tools from where you compiled them,
prefix each command with 'lvm' (in the tools directory).
e.g. 'lvm vgscan'
     'lvm lvdisplay'
     'lvm lvremove vg1/snap1'

Alasdair
-- 
agk@redhat.com
