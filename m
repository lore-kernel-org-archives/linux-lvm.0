Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
References: <m28z9guz53.fsf@isnogud.escape.de>
    <20020226095919.F12832@lynx.adilger.int> <2412370000.1014745130@tiny>
From: Urs Thuermann <urs@isnogud.escape.de>
In-Reply-To: <2412370000.1014745130@tiny>; from Chris Mason on Tue,
    26 Feb 2002 12:38:50 -0500
Message-Id: <m2bsecdouv.fsf@isnogud.escape.de>
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
Date: Tue Feb 26 13:30:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Chris Mason <mason@suse.com> writes:

> For ext2, the best we could do would probably be a hack based on 
> locking the super.  As far as I know, nobody is planning on this,

:-(

> especially given how easy it is to go from ext2->ext3.

Some performance tests I made with ext2, ext3, and reiserfs convinced
me to stay with ext2.  ext3 was significantly slower than ext2 on some
operations (and reiserfs even worse than that).


urs
