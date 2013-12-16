Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBG9a85n006526
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 04:36:08 -0500
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBG9a7Lv000924
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 04:36:07 -0500
Received: by mail-ee0-f52.google.com with SMTP id d17so2087838eek.11
	for <linux-lvm@redhat.com>; Mon, 16 Dec 2013 01:36:07 -0800 (PST)
Received: from [192.168.3.62] (mail.opportunity.cz. [85.70.16.240])
	by mx.google.com with ESMTPSA id p45sm40102682eeg.1.2013.12.16.01.36.05
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Dec 2013 01:36:05 -0800 (PST)
Message-ID: <52AEC983.6070107@gmail.com>
Date: Mon, 16 Dec 2013 10:36:03 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <52AE1740.2060501@libertytrek.org>
In-Reply-To: <52AE1740.2060501@libertytrek.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to tell if thin provisioning is used?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.12.2013 21:55, Tanstaafl napsal(a):
> Hello,
>
> Is there a way to tell if thin-provisioning is being used on a given volume
> group?
>

lvs  -o+segtype

and check if you can see the type: thin or thin-pool.

Zdenek.
