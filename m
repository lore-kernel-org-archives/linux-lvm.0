Received: from fentible.pjc.net (vpnuser3.stuttgart.redhat.com [172.16.4.3])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBLFcQsF013298
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 15:38:26 GMT
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1Cgm5i-0002he-7F
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 15:38:26 +0000
Date: Tue, 21 Dec 2004 15:38:26 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] lvm/fs issue
Message-ID: <20041221153825.GB32084@tykepenguin.com>
References: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
Sender: Patrick <patrick@tykepenguin.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Dec 21, 2004 at 03:19:49PM -0000, Rosenstrauch, David wrote:
> Hi.  Having an odd problem with lvm and/or my file system.  Can anyone offer
> any ideas what might be wrong?
> 

The data is fine - it's LVM trying to read the extended partition (which
contains no data).

Simply exclude /dev/sda3 using a filter in /etc/lvm/lvm.conf.

-- 

patrick
