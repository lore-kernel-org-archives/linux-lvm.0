Return-Path: <Michael.Greulich@eplus.de>
From: Michael.Greulich@eplus.de
Message-ID: <41256A10.00419B0F.00@S1008351.eplus.de>
Date: Thu, 15 Mar 2001 13:02:01 +0100
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Update to SuSE 7.1
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi folks,

I just tried to update my PC running SuSE 6.3 (Kernel 2.2.16) and a LVM 0.8e to
SuSE 7.1 Kernel 2.4 and LVM 0.9. The update worked fine. I just had to activate
my vg manually and then the lvs were visible to yast2 and it happiely updated my
installation. After this it had to reboot. After the reboot I'm not able to
access my vg anymore! vgscan (version 0.9) just mentions "no vgs found".
vgcfgrestore 0.9 complains about "wrong structure" of the backup files.
Additionally the old vgscan (version 0.8e) now complains about an invalid i/o
protocol version 6. So I'm not able to access my vg anymore....

Anybody any ideas???

TIA
.\\ichael
