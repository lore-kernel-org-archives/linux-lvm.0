From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm metadata
Message-ID: <20031111180703.GA32757@percy.comedia.it>
References: <200311111144.36636.benoit.peccatte@enst-bretagne.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200311111144.36636.benoit.peccatte@enst-bretagne.fr>
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
Date: Tue Nov 11 12:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Benoit <benoit.peccatte@enst-bretagne.fr>
Cc: linux-lvm@sistina.com

On Tue, Nov 11, 2003 at 11:44:36AM +0100, Benoit wrote:
>You may ask why. Then is my second question, why aren't vgscan and vgchange 
>implemented in kernel and called at boot time ? This would make us be able to 
>consider logical volumes as standard partitions and mount them easily, even 
>as /
because lvm tools are too big and complex to go into kernel space,
they are better into userspace and invoked via initrd if you want to
use lvm root.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
