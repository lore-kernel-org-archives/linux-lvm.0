Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
References: <m28z9guz53.fsf@isnogud.escape.de>
    <20020226095919.F12832@lynx.adilger.int>
From: Urs Thuermann <urs@isnogud.escape.de>
In-Reply-To: <20020226095919.F12832@lynx.adilger.int>; from Andreas Dilger
    on Tue, 26 Feb 2002 09:59:19 -0700
Message-Id: <m2elj8dp2t.fsf@isnogud.escape.de>
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
Date: Tue Feb 26 13:25:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolabs.com> writes:

> I _think_ that if you tried to mount the ext2 snapshot, it will
> still work, even though it is inconsistent.

I think that wouldn't help me much, if I want to dump(8) the file
system for backups.  AFAIK, dump(8) opens the device file,
i.e. /dev/vg0/snap which has an inconsistent image.

> Obviously it would be better to fix it so that ext2 snapshots are
> always consistent.

ACK!


urs
