From: Jims <theman@chaj.com>
In-Reply-To: <E1727MA-0007Nd-00@hermes.sistina.com>
Message-Id: <Pine.LNX.4.33.0204300048050.24127-100000@x.firesites.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM Woes
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
Date: Mon Apr 29 23:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Still doesn't work. Getting the same error. Will send you the debug
output. Any ideas?

On Fri, Apr 26, 2002 at 12:24:16PM -0400, Jims wrote:
>
> Thanks for the suggestion. When I try it, here is what I get...
>
> /sbin/vgcfgrestore -n world -o /dev/sdd1 /dev/hda2
> vgcfgrestore -- ERROR "vg_write(): open" storing VGDA of "world" on
disks
>
> Am I supposed to do something to the new disk other than creating an LVM
> partition on it ?

You need to run pvcreate on it before vgcfgrestore.

Regards,
Heinz    -- The LVM Guy --
