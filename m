Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0A1GKr21520
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 20:16:20 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.194])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0A1GJtn001060
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 20:16:19 -0500
Received: by rproxy.gmail.com with SMTP id 1so755162rny
	for <linux-lvm@redhat.com>; Sun, 09 Jan 2005 17:16:19 -0800 (PST)
Message-ID: <e5146c2a0501091716eb12df4@mail.gmail.com>
Date: Sun, 9 Jan 2005 20:16:19 -0500
From: Sasha Z <kleptophobiac@gmail.com>
Subject: Re: [linux-lvm] Rebuilding physical volume metadata
In-Reply-To: <e5146c2a050107152570829576@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <e5146c2a04123020236f018fdb@mail.gmail.com>
	<20041231152235.GY26670@agk.surrey.redhat.com>
	<e5146c2a050102185078e20c7b@mail.gmail.com>
	<e5146c2a05010218512e804e2@mail.gmail.com>
	<e5146c2a050107152570829576@mail.gmail.com>
Reply-To: Sasha Z <kleptophobiac@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I got it to work by reverting to version 2.00.25. 2.00.32 is
completely nonfunctional for me.
