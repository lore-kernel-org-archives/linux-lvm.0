Message-Id: <3AB544CBBBE7BF428DA7DBEA1B85C79C01101F57@nocmail.ma.tmpw.net>
From: "Holzrichter, Bruce" <bruce.holzrichter@monster.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM on 2.5.5pre1
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
Date: Tue Feb 19 15:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Not sure if you are even the correct people to ask, but I am having the
following problem getting LVM to compile on Kernel 2.5.5pre1.  I am not
subscribed to your list, so CC me if possible, or tell me to go away  :o)

Can someone point me in the right direction? I am scanning the code, but not
sure where to follow up with this. LVM won't compile in 2.5.5pre1, I get the
following error upon compilation.

lvm.c: In function `lvm_do_lock_lvm': 
lvm.c:1310: structure has no member named `sigpending' 

I'm looking into why this is, but can't seem to find where the structure is
located to fix it, and what member may be missing. Any help or pointers
appreciated.

Thanks,
Bruce Holzrichter 
Systems Administrator 
Monster.com 
Phone:  978-461-8869 
Cell:      978-375-9558 
bruce.holzrichter@monster.com 
