Date: Thu, 4 Oct 2001 01:45:56 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
In-Reply-To: <20011003133021.K8954@turbolinux.com>
Message-ID: <Pine.LNX.4.33.0110040141320.21655-100000@fogarty.jakma.org>
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
To: linux-lvm@sistina.com

On Wed, 3 Oct 2001, Andreas Dilger wrote:

> would be helpful.  Also, there is a known issue about the "inline"
> functions, which may not have been fixed yet (it is a compiler bug).

oh yes..

i read through the archives before posting, and found reference to
this.  however, it happens when compiled with egcs too.

also, the other bug was in was in lv_create(), my one is in
a different place (see subject line).

> Cheers, Andreas

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org	Key ID: 64A2FF6A
Fortune:
Liberty is always dangerous, but it is the safest thing we have.
		-- Harry Emerson Fosdick
