Message-ID: <3EBF8F56.5050801@eigner.com>
From: Klaus Strebel <klaus.strebel@eigner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dm and 2.4.21-rc2-xfs
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
Date: Mon May 12 07:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: thornber@sistina.com
Cc: linux-lvm@sistina.com

Hi Joe and all the rest on [linux-lvm],

i upgraded my kernel to 2.4.21-rc2-xfs with the dm-patches 
(dm-2.4.20-10) and had hard crashes on booting while mounting my 
ext3-boot-partition (don't use xfs for root, var, usr, opt due to 
earlier problems, for everything other, its the fs of my choice though 
:-)) .

Any suggestions about patches for the jbd code (there where some changes 
in it from 2.4.20 to 2.4.21.x and i confess, i'm to lazy finding it out 
on my own, but, when nobody else did it, beharps i'll have to, booting 
to ext2 doesn't make me sleep too well :-) ).

My first (hum, and only) try was just leaving all the patches concerning 
journal_heads to jbh.h and buffer.c (and all the few other i found it 
in) out. Result was, that i came further, but also to a crash.

Regards
Klaus
-- 
Klaus Strebel
UNIX-Engineer
klaus.strebel@eigner.com
EIGNER - Precision Lifecycle Management -
<http://www.eigner.com>
