Message-Id: <200109160207.WAA10835@erez.physics.lsa.umich.edu>
From: dwchin@umich.edu
In-reply-to: <200109160203.WAA10814@erez.physics.lsa.umich.edu> 
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu>
Mime-Version: 1.0
Date: Sat, 15 Sep 2001 22:07:26 -0400
Subject: [linux-lvm] Re: pvcreate dumping core with 2.4.10-pre9
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

Oh, a couple of details: I'm running RedHat 7.1 (except for the kernel 
update as mentioned in previous message).  And gdb says that lvcreate is 
getting a segmentation fault at lv_create_remove.c:42

42      inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {

Thanks, again,

--Dave
