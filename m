Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8I1MxjV025442
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:22:59 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.211.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8I1Mmpx000446
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:22:48 -0400
Received: by ywh4 with SMTP id 4so787033ywh.6
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:22:48 -0700 (PDT)
Sender: Benjamin Kingston <acidgrim@gmail.com>
Message-ID: <4AB2E0E4.70205@gmail.com>
Date: Thu, 17 Sep 2009 18:22:44 -0700
From: Ben Kingston <benjamin.kingston@bencloud.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Curious about LVM PV failure and mitigation
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

I've been wondering for a while what happens if a drive fails that is
part of a VGroup (spanned across PV's, not Raid0), specifically in a
active VG. Does LVM continue working as though there was a large sector
failure? What happens if the first physical drive that the VG was
created on fails? Is the entire Volume lost?

I've hypothosized a mitigation method for the first physical drive
failing. I would create the VG on an SD card so that all of the metadata
would be stored there, and if a moving drive fails, it wouldn't take the
LVM with it. This would also an easy way to have a remote dd image of
any other important volume metadata (e.g. Luks). But before I do this,
I'd like some ideas on paramaters. Would turning on the write protect
lock cause any issues, after all PV's are added, to writing to the HDD
with EXT4? What would be an optimal SD size? I'm guessing 256MB would be
sufficient, but I don't want to worry about messing up EXT4's superblocks.

Thanks for the help.
