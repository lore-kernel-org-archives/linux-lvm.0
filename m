From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEEEJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011130142015.F23836@wookimus.net>
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
Date: Fri Nov 30 16:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Chad C. Walstrom
> Sent: Saturday, 1 December 2001 09:20
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
>
>
> On Fri, Nov 30, 2001 at 09:41:21PM +1300, Steve Wray wrote:
> > > Reason #1:  Mount /usr as read-only.  There is only one reason why you
> >
> > ONLY if you also have /usr/share (for one, there may be others)
> on writeable
> > partitions!!!
>
> Why would you want/need to have /usr/share writeable?  FHS 2.2 states:

On redhat and mandrake for two, there are things in /usr/share that
are written to at runtime.
One I can think of right off the bat is cddb information.


[snip]
>         Game data stored in /usr/share/games must be purely static data.
>         Any modifiable files, such as score files, game play logs, and so
>         forth, should be placed in /var/games.

Since when was any distribution 100% compliant with the standards?
:)
