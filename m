Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB52SUVw030299
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 21:28:31 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1L8QQg-0004Hp-PB
	for linux-lvm@redhat.com; Fri, 05 Dec 2008 02:28:30 +0000
Date: Fri, 5 Dec 2008 02:28:30 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] volume group device nodes are left behind after
	removing a san snapshot
Message-ID: <20081205022830.GV26097@agk.fab.redhat.com>
References: <8D07631D47C3CB4F867AD7BCF07D5C232CAD@excs01.bucoks>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C232CAD@excs01.bucoks>
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

The bottom line is whether /dev/vgname is still in use or not.
Use dmsetup info -c to check for any devices with names beginning vgname.

If you're sure it isn't there, try removing the directory /dev/vgname by hand
and check vgmknodes doesn't put it back.

Alasdair
-- 
agk@redhat.com
