Received: from red.mvo.lan (ovpn-116-43.ams2.redhat.com [10.36.116.43])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0HA2cPf001781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 05:02:39 -0500
From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>
In-reply-to: <87zjmxzmga.fsf@red.mvo.lan>
Date: Fri, 17 Jan 2014 12:02:38 +0200
Message-ID: <87y52fdiyp.fsf@red.mvo.lan>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Identifying useable block devices
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

[ I am not subscribed, so please keep me in CC.  I'll just reply to
  myself, sorry for breaking the threading.
]

Peter Rajnoha wrote:

> For now, these flags are only documented directly in libdevmapper.h
> (as they were only meant to direct udev rules and these situations
> were all audited directly by communicating with other teams).  I could
> probably add a few lines to the man page directly though as others
> could use this even when reading udev database...

That would be great!

> However, for your purpose, I'd better use
> DM_UDEV_DISABLE_OTHER_RULES_FLAG which just tells that everything else
> other than DM/LVM related should skip this device.

Hmm, DM_UDEV_DISABLE_OTHER_RULES_FLAG is (now) set for thin volumes, as
far as I can tell.  This is what lead me down this rabbit hole in the
first place: UDisks2 _does_ ignore events for nodes with
DM_UDEV_DISABLE_OTHER_RULES_FLAG set, and since Fedora 20, this causes
it to ignore thin volumes.

The use of DM_UDEV_DISABLE_OTHER_RULES_FLAG or any other such flag in
UDisks2 looked like a ugly hack to me, so I started looking for
alternatives.

The best option seemed to be to ignore any DISABLE flag in UDisks, and
to set UDISKS_IGNORE for LVM2 block devices that do not have the
/dev/VG/LV symlink.

Now you say that DM_UDEV_DISABLE_OTHER_RULES_FLAG is actually the Right
Way, but it seems to be buggy re thin volumes.  Correct?

(Of course, UDisks2 should not ignore _events_ but should ignore
_nodes_.  Otherwise, it will get confused when a node acquires a DISABLE
flag later on, which happens to thin pools.  What a mess! :-)
