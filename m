Message-ID: <3F69AE57.7040405@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] FYI: Going back to LVM1 from LVM2
References: <0F72BC18-E849-11D7-B784-000393DC1896@sistina.com>
In-Reply-To: <0F72BC18-E849-11D7-B784-000393DC1896@sistina.com>
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
Date: Thu Sep 18 08:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

AJ Lewis wrote:

> If device nodes are missing, vgmknodes should help in LVM1.

I didn't know that, but I had the opportunity to test it, as the 
/dev/f2/f2 LV went missing again after a reboot. vgmknodes reported 
success, but mount still did not find the node until after a vgchange 
-an / vgchange -ay combo. Weird.

As I mentioned earlier, I did install and run LVM2 on this machine 
before going back to LVM1 (even going back and forth a few times) and I 
suppose it's possible that this changed something in the metadata that 
LVM1 didn't like.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
