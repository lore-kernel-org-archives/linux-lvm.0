From: Luca Berra <luca.berra@comedia.it>
Subject: Re: [linux-lvm] mirror setup with LVM
Message-ID: <20040122211552.GF3060@percy.comedia.it>
References: <HRW44B$0EC94DDC1EFCAF257C8E27E5169AD487@libero.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <HRW44B$0EC94DDC1EFCAF257C8E27E5169AD487@libero.it>
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
Date: Thu Jan 22 17:04:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

On Thu, Jan 22, 2004 at 01:02:35PM +0100, fabio_s@inwind.it wrote:
>Hi all,
>
>I have a redhat 9 linux already installed and I'd like to add a second disk to
>be used as mirror.
>
>I assume it's easy to do this during linux installation.
>
>Does someone know how to do that without destrying data on the first disk?
>
create a degraded mirror on the second disk,
then either
  add this to the vg and pvmove all lv there, then remove the
  standalone disk and raidhotadd it to the array.
or
  create a new vg on the mirror, copy all data, remove the first vg,
  raidhotadd the disk.

L.
