From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Re: pvcreate dumping core with 2.4.10-pre9
Date: Sat, 15 Sep 2001 22:52:21 -0400
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu>
In-Reply-To: <200109160207.WAA10835@erez.physics.lsa.umich.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010916025223.1CA035E041@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, dwchin@umich.edu

On September 15, 2001 10:07 pm, dwchin@umich.edu wrote:
> Oh, a couple of details: I'm running RedHat 7.1 (except for the kernel
> update as mentioned in previous message).  And gdb says that lvcreate is
> getting a segmentation fault at lv_create_remove.c:42
>
> 42      inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {

I suspect this _might_ have something to do with the mix/max changes in 2.4.10pre9.
In 2.4.10pre Linus changed min/max to use three args - he had good reasons to do
this.  It created lots of flack.  After days (weeks?) of debate a two arg version he 
accepted was found.  Meanwhile the rest of the kernel (and patches like LVM) had
adpated to the three arg mix/max.  

The jist of the above it to look at the LVM patch generated for 2.4.10pre9 and
change and lines begining with "+" that contain "min(" or "max(" to "min_t(" or 
"max_t(" respectivily.

Suspect then it will work - I am testing this here now.

Ed Tomlinson
