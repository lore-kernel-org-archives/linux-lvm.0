Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6R7IIhp003004
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 08:18:18 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BpME6-0003x9-7S
	for linux-lvm@redhat.com; Tue, 27 Jul 2004 08:18:18 +0100
Date: Tue, 27 Jul 2004 08:18:18 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Message-ID: <20040727071817.GA14648@tykepenguin.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
	<20040722153408.GG10840@tykepenguin.com>
	<001001c47021$9accc800$6b02a8c0@ZACK2>
	<20040723065607.GB9681@tykepenguin.com>
	<003701c47363$bb61ec90$6b02a8c0@ZACK2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003701c47363$bb61ec90$6b02a8c0@ZACK2>
Sender: Patrick <patrick@tykepenguin.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 26, 2004 at 06:56:04PM -0400, Zachary Hamm wrote:
> 
> Changed the filter directed as suggested, no joy.  I still get the same
> errors.  Any other suggestions, or should I post more config information?
> There has to be something I'm missing.
> 

Can you tell me which drives are making up the MD devices and which (if any)
are to be used by LVM directly?

Its possible that it's just the filter that needs more work. maybe something 
like:

  filter = [ "a/md.*/", "r/.*/" ]
-- 

patrick
