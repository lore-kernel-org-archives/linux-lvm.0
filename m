Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GLCxmC000665
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 17:13:00 -0400
Received: from smtp6.versatel.nl (smtp6.versatel.nl [62.58.50.97])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8GLClHB007822
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 17:12:47 -0400
Received: from [192.168.1.102] (unknown [192.168.1.102])
	by mail.vermeer.tv (Postfix) with ESMTPA id 1FBE626F1BB
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 23:12:09 +0200 (CEST)
Subject: Re: [linux-lvm] Mirrored LV
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <20080916204241.GA9810@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
Date: Tue, 16 Sep 2008 23:12:45 +0200
Message-Id: <1221599565.6037.82.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@redhat.com

Op dinsdag 16-09-2008 om 13:42 uur [tijdzone -0700], schreef
malahal@us.ibm.com:
> The log records what regions of your master device are in sync with your
> other mirror device. It is used to synchronize the failed regions from
> the master to your other device when your 'other device' comes back to
> life. This should work whether your log device is in memory or on a PV
> by itself as long as you don't de-activate or restart your machine. The
> log data on a PV can be useful for reboots.

I had written a lot of text with extra questions, but it seems I just
don't get it - yet.

If I understand you correctly, you're statements are about when the
'other device' is failing. Is this right? If so, then the log should
normally show that everything is synced. In that case, it's not of much
use in normal operation. Now, when one disk fails, I need to replace it,
and rebuild the mirror. So again, I don't need it, because I have to
copy everything anyway. Only when a disk is temporarily gone, it may be
of some use. Does this make sense?

Best,
Koen
