Message-ID: <3F8105B3.1040506@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] removing a bad HD
References: <20031004210122.S14777@crusaders.no>
In-Reply-To: <20031004210122.S14777@crusaders.no>
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
Date: Mon Oct  6 01:05:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Trond Michelsen wrote:

> Recently a harddrive in my LVM started giving me read-errors, so
> naturally I wanted to replace the drive with a new one.

I recently went through this (with the added complication of some bad 
metadata) and you have a few options.

The best one may be to use dd (with NOERROR) to raw copy the contents 
from the old disk to a new one of the same size and then use the new one 
when doing the pvmove.

Another path is to upgrade to LVM2 (you may have to do this anyway, I 
needed some functionality in the LVM2 pvcreate to pull my stunt off) and 
use the "partial" feature. I haven't tried this myself.

There are more details of my tribulations just a few weeks back in the 
list archives, but feel free to ask if there's something missing (I had 
some private conversations with Heinz on the topic as well).

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
