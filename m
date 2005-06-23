Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5N138u14270
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 21:03:08 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.206])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5N1339r008570
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 21:03:03 -0400
Received: by zproxy.gmail.com with SMTP id 9so710926nzo
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 18:02:53 -0700 (PDT)
Message-ID: <3cd4d99305062218025d6c3059@mail.gmail.com>
Date: Thu, 23 Jun 2005 11:02:52 +1000
From: Jeff Ewing <jeffiewing@gmail.com>
In-Reply-To: <20050622141522.GD22056@null.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <3cd4d99305062204374db9549@mail.gmail.com>
	<20050622141522.GD22056@null.msp.redhat.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: PV segments corrupted in vg1 : LVM corrupted
Reply-To: Jeff Ewing <jeffiewing@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: AJ Lewis <alewis@redhat.com>

The server was running kernel 2.4.27+lvm1 until one month ago. Was upgraded
to 2.6.8+lvm2 and running and rebooted several times since.
> 
> This is an lvm1 file - all lvm2 files are in /etc/lvm/
>  
The output from "vgcfgrestore vg1" is 
  PV /dev/md1 is a different format (seqno lvm1)
  Restore failed.

> > 2. What is the VG free count and how can it be reset to 0?
> > 
> > 3. What other tools available to fix broken lvm.
> 
> You could try going back to an older version of the lvm2 tools and see if
> it fixes things.
Without /var it is a little tricky to downgrade the packages(package
lists etc are missing). Perhaps install on another server and copy
over (ssh fails but nfs is working).

Thank you
