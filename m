Message-ID: <9E2EF30E94F5C541A68F25F8AA8825BC56C5C5@MARS.us.iwon.com>
From: Rich Wilson <rwilson@excitenetwork.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and RHAS
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
Date: Thu Nov 20 07:20:06 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello, 

I am migrating a RH 7.3 server to RHAS 2.1.  The existing 7.3 server uses
LVM 1.0.7, which I compiled around the 2.4.18-27.7x kernel source.  The
servers are SAN attached to EMC storage using Qlogic 2340 HBAs.  We have to
use AS 2.1 because the server will use EMC PowerPath, and that is the only
version they support.  They plan to support AS 3 by January.

The AS 2.1 lvm-mod is extremely old (from 2001).  I have seen a few threads
on this list about applying the 1.0.7 LVM patch to the enterprise kernel
source.  I have done this, however, when I try to load the module I get
unresolved symbol errors.  Jon Nangle posted here in September stating he
was able to fix the symbol errors.  Does anyone know what his fix was?  

Here is his post:
http://lists.sistina.com/pipermail/linux-lvm/2003-September/014834.html

I also tried to patch with 1.0.8, but it gave the same results.

Many thanks,
-Rich
