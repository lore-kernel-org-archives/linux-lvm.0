From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM on 2.4.17
Message-Id: <20020118090008.GB1684@tykepenguin.com>
References: <Pine.LNX.4.33.0201180011090.26948-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0201180011090.26948-100000@greebo.foobarhouse.com>
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
Date: Fri Jan 18 03:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 18, 2002 at 12:12:54AM +0000, James Pattinson wrote:
> Hi!
> 
> I've been neglecting my systems and LVM... currently trying to upgrade
> from 2.4.16 to 2.4.17. 2.4.17 seems to include LVM 1.0.1-rc4 but it fails
> when I compile:
> 
> lvm-snap.c: In function `lvm_snapshot_COW':
> lvm-snap.c:380: `phys_start' undeclared (first use in this function)
> lvm-snap.c:380: (Each undeclared identifier is reported only once
> lvm-snap.c:380: for each function it appears in.)
> 
> Do I need to apply additional patches?

You shouldn't do, no. I've built several dozen 2.4.17 kernels (no, really!)
without this error.

Check your kernel source is really clean. If you've patched it up from an
earlier one then look out for failures. 2.4.17 builds cleanly either as it
stands or with patches from LVM 1.0.1

patrick
