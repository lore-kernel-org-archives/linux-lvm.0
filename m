Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2E2dEPK007374
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2014 22:39:14 -0400
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2E2dCtQ008428
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2014 22:39:13 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so1896145pdj.22
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2014 19:39:12 -0700 (PDT)
Received: from leela (host-134-71-248-24.allocated.csupomona.edu.
	[134.71.248.24])
	by mx.google.com with ESMTPSA id gj9sm11470985pbc.7.2014.03.13.19.39.11
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Mar 2014 19:39:11 -0700 (PDT)
Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>	<20140312233505.GA1660@redhat.com>	<0c1301cf3e5c$1218eb10$364ac130$@acm.org>
	<20140313140158.GB5738@redhat.com>
In-Reply-To: <20140313140158.GB5738@redhat.com>
Date: Thu, 13 Mar 2014 19:39:06 -0700
Message-ID: <0d2301cf3f2e$93e8d970$bbba8c50$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] thinpool metadata size
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> From: Mike Snitzer
> Sent: Thursday, March 13, 2014 7:02 AM
>
> So if I were relegated to using upstream kernels, I'd track latest
> stable kernel if I could.

I can, and I guess I will :), it just adds a little extra volatility and
work. Maybe by the time the next long-term stable after 3.12 gets picked
thin provisioning and cache will have settled down enough to go with it.

> I'm not sure if the tool tracks the rate of change.  It may account for
> worst case of _every_ block for the provided number of thin devices
> _not_ being shared.

Interesting, then after I added an extra order of magnitude padding for the
number of snapshots, it's probably quite over allocated. But still, again
2.5G isn't very much in the scale of things.

Thanks.
