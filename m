Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F94FF@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Subject: RE: [linux-lvm] LVM 1.0.4 pvmove is broken
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
Date: Fri May 24 11:26:19 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Poul,
> 
> please try the  patch below which should fix the locking problem I
> introduced in 1.0.4.
> 
> This is against a clean 2.4.18 kernel patched with LVM 1.0.4.
> 
> Regards,
> Heinz    -- The LVM Guy --

	That fixes it! Thanks!


-poul
