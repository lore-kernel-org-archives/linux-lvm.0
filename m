Return-Path: <donald@gordon.co.nz>
Date: Tue, 31 Jul 2001 00:48:35 +1200 (NZST)
From: Donald Gordon <donald@gordon.co.nz>
Subject: Re: [linux-lvm] Changing partition names?
In-Reply-To: <20010730070457.A10441@sistina.com>
Message-ID: <Pine.LNX.4.21.0107310046190.12641-100000@server.gordon.co.nz>
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

On Mon, 30 Jul 2001, AJ Lewis wrote:

> On Mon, Jul 30, 2001 at 11:48:56PM +1200, Donald Gordon wrote:
> > I can't seem to see any way to tell lvm that the name of one of the
> > partitions it is using has changed (from /dev/sda10 to /dev/sda8; I'm
> > transitioning a system to LVM).  Should it pick this up on reboot or is
> > there some config file I need to prod?
> 
> vgscan will do this for you automatically.
> 

When I (ahem) remove a partition by mistake and re-create it in the same
location with fdisk vgscan no longer recognises it.

Also, is there any way to point vgscan in the general direction of the
block devices where PVs are to be found?  It takes quite some time to scan
*everything* on my p75 :(

don 

-- 
Donald Gordon | Wellington, New Zealand | All opinions above are those of my
donald@gordon.co.nz | icq 14995769 | um | deceased pet goldfish, "Fishy II".
