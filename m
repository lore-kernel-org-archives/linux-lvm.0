Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8JF7q54016873
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 11:07:53 -0400
Received: from smtp1.versatel.nl (smtp1.versatel.nl [62.58.50.88])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8JF7nfN013750
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 11:07:50 -0400
Received: from [192.168.1.18] (unknown [80.101.105.201])
	by mail.vermeer.tv (Postfix) with ESMTPSA id B03B926F1BB
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 17:06:01 +0200 (CEST)
Subject: Re: [linux-lvm] Mirrored LV
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <20080916215759.GA11670@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com> <1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
Date: Fri, 19 Sep 2008 17:06:50 +0200
Message-Id: <1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2008-09-16 at 14:57 -0700, malahal@us.ibm.com wrote:
> Koen Vermeer [koen@vermeer.tv] wrote:
> > If I understand you correctly, you're statements are about when the
> > 'other device' is failing. Is this right? If so, then the log should
> > normally show that everything is synced. In that case, it's not of much
> > use in normal operation. Now, when one disk fails, I need to replace it,
> > and rebuild the mirror. So again, I don't need it, because I have to
> > copy everything anyway. Only when a disk is temporarily gone, it may be
> > of some use. Does this make sense?
> Yes, it makes sense for temporarily gone devices. Otherwise use corelog
> for your lvcreate command and you should be able to create mirrored LV.

I tried converting my lv to a mirrored one with --corelog, which worked
perfectly. However, after a reboot, the mirror is being recreated, which
takes quite some time and leaves me with a largely unresponsive system.

Is there some way around this? Would having the log on the master disk
fix this? If so, does it need it's own PV or LV or neither?

Thanks!

Koen
