Return-Path: <braam@mountainviewdata.com>
Date: Wed, 23 May 2001 08:48:42 -0600 (MDT)
From: "Peter J. Braam" <braam@mountainviewdata.com>
Subject: Re: [linux-lvm] LVM Snapshots & journal recovery
In-Reply-To: <20010523090805.A540@66bassett.freeserve.co.uk>
Message-ID: <Pine.LNX.4.33.0105230843210.3381-100000@lustre.us.mvd>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <thornber@btconnect.com>, adilger@turbolinux.com, linux-lvm@sistina.com, linux-fsdevel@vger.kernel.org

Joe,

Thanks for explaining this.

That's still not good enough, but better: you must also wait for the
redirection table to be stable on disk before you can overwrite the origin
device.

So journal recovery can indeed work if LVM snapshots wait twice:

 - first for the copied disk to become stable on disk
 - then for the redirection to become stable on disk

at that point one can safely over-write the origin.

First, looking at the code, I don't think that this is happening at all.
Second, to have these two extra waits seems really quite a bad penalty to
me.

- Peter -


On Wed, 23 May 2001, Joe Thornber wrote:

> On Tue, May 22, 2001 at 03:32:19PM -0600, Peter J. Braam wrote:
> <snip>
> >
> > But during recovery, LVM cannot possibly know if the whole process of
> > copying out the data from the current to the snapshot area completed
> > during the previous run. Yes, LVM updates the redirection table first and
> > then copies, but, still, you don't know _where exactly_ the writes stopped
> > happening and in particular you don't know if the block was copied already
> > or not.
> >
>
> The snapshot metadata (redirection table) is written *after* the copy.
> Data will not hit the origin device until after the copy on write has
> completed successfully.
>
> - Joe
>

-- 
