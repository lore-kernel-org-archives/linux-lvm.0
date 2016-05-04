Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u44EteZx002130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 4 May 2016 10:55:40 -0400
Received: from nm24.bullet.mail.ne1.yahoo.com (nm24.bullet.mail.ne1.yahoo.com
	[98.138.90.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD5AB7822D
	for <linux-lvm@redhat.com>; Wed,  4 May 2016 14:55:35 +0000 (UTC)
Date: Wed, 4 May 2016 14:55:33 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <799090122.6079306.1462373733693.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <799090122.6079306.1462373733693.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] thin handling of available space
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 5/3/16, Mark Mielke <mark.mielke@gmail.com> wrote:

> I get a bit lost here in the push towards BTRFS and ZFS for people with these expectations as
> I see BTRFS and ZFS as having a similar problem. They can both still fill up.

Well of course everything fills up eventually. BTRFS and ZFS are integrated systems where the FS can see into the block layer and "do" block layer activities vs the clear demarcation between XFS/EXT and LVM/MD.

If you write too much to a Thin FS today you get serious data loss. Oh sure, the metadata might have landed but the file contents sure didn't. Somebody (you?) mentioned how you seemingly were able to write 4x90GB to a 300GB block device and the FS fsck'd successfully. This doesn't happen in BTRFS/ZFS and friends. At 300.001GB you would have gotten a write error and the write operation would not have succeeded.
