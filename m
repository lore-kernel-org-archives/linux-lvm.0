From: Marc Cousin <cousinmarc@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200307311721.24805.cousinmarc@free.fr>
Subject: [linux-lvm] lvm2 + linux 2.6.0-test2 + nptl
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
Date: Thu Jul 31 10:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

i just wanted to try NPTL on my glibc today, so I recompiled it with nptl 
support, and lvm2 hanged during boot.

It seems that in fact the tools work but never return :
if I run vgscan &, wait a bit, kill -9 vgscan,  then vgchange, wait, kill -9 
vgscan, everything's ok
What information can I provide ?
kernel is 2.6.0-test2
lvm tools are LVM2.2.00.05
glibc is 2.3.2, with NPTL 0.55

Is it a know problem ?

Cheers

-- 
   Calvin: Know what I pray for?  Hobbes: What?  Calvin: The strength to 
change
what I can, the inability to accept what I can't, and the incapacity to tell
the difference.  -- Calvin
