From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
Message-ID: <20030602162438.A12300@uk.sistina.com>
References: <20030602143500.GC15252@gage.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030602143500.GC15252@gage.org>; from jeff@gage.org on Mon, Jun 02, 2003 at 07:35:00AM -0700
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
Date: Mon Jun  2 10:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 02, 2003 at 07:35:00AM -0700, jeff wrote:
> volumes on this box, but creating this big one (~350gb) on my new
> software-raid5 array is giving me grief. i can mke2fs /dev/md2 just
> fine, but when i try to install lvm2..:

Two things to try:
1) Set up filters in lvm.conf to make sure LVM only looks at /dev/md and
   not the underlying devices directly.

2) Use a bigger Physical Extent size with vgcreate.

If that still doesn't work, run with the verbose flags (-vvv) or set the
debug log-to-file options in lvm.conf to get more diagnostic information.

Alasdair
-- 
agk@uk.sistina.com
