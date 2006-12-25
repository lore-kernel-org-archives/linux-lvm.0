Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBPIv2pJ020828
	for <linux-lvm@redhat.com>; Mon, 25 Dec 2006 13:57:02 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBPIuwAA025272
	for <linux-lvm@redhat.com>; Mon, 25 Dec 2006 13:57:01 -0500
Message-ID: <45901EF8.3030804@davidb.org>
Date: Mon, 25 Dec 2006 10:56:56 -0800
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV's timestamps
References: <458FD72D.7070104@oxeva.fr>
In-Reply-To: <458FD72D.7070104@oxeva.fr>
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
To: gabriel@oxeva.fr, LVM general discussion and development <linux-lvm@redhat.com>

Gabriel Barazer wrote:

> Maybe it's only a feature request, or the feature is hidden, but I
> recently had the need of timestamping my LV's, especially snapshot LV's.
> I need to  know when the snapshot has been taken, or the snapshot LV
> creation date (which is IMHO the same).

The easy workaround is to touch a file just before making the snapshot.
At least this works in the common case where you need the snapshot time for
incremental backups to work correctly.

David Brown
