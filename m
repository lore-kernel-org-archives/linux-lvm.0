Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9BI9CAM007763
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 14:09:12 -0400
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9BI935d022611
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 14:09:03 -0400
Date: Wed, 11 Oct 2006 20:08:57 +0200
From: Jan Blunck <jblunck@suse.de>
Subject: Re: [linux-lvm] [RFC] Let udev play with snapshots
Message-ID: <20061011180857.GE4636@hasse.suse.de>
References: <20061011173421.GC4636@hasse.suse.de>
	<20061011174604.GQ17654@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061011174604.GQ17654@agk.surrey.redhat.com>
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
Cc: kay.sievers@vrfy.org

On Wed, Oct 11, Alasdair G Kergon wrote:

> We discussed this at OLS and decided that lvm2 would wait
> for udev to finish whatever it wanted to do before writing
> to the cow.  A yet-to-be-specified signalling mechanism would be 
> introduced to achieve this.

Yeah, I forgot to mention that what I propose is what Kay and me came up
with.

It isn't the cow that makes problems here. It is the first LV that we use for
cleaning. AFAIK this is a linear table. IMHO we don't need another signalling
mechanism but a sane way how udev can tell if there every will be a filesystem
in the LV that was just created.

At the moment udev is skipping over all LV with "*snapshot*" or "*error*"
mentioned in the table:

 PROGRAM!="/sbin/dmsetup status -j %M -m %m", GOTO="device_mapper_end"
 RESULT=="|*snapshot*|*error*", GOTO="device_mapper_end"

I think we should extend this by giving udev a way how it could tell if it
should try to do something with the device.
