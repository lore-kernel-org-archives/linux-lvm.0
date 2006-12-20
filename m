Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBKDXpNa020367
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2006 08:33:51 -0500
Received: from x8.develooper.com (x8.develooper.com [216.52.237.208])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBKDXpJq003806
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2006 08:33:51 -0500
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <461895.53709.qm@web36104.mail.mud.yahoo.com>
References: <461895.53709.qm@web36104.mail.mud.yahoo.com>
Message-Id: <5D51136C-3227-44E1-84C1-8041CF66D387@develooper.com>
Content-Transfer-Encoding: 7bit
From: =?ISO-8859-1?Q?Ask_Bj=F8rn_Hansen?= <ask@develooper.com>
Subject: Re: [linux-lvm] pvmove broke my volumes
Date: Wed, 20 Dec 2006 14:33:34 +0100
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Dec 19, 2006, at 6:45, Martin Fick wrote:

> Any clues to how I can repair my volume group?

Did you try pvmove --abort ?  You might have to reboot, run pvmove -- 
abort and reboot again.

Also, be sure to check if there's an update to your devicemapper tools.


  - ask

-- 
http://develooper.com/ - http://askask.com/
