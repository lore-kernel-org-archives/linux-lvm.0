Date: Thu, 06 Sep 2001 11:53:11 -0500
From: lembark@wrkhors.com
Subject: Re: [linux-lvm] Root on LV
Message-ID: <135560000.999795191@duke.wrkhors.com>
In-Reply-To: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


-- dobos_s@IBCnet.hu on 09/06/01 16:03:49 +0200

> Hi!
> 
> I cannot understand something.
> My kernel has no modules.
> Why should I create an ext2 partition for holding an initrd which is not
> doing any essential things except vgscan and vgchange -ay ?
> Why cant these things built into the kernel?

Don't put an initrd on it.  Create the first few partitions on 
your drive at 128MB (/), 64 or 128MB (primary swap), 320MB (/var).
Leave the rest on LVM.  With these three you can normally start
up and recover a damaged LVM system; if the root and primary swap
at least aren't in non-LVM storage you'll be unable to boot if 
LVM fries for any reason; /var is usually a pain to loose and 
doesn't grow all that much so I leave it on a partition also.

sl
