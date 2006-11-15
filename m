Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAFFwuNE014632
	for <linux-lvm@redhat.com>; Wed, 15 Nov 2006 15:58:56 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GkNA8-0007Su-Fm
	for linux-lvm@redhat.com; Wed, 15 Nov 2006 15:58:56 +0000
Date: Wed, 15 Nov 2006 15:58:56 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] No label detected
Message-ID: <20061115155856.GT30653@agk.surrey.redhat.com>
References: <34984.18505.qm@web51015.mail.yahoo.com>
	<168918.46162.qm@web51015.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <168918.46162.qm@web51015.mail.yahoo.com>
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

Wipe the partition tables if you aren't using partitions.
(Back them up first of course.)

Alasdair
-- 
agk@redhat.com
