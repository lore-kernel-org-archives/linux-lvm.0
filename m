From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] questions
Message-ID: <20011108021452.B5485@tiger.bigcats.invalid>
References: <20011106000923.B3409@bunuel.tii.matav.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011106000923.B3409@bunuel.tii.matav.hu>; from mag@bunuel.tii.matav.hu on Tue, Nov 06, 2001 at 12:09:23AM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Nov  7 19:26:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Magosanyi!

Magosanyi Arpad (mag@bunuel.tii.matav.hu) wrote 14 lines:

> What would you check on disk related to snapshots? 

There shall be no snapshot of a snapshot.  (Yes, I have that
right here on my disk.  Can't remove the snapshot-of-snapshot
(segfault), can't remove the snapshot (under snapshot)).

Does the snapshot point to the correct device?  (Happened to
me, too.  Usually after an (unrelated?) crash.  No idea how
to check -- but all Devices Under Snapshot shall have at
least 1 snapshot.)

Does the persistent snapshot-map look like it could work on
that device claims to be against? (bigger than the device
in question?)

Ability to turn persistent snapshots into non-persistent ones
(cleaned up after reboot) -- so that rogue ones can be
removed during a reboot.

-Wolfgang
