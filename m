From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] determing lvm support
Message-ID: <20031223000655.N21022@uk.sistina.com>
References: <1071881237.1464.14.camel@rich> <20031220123023.H21022@uk.sistina.com> <1072109013.1353.11.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1072109013.1353.11.camel@rich>; from rich@storix.com on Mon, Dec 22, 2003 at 08:03:34AM -0800
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
Date: Mon Dec 22 18:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 22, 2003 at 08:03:34AM -0800, Rich Turner wrote:
> > > look for "device-mapper" in /proc/devices or
> > It's better to check for that in /proc/misc, which will tell you whether
> > or not device-mapper support is present in the running kernel.
> why is it better to check in /proc/misc? when device-mapper support is
> loaded, it shows up in both /proc/misc as well as /proc/devices.

You can only guarantee its appearance in /proc/devices while you
have a device active.

Alasdair
-- 
agk@uk.sistina.com
