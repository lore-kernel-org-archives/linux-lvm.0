Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8854VwL015753
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2010 01:04:31 -0400
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8854ITq029170
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2010 01:04:19 -0400
Received: by wwi17 with SMTP id 17so981203wwi.3
	for <linux-lvm@redhat.com>; Tue, 07 Sep 2010 22:04:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=2K2=V3Pj8aMx7uB_+Fqn12ZWa1EteKQhH=uAu@mail.gmail.com>
References: <AANLkTinf2_y2j+i_xNZpiJBQNkkYo7_xv8iLnT-tHpVY@mail.gmail.com>
	<4C7F7B48.3010005@redhat.com>
	<AANLkTi=2K2=V3Pj8aMx7uB_+Fqn12ZWa1EteKQhH=uAu@mail.gmail.com>
Date: Wed, 8 Sep 2010 01:04:17 -0400
Message-ID: <AANLkTim2mRkOGRuuMgbNtC8WJqppuFUdSLf7puUHy5ug@mail.gmail.com>
From: Tom Wizetek <tom@wizetek.com>
Subject: Re: [linux-lvm] Removing a failed PV from VG/LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Please disregard my previous inquiry about pvcreate on loop. I got it
to work by doing 'losetup /dev/loop0 disk-image'. That was off-topic
anyway.

To state what information I'm looking for in a more concise form:
How to go about restoring a VG without having to physically replace a
failed PV? Is it possible to create a "fake" PV, restore LVM metadata,
fsck the filesystem and finally remove the PV?

-- 
TW
