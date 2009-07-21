Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6L98HUo029192
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 05:08:17 -0400
Received: from mail-qy0-f201.google.com (mail-qy0-f201.google.com
	[209.85.221.201])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6L984CA032132
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 05:08:04 -0400
Received: by qyk39 with SMTP id 39so2429039qyk.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 02:08:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A657BEB.6070200@cox.net>
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
	<4A657BEB.6070200@cox.net>
Date: Tue, 21 Jul 2009 18:08:04 +0900
Message-ID: <38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>
Subject: Re: [linux-lvm] vgs result code error
From: Masanari Iida <standby24x7@gmail.com>
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

Thanks for reply.

> You specified a PV, not a VG.  Try:
> # vgs vg01

Yes I know it should work.

# vgs vg01
  VG   #PV #LV #SN Attr   VSize VFree
  vg01   1   0   0 wz--n- 3.82G 3.82G


The point I want to say is,  vgs command _should_ return non-zero
exit status value, if vgs command returned an error.

Reference: man lvm(8)

DIAGNOSTICS
       All tools return a status code of zero on success or non-zero on  fail-
       ure.


Masanari
