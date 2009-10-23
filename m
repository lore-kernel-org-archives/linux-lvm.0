Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NJFepk001523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:15:41 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1N1Pbv-00067S-U6
	for linux-lvm@redhat.com; Fri, 23 Oct 2009 20:15:40 +0100
Date: Fri, 23 Oct 2009 20:15:39 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Mirrored LVs
Message-ID: <20091023191539.GI10165@agk-dp.fab.redhat.com>
References: <4AE1B9FB.504@mortent.org> <20091023172914.GA12748@us.ibm.com>
	<1958a88d0910231128x2b072b48q504d56b03da39196@mail.gmail.com>
	<20091023190230.GA13442@us.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20091023190230.GA13442@us.ibm.com>
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

Specify ranges of physical extents at the end of the command line
along with --alloc anywhere to get the layout of your choosing.

e.g. lvcreate ... /dev/sdb:0-2000  /dev/sdc:0-2000  /dev/sdd:0

(Sometimes you need to force a single-extent gap to make it
do what you want, so sdb:0 sdb:2-2000 ...)

Alasdair
