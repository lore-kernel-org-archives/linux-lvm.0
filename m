Subject: Re: [linux-lvm] Re: can't mount ext3 snapshot => needs_recovery flag always set on mounted ext3 partitions
Message-ID: <20020809122723.GB2873@fib011235813.fsnet.co.uk>
References: <44660.80.67.170.17.1028814831.squirrel@rezo.net> <45805.80.67.170.17.1028895384.squirrel@rezo.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45805.80.67.170.17.1028895384.squirrel@rezo.net>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Aug  9 07:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 09, 2002 at 02:16:24PM +0200, Antoine wrote:
> 
> Hi again,
> 
> Well, I've found out. The problem was the snapshot had been created
> while the original volume had the "needs_recovery" flag set. If I
> destroy the snapshot and recreate it when the original volume doesn't
> have this flag, then I can mount the snapshot.
> 
> Now the remaining problem is that, _as soon as_ the original ext3 volume
> is mounted, it has the "needs_recovery" flag. That means I cannot create
> a usable snapshot volume without first unmounting the original volume
> (because otherwise I won't be able to mount the snapshot volume). Is
> there a way to work around this, so as to make snapshots without taking
> anything down ?

Would a writeable snapshot help ?  Since you would be able to change
the needs_recovery flag specifically on the snapshot.

- Joe
