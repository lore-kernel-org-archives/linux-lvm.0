Received: from fentible.pjc.net (vpnuser2.stuttgart.redhat.com [172.16.4.2])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i3LFZaPr031753
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 16:35:36 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.31)
	id 1BGJlA-0007B7-N6
	for linux-lvm@redhat.com; Wed, 21 Apr 2004 16:35:36 +0100
Date: Wed, 21 Apr 2004 16:35:36 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] OS (Debian Sarge) reinstall led to my lvm partitions
	being marked 82 "Linux swap!"
Message-ID: <20040421153536.GB22559@tykepenguin.com>
References: <408606D3.60102@pobox.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <408606D3.60102@pobox.com>
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

On Wed, Apr 21, 2004 at 12:29:55AM -0500, Mike Roark wrote:
> 
> I'm tempted to try changing the partition type using fdisk or cfdisk, 
> but I'd like to be certain that it will only change the partition type 
> and not touch anything else before I try it, so I'm appealing here first 
> for any lvm-ish wisdom that you can offer.


Just changing the partition type is perfectly safe - provided you don't change
any other partition parameters! if the partition type is wrong then LVM1 will
fail to recognise the VGs so that sounds like it is your problem.


-- 

patrick
