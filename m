Return-Path: <thornber@btconnect.com>
Date: Mon, 16 Jul 2001 15:58:38 +0100
Subject: Re: [linux-lvm] Upgrade path
Message-ID: <20010716155838.A882@btconnect.com>
References: <3B4EE8F2.5050506@ednet.ns.ca> <20010716132959.C11625@sistina.com> <20010716140313.H8175@cistron.nl> <20010716162517.A12520@sistina.com> <20010716164253.P8175@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010716164253.P8175@cistron.nl>; from wichert@cistron.nl on Mon, Jul 16, 2001 at 04:42:53PM +0200
From: Joe Thornber <thornber@btconnect.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jul 16, 2001 at 04:42:53PM +0200, Wichert Akkerman wrote:
> Previously Heinz J. Mauelshagen wrote:
> > I announced the holdup caused by the misalignment bugs we found.
> > We'll need to release another Beta ASAP to get test feedback on that.
> 
> I saw that, but there seems to have been a consensus on a fix
> for that for over a week now already.

Fixing it isn't the problem, ensuring people with existing VG's can
use the new driver/tools *is* the problem.  The pe positions weren't
being stored in the metadata before beta8 :( So we have to upgrade
peoples VG's.  I understand that Heinz has written the upgrade tool,
but I'm not sure how much testing he wants before we release.

- Joe
