Message-ID: <3F66DC9B.7050101@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
References: <20030915030139.A11888@copilotconsulting.com>
In-Reply-To: <20030915030139.A11888@copilotconsulting.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] FYI: Going back to LVM1 from LVM2
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
Date: Tue Sep 16 04:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

For various reasons (when I fix it, I'll Tell the Tale) I installed LVM2 
today. It didn't solve my immediate problems, so I tried to go back to 
LVM1. However, the dev/vg_name/lv_name node had disappeared and even 
though both vgchange -ay, vgscan, lvscan and pvscan all reported seeing 
the lv fine, mount could not find it.

A reboot did not help. Panic lurked.

However, vgchange -an followed by vgchange -ay helped.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
