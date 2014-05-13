Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4DJQFiQ029134
	for <linux-lvm@redhat.com>; Tue, 13 May 2014 15:26:15 -0400
Received: from feynman.spatium.org (feynman.spatium.org [178.248.248.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4DJQDg2003369
	for <linux-lvm@redhat.com>; Tue, 13 May 2014 15:26:14 -0400
Date: Tue, 13 May 2014 21:26:11 +0200
From: Michal Svoboda <lvm@spatium.org>
Message-ID: <20140513192611.GB686@feynman.spatium.org>
References: <20140508104546.GA610@feynman.spatium.org>
	<536CC710.4030708@redhat.com>
	<20140509124040.GA686@feynman.spatium.org>
	<536CE288.90608@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <536CE288.90608@redhat.com>
Subject: Re: [linux-lvm] No device found for PV but is actually fine
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

Marian Csontos wrote:
> Oh yes, you would need to restart lvmetad (on Fedora/RHEL/CentOS
> systemctl restart lvm2-lvmetad.service, not sure it is the same on
> Arch.)

Thanks - yeah it's the same.

> You may want to scrub the RAID as there may be data not written to
> both legs.

Thanks for this suggestion too. I did that, found some small amount of
mismatch blocks. Don't know if they are linked to this problem but
better safe than sorry.

Michal Svoboda
