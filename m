Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4CFuqSF020015
	for <linux-lvm@redhat.com>; Wed, 12 May 2010 11:56:52 -0400
Received: from n11.bullet.mail.ac4.yahoo.com (n11.bullet.mail.ac4.yahoo.com
	[74.6.228.83])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o4CFugQD016800
	for <linux-lvm@redhat.com>; Wed, 12 May 2010 11:56:42 -0400
Message-ID: <784380.93991.qm@web65513.mail.ac4.yahoo.com>
Date: Wed, 12 May 2010 08:56:40 -0700 (PDT)
From: Don Hoover <dxh@yahoo.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvdisplay ignoring filter in /etc/lvm.conf?
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

On futher-further testing..it appears that a "vgscan -vvvvvvvvvvvvvv" does not update the lvm cache like it used too before RHEL 5.5.

vgdisplay apparently uses the device list in the /etc/lvm/cache/.cache file.

If you make a change to your filter line in the lvm.conf, it won't take affect until you manually "rm /etc/lvm/cache/.cache", then run vgscan, and then the "Found duplicate PV" messages will be gone.
