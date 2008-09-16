Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GLwEZ4017537
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 17:58:14 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8GLw0BA002599
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 17:58:01 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8GLw0a3030368
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 17:58:00 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8GLw0e3168490
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:58:00 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8GLw03d024871
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:58:00 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8GLvxT6024865
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:58:00 -0600
Date: Tue, 16 Sep 2008 14:57:59 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LV
Message-ID: <20080916215759.GA11670@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
	<1221599565.6037.82.camel@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1221599565.6037.82.camel@localhost>
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
To: linux-lvm@redhat.com

Koen Vermeer [koen@vermeer.tv] wrote:
> If I understand you correctly, you're statements are about when the
> 'other device' is failing. Is this right? If so, then the log should
> normally show that everything is synced. In that case, it's not of much
> use in normal operation. Now, when one disk fails, I need to replace it,
> and rebuild the mirror. So again, I don't need it, because I have to
> copy everything anyway. Only when a disk is temporarily gone, it may be
> of some use. Does this make sense?

Yes, it makes sense for temporarily gone devices. Otherwise use corelog
for your lvcreate command and you should be able to create mirrored LV.
