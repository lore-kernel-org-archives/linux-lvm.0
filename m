Subject: [linux-lvm] Swap on LVM - swapoff problem
From: George Karaolides <george.karaolides@planitis.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1049725753.3745.34.camel@ariel>
Mime-Version: 1.0
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
Date: Mon Apr  7 09:29:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Patrick,

> It could just be that the machine has not enough memory to hold all
> the processes VM state., but I think it should return ENOMEM for that
> situation.

Wouldn't the memory requirement be the same for the case where I comment
out the swap device line in /etc/fstab and start swap manually?  But it
works OK then...

-- 
Best regards,

|   George Karaolides                      Planitis Communications Ltd.,
|
|   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,
|
|   web:   www.planitis.net                             Nicosia CY 1065,
|
|   email: george.karaolides@planitis.net           Republic  of Cyprus.
|
