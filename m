Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i53F7F029606
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 11:07:15 -0400
Received: from monkey.sneakemail.com (clean.sneakemail.com [38.136.15.35])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i53F7AXn031095
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 11:07:10 -0400
Date: Thu, 3 Jun 2004 17:07:02 +0200
Subject: Re: [linux-lvm] PV resizing
Message-ID: <26212-84043@sneakemail.com>
References: <82hdttvdgn.fsf@eloise.tuxfamily.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82hdttvdgn.fsf@eloise.tuxfamily.net>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Yann Droneaud wrote 28 lines:

> I have a PV set in a partition (dos partition table).

> Can i resize (grow) this partition so that the PV become bigger, 
> and new space will be available to the VG the PV is currently inside.

Why not make another partition, turn that into a PV and add that
PV to the VG?

-Wolfgang
