From: James Hawtin <oolon@pzat.meep.org>
Subject: RE: [linux-lvm] lvcreate distributed extent option
In-Reply-To: <615A249B783CD41192F400D0B747AC860898265A@hesse.bbn.hp.com>
Message-ID: <Pine.LNX.4.44.0211301501510.4282-100000@pzat.meep.org>
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
Date: Sat Nov 30 09:08:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
Cc: linux-lvm@sistina.com, lvm-devel@sistina.com


> This allows us to do more I/O's per second
>

yes... Thats striping why use a stripe size equal to that of a logical
extent I would have expected you to want them much smaller than that!
the default for striping on lvm is 8k. I my LE size is 16 meg,
16 meg strips would be a bit pointless in my book. Anyway using -I you can
set it to what you want.

lvcreate -i <num> -I <K> .....

from the lvcreate man page

       -i, --stripes Stripes
              Gives the number of stripes.  This is equal to  the
              number  of  physical volumes to scatter the logical
              volume.

       -I, --stripesize StripeSize
              Gives the number of kilobytes for  the  granularity
              of the stripes.
              StripeSize must be 2^n (n = 2 to 9)

James
