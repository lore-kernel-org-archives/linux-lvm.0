Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8D89Lav004300
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 04:09:21 -0400
Received: from soho.greekattic.com (soho.greekattic.com [83.146.34.92])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8D89Hxc019302
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 04:09:18 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Q: Online resizing ext3 FS
Date: Thu, 13 Sep 2007 09:09:10 +0100
Message-ID: <37238624DE95654997C360CA6CD36F8403B5BA2C@mimas.greekattic.local>
From: "Hiren Joshi" <josh@moonfruit.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-raid@vger.kernel.org

Sorry for the top quoting, I'm new to outlook =)

We did something similar, as the lv grows (with ext2online) the snapshot
will start filling up. If the resize fails, you will not be able to
(easily) revert directly back to the logical volume. This is because as
you start copying stuff back, the snapshot will be filling up. If you
want to be 100% safe, I would say go for some near line device that can
store 500G and backup to that!
HTH

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Stuart D. Gathman
Sent: 12 September 2007 21:04
To: LVM general discussion and development
Cc: linux-raid@vger.kernel.org
Subject: RE: [linux-lvm] Q: Online resizing ext3 FS

On Wed, 12 Sep 2007, Hiren Joshi wrote:

> Has anyone of you been using ext2online to resize (large) ext3 
> filesystems?
> I have to do it going from 500GB to 1TB on a productive system I was 
> wondering if you have some horror/success stories.
> I'm using RHEL4/U4 (kernel 2.6.9) on this system.

This brings up an LVM related question I've had.  Can I do this:

  1) take snapshot of 500GB LV
  2) resize source LV to 1TB
  3) run ext2online
  4a) resize succeeds - remove shapshot
  4b) resize fails horribly - copy shapshot to LV and restart
    4b.1) is there a way to "revert" the source LV to the snapshot?
    	(without allocating snapshot as big as source LV)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
591-6154 "Confutatis maledictis, flammis acribus addictis" - background
song for a Microsoft sponsored "Where do you want to go from here?"
commercial.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
