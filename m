Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n18A78Yk009434
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 05:07:08 -0500
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n18A6qjc029334
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 05:06:53 -0500
Received: by bwz4 with SMTP id 4so496599bwz.3
	for <linux-lvm@redhat.com>; Sun, 08 Feb 2009 02:06:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cfe2fc960902052301y82ca7b1g4c88815b16358c0d@mail.gmail.com>
References: <cfe2fc960902052301y82ca7b1g4c88815b16358c0d@mail.gmail.com>
Date: Sun, 8 Feb 2009 10:06:52 +0000
Message-ID: <b072968d0902080206m1fa2c9eu6c14fe3750fd85b3@mail.gmail.com>
Subject: Re: [linux-lvm] Accidental relabeling of LVM PV
From: David Robinson <zxvdr.au@gmail.com>
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

On Fri, Feb 6, 2009 at 7:01 AM, Shawn Hood <shawnlhood@gmail.com> wrote:
> I mistakenly ran parted mklabel on an LVM PV (/dev/sdg1).  Presumably,
> this damaged the metadata area of the PV.  Will `pvcreate
> --restorefile <backup> --uuid <old_uuid> /dev/sdg1` solve my problems

Yep, should do.

--Dave
