Subject: RE: [linux-lvm] mounting snapshot errors
From: R Dicaire <rdicaire@kritek.net>
In-Reply-To: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560F62@s99mail06>
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560F62@s99mail06>
Message-Id: <1075274923.337.23.camel@ws.rdb.linux-help.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Jan 28 02:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm <linux-lvm@sistina.com>

On Tue, 2004-01-27 at 21:53, Little, Chris wrote:
> is the filesystem you are snapshotting still mounted when you execute the
> snapshot?  They need to be offline before the snapshot takes place.

Yes, they are still mounted when I take a snapshot, I must have missed that
in the docs, that in itself poses a problem as I then cant umount the volumes
without killing services. I'd understood the snapshotting process as being
able to snapshot a live filesystem, and then mount the snapshot to perform
backups from it instead of the live filesystem. Whats the purpose of the
--size arg to lvcreate when taking a snapshot, I thought it was a buffer
to hold data that'd normally be written to disk but cant when the
snapshot exists? I'm confused.

> -- 
>       aRDy Music
> http://www.ardynet.com
