Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4C1UUQ2030324
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 21:30:32 -0400
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4C1UT24026785
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 21:30:30 -0400
Received: by wwk4 with SMTP id 4so5316442wwk.3
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 18:30:29 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 11 May 2011 21:30:29 -0400
Message-ID: <BANLkTikT7bzpAt29kUJ4QY5b9yQaVyZUVw@mail.gmail.com>
From: =?ISO-8859-1?Q?Eric_B=E9langer?= <snowmaniscool@gmail.com>
Subject: [linux-lvm] vgchange --sysinit tries to write on filesystem.
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

Since updating to lvm2 2.02.85, I'm getting the following message on
bootup after "/sbin/vgchange --sysinit -a y" is ran by the system
initscripts:

/etc/lvm/cache/.cache unlink failed: Read-only filesystem

This happens because the root partition is still mounted as read-only
at that point in the booting process.  Unless I'm mistaken, I believe
the use of the --sysinit option should prevent such error to happen.

Thanks,
Eric Belanger
