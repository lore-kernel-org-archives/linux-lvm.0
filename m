From: John Moser <jmoser@erc.wisc.edu>
Subject: Re: [linux-lvm] Can no longer mount lvm striped volume
In-Reply-To: <20020502121825.B3956@hpti.com>
Message-Id: <Pine.SGI.4.33.0205021333290.5694922-100000@erc2000.erc.wisc.edu>
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
Date: Thu May  2 13:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> [root@x06 /root]# mount -t ext3 /dev/sdd_vol2/ /export/sdd_vol2
> mount: /dev/sdd_vol2/ is not a block device
>
> IO nodes have gone down in the past due to
> power interruptions, but I have never had
> this catastrophic of a problem.  I have 16 volume
> groups, and 3 or 4 appear to be affected.

Have you tried a simple:

vgchange -a y

?  Similar situation happened to me before, and I just needed to activate
the volume group.

-John
