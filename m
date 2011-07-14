Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6EHQA7O029972
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 13:26:10 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6EHQ8UI001414
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 13:26:09 -0400
Received: by eyx24 with SMTP id 24so421106eyx.33
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 10:26:08 -0700 (PDT)
MIME-Version: 1.0
From: Robert Fantini <robertfantini@gmail.com>
Date: Thu, 14 Jul 2011 13:25:27 -0400
Message-ID: <CALnM7zmBTb+NrE48X-PRLqeGiQzxO7f-BAVVqsYZdfgey17z5Q@mail.gmail.com>
Subject: [linux-lvm] locking_type using gfs and local lvm
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

I have a system setup with 'local' lvm2 . and want to test gfs using drbd.

If locking_type is set to '3'  ,  will that cause problems with the local lvm?
