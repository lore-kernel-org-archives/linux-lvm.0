From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Inactive snapshot?
Message-ID: <20030916132416.H2155@uk.sistina.com>
References: <Sea2-F42hvqgStMVhEU00001df3@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Sea2-F42hvqgStMVhEU00001df3@hotmail.com>; from benew666@hotmail.com on Tue, Sep 16, 2003 at 02:42:18PM +0900
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
Date: Tue Sep 16 07:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 16, 2003 at 02:42:18PM +0900, tester7 A. wrote:
> 1. Force active snapshot to be inactive and make it accessable.
> It seems like inactive snapshot are not accesable at all. Inactive snapshots 
> does not update the changes, but it holds the changes while it was active, 
> so old data might be usefull.

Unfortunately this is not possible: a snapshot LV holds copies of 
the *original* data the first time each part of the original device
changes; if this process was switched off, further changes to the origin
would appear as part of the snapshot and so you'd get a hybrid.

You should either make the snapshot LV big enough to hold all the
changes, or else take a complete copy of the volume elsewhere and
use that.

Alasdair
-- 
agk@uk.sistina.com
