Received: from [10.34.131.188] (dhcp131-188.brq.redhat.com [10.34.131.188])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r089whkc001881
	for <linux-lvm@redhat.com>; Tue, 8 Jan 2013 04:58:44 -0500
Message-ID: <50EBEDD2.1080803@redhat.com>
Date: Tue, 08 Jan 2013 10:58:42 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130101220727.GA32103@iss.tu-darmstadt.de>
In-Reply-To: <20130101220727.GA32103@iss.tu-darmstadt.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] howto avoid initializing a particular volume-group
	at boot time?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 1.1.2013 23:07, Tom Assmuth napsal(a):
> hi and best wishes for the new year!
>
> Let me describe my scenario: I have a big volume group (let's say:
> /dev/vgbig/lv[1-9]) with a lot of snapshots in it and not used very
> often. Another volume group (/dev/vgsmall/lv[1-9]) contains data for
> normal use.
>
> Because of initializing /dev/vgbig/ at boot time the machine becomes
> usable after about 12h (twelve!)

I've some feeling there is big miss usage of snapshots here.

The 'old-style' snapshot was designed as a 'temporary' short time usable image 
of filesystem - i.e. for making backup, so the filesystem will not
change and backup will be consistent.

It seems like you are using snapshosts 'instead' of backups.

However if you have snapshot with storage size in hundreds of GB,
you need to realize, whole snapshots needs to be parsed (read in memory),
to figure out the block remapping layout (yep, there is very very simple
format to store this information, since design was for short livetime).

There are no plans to improve/fix this logic in old-style snapshots.

You may look at thin provisioning support for more advanced way how to
use multiple long-time living snapshots of the LV.

But also I'd probably suggest to use 'real' backups instead of
multiple snapshost - since the performance must be horrible.


> It would be ok if the machine would boot with /dev/vgsmall
> initialized, would do it's normal duty and in an late initscript would
> initialize /dev/vgbig/ (vgchange -ay /dev/vgbig/ ) It would be ok to
> wait now, because i could do my normal work.
>
> I thougt about a rule in /etc/lvm/lvm.conf, but i am not sure how to
> write it.


Fix your boot initramdisk and avoid calling  'vgchange -ay',
and replace it with code to properly activate only needed VG.

(Also try to replace those huge snapshots with backups and delete them - you 
will see a major jump in performance).

Zdenek
