From: "Tren Blackburn" <tren@eotnetworks.com>
Message-ID: <007501c2a781$32784dc0$0201a8c0@fileserver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Operation Not Permitted on 2.4.20
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
Date: Thu Dec 19 11:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all;

I've done some searching on the list and the closest I can come up with
is this:
http://lists.sistina.com/pipermail/lvm-devel/2002-March/000873.html

This is a new NetFinity server, hardware RAID 5 array.  I partitioned
the drive, set up a second partition as Linux LVM.  Linux kernel is
2.4.20 and LVM version is 1.1-rc2 (kernel patched with this as well)

Ran pvcreate which worked fine
Ran vgcreate which worked fine
Ran lvcreate -L1G -nlvusr rootvg which gave:
  lvcreate -- ERROR "Operation not permitted" opening logical volume
"/dev/rootvg/lvusr"

Running lvremove /dev/rootvg/lvusr gives:
  lvremove -- ERROR "lv_release(): LV number" releasing logical volume
"/dev/rootvg/lvusr"

And if I try to build a filesystem on this LV I get:

count_blocks: open failed (Operation not permitted)

If I run vgscan -f I can remove the lv properly, but I cannot create a
filesystem still (get same error)  What can I give in the way of debug
output to be helpful here.  Is anyone else experiencing this problem?

Regards,

Tren

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
- Tren Blackburn - Owner                mailto:tren@eotnetworks.com  =
= EOT Networks                           http://www.eotnetworks.com  -
- Phone (403) 818-7658                           Fax (403) 269-2122  =
=             ** Infinite Solutions for a Finite World **            -
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--
------------------------------------------------------------------------
DISCLAIMER:  This e-mail message is intended only for the named 
recipient(s) above and may contain information that is privileged, 
confidential and/or exempt from disclosure under applicable law. If you 
have received this message in error, or are not the named recipient(s), 
please immediately notify the sender and delete this e-mail message.
------------------------------------------------------------------------
