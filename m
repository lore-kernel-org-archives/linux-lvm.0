Message-ID: <20030714022301.24234.qmail@web10001.mail.yahoo.com>
From: Tazkoh <tazkoh@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-157053849-1058149381=:23972"
Subject: [linux-lvm] How to extend logical vol beyong 256GB
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
Date: Tue Jul 15 08:11:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-157053849-1058149381=:23972
Content-Type: text/plain; charset=us-ascii

Hi
 
I tried to extend the logical volume to 512GB (or more) but keeping getting this error message after executing this command lvextend -L512G /dev/vg01/lvol1
 
lvextend -- size 571473920 KB is larger than maximum VGDA kernel size of 268427264 KB

It seems like the logical volume is fixed at 256GB. How can I increase it?
 
Thanks


---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-157053849-1058149381=:23972
Content-Type: text/html; charset=us-ascii

<DIV>Hi</DIV>
<DIV>&nbsp;</DIV>
<DIV>I tried to extend the logical volume to 512GB (or more) but keeping getting this error message after executing this command lvextend -L512G /dev/vg01/lvol1</DIV>
<DIV>&nbsp;</DIV>
<DIV>lvextend -- size 571473920 KB is larger than maximum VGDA kernel size of 268427264 KB<BR></DIV>
<DIV>It seems like the logical volume is fixed at 256GB. How can I increase it?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-157053849-1058149381=:23972--
