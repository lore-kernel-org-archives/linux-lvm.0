Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAE7wOV30387
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 02:58:24 -0500
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAE7wGjB011088
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 02:58:17 -0500
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 53E2C1F41AE
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 08:57:56 +0100 (CET)
Message-ID: <4378437E.3090506@conterra.de>
Date: Mon, 14 Nov 2005 08:57:50 +0100
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 crash - unable to get the volume group up and
	running again
References: <Pine.LNX.4.63.0511132355020.15673@spock.photic.net>
In-Reply-To: <Pine.LNX.4.63.0511132355020.15673@spock.photic.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Jian,

have a look into /etc/lvm/archive/ and /etc/lvm/backup/ to understand
how your vgs and lvs are organized and how they changed during your last
LVM actions. May be this helps understanding the problem.

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
