From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] reiserfs panic
Message-ID: <20011130140610.D2992@tykepenguin.com>
References: <20011129164915.I1408@tykepenguin.com> <20011130102423.E1452@tykepenguin.com> <742840000.1007128632@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <742840000.1007128632@tiny>
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
Date: Fri Nov 30 08:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 08:57:12AM -0500, Chris Mason wrote:
> 
> 
> The problem here is that NAME_NOT_FOUND does not mean error.  It means it is
> safe to insert something with that name, which isn't what we want.  For
> snapshots though, it will work fine.

Oh granted. I didn't intend it to be a fix as such - sorry if some read it as
that - merely a (rather crude) way to prevent a kernel panic in the event a
snapshot gets full.

 
> Now that 2.5.x is out I expect more of these to get cleaned up, and I'm
> workin on patches to turn reiserfs_panic into a forced readonly mount.

That would be nice - but maybe a no-op in the case of an LVM snapshot :-)

patrick
