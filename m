Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8EIrLrI007254
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 19:53:21 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C7IQb-0003Cb-8Y
	for linux-lvm@redhat.com; Tue, 14 Sep 2004 19:53:21 +0100
Date: Tue, 14 Sep 2004 19:53:21 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] device-mapper major number
Message-ID: <20040914185321.GE2377@agk.surrey.redhat.com>
References: <1095187380.3140.11.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1095187380.3140.11.camel@rich>
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

The answers differ depending on which device-mapper you're using.
e.g. kernel 2.4 dm supports multiple major numbers; 2.6 dm does not yet.
At various times the parameter 'major' let you set the major number; 
unsure of the current status.

Alasdair
-- 
agk@redhat.com
