From: Jims <theman@chaj.com>
Message-Id: <Pine.LNX.4.33.0205011205040.32708-100000@x.firesites.com>
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
Date: Wed May  1 11:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

The patched 0.9 vgcfgrestore didn't seem to work. I had vgcfgrestored -o
/dev/sdd1 /dev/newdrive and it came back as a success. But when I run a
pvscan, it doesn't recognize the newdrive as part of the volume group. I
know I had extended the vg with ver. 0.9.1 beta sometime after it's
initial creation with ver. 0.9. One other thing to mention is this. The
bulk of the vg in question is striped. The drive that died is a 4.5 gig,
so I would expect data loss to be THAT bad. Since it is striped though, is
it impossible to recover anything? I'm sorry that I neglected to mention
that before. I've learned many a lesson from this. Do you think a patch
for 0.9.1 beta is worth trying?


On Wed, 1 May 2002, Heinz Mauelshagen wrote:


> Please apply the patch below to a clean 0.9 source tree and generate.
> If you get everything ok again, please plan to upgrade to LVM 1.x.
>
> Regards,
> Heinz    -- The LVM Guy --
