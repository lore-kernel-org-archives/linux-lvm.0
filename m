From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
Message-Id: <151920000.1010771872@tiny>
In-Reply-To: <20020111173902.GA14171@tykepenguin.com>
References: <51F1673834E2D211A9B400104B3FFD5A029C2C5C@cdserv.meridian-data.com>
    <20020111173902.GA14171@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Jan 11 11:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

[ reiserfs panic on io error when snapshots get full ]

BTW, 2.4.18-pre3 includes a patch from Oleg Drokin to return IO_ERROR instead
of panic in reiserfs_find_entry.  It is almost the same as Patrick's, which
means more work is needed to make it safe for all io errors.  But for lvm
usage, it is fine.

-chris
