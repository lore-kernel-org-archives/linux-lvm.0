Message-ID: <3B978B57.8000208@st-peter.stw.uni-erlangen.de>
Date: Thu, 06 Sep 2001 16:42:31 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Root on LV
References: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

it probably will hold the kernel also
and as far i know there is no bootloader which can access logical volume
am i wrong

dobos_s@IBCnet.hu wrote:

>Hi!
>
>I cannot understand something.
>My kernel has no modules.
>Why should I create an ext2 partition for holding an initrd which is not
>doing any essential things except vgscan and vgchange -ay ?
>Why cant these things built into the kernel?
>
>Maybe I didnt understand something...
>
>
>Please CC to me, because I am not member on list...
>
>Thanks
>
>
>Dobos Sandor
>IBCnet Hungary Ltd.
>
>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
