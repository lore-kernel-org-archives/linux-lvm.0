Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1EEct101849
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 09:38:55 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1EEcros005579
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 09:38:54 -0500
Date: Tue, 14 Feb 2006 15:38:52 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] can't create a PV
Message-ID: <20060214143852.GB21794@percy.comedia.it>
References: <20060206215141.GB7492@tui.site> <20060214091946.GA8977@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060214091946.GA8977@tui.site>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 14, 2006 at 09:19:46AM +0000, Gunther Clasen wrote:
>
>Curiously, these 4 partitions had all been used in a software-RAID
>volume. So I reckon that lvm somehow picked up the metadata of the
>MD-device and refused to work.

this is documented in the manpage for lvm.conf

- snip -
md_component_detection (If set to 1, LVM2 will ignore devices
used as components of software RAID (md) devices by looking  for
md  superblocks. This doesn't always work satisfactorily e.g. if
a device has been  reused  without  wiping  the  md  superblocks
first.
- end snip -


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
