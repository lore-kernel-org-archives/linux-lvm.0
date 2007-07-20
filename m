Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6K4lBuh009316
	for <linux-lvm@redhat.com>; Fri, 20 Jul 2007 00:47:11 -0400
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.226])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6K4l9WU028823
	for <linux-lvm@redhat.com>; Fri, 20 Jul 2007 00:47:10 -0400
Received: by nz-out-0506.google.com with SMTP id r28so643284nza
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 21:47:09 -0700 (PDT)
Message-ID: <42f5c4430707192147l6822c50ep1fec18e871658e00@mail.gmail.com>
Date: Thu, 19 Jul 2007 22:47:09 -0600
From: "Thierry Thelliez" <thierry.thelliez.tech@gmail.com>
In-Reply-To: <42f5c4430707181038y689c36dbvb4a75dd6d5539478@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <42f5c4430707181038y689c36dbvb4a75dd6d5539478@mail.gmail.com>
Subject: [linux-lvm] Re: Live Cloning of Root LVM (or Dynamic LVM?)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Solved.

It seems that I had not correctly copied the /boot partition (or maybe
messed up the MBR).

I cleaned the MBR and /boot, copied and reinstalled Grub on the clone
drive and it worked! I was able to unplug the main drive, plug in the
clone and the system booted without any problem.

LVM is great in providing a live snapshot. But it was a pain to get
around the VolGroup identical names due to clonage.


Thierry
