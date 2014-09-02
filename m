Received: from dhcp80-224.msp.redhat.com (dhcp80-224.msp.redhat.com
	[10.15.80.224])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s82M4gt4011239
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2014 18:04:43 -0400
Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA501AA8B8A419B@XCH11.scidom.de>
Date: Tue, 2 Sep 2014 17:04:47 -0500
Message-Id: <62C04FAE-DCA2-4688-B012-8FFF45F9308F@redhat.com>
References: <15785B7E063D464C86DD482FCAE4EBA501AA8B8A419B@XCH11.scidom.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] reduce size of snapshot - what is about previous
	reduce of file system ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Aug 28, 2014, at 7:50 AM, Lentes, Bernd wrote:

> Hi,
> 
> i have a lv which has a snapshot. Size of the snapshot was too big while creating. So I'd like now to reduce the size of the snapshot for being able to create a second one. man lvreduce says: Shrinking snapshot logical volumes (...) is supported as well. Ok, that's fine. But normally, before shrinking a lv, the file system has to be reduced. But does the snapshot have a fs ? I never ran a mkfs.xxxx on it. Can I just reduce the size without doing anything before ? Or do I have to provide a -r to lvreduce ?
> 
> Thanks for any information.

The (non-thinly-provisioned) snapshot fills up from beginning to end.  If it says it is 50% full, you should be able to reduce its size by roughly half.  Be sure to leave a good margin of space for snapshots to use, as they will become invalid if they are overfilled.

 brassow
