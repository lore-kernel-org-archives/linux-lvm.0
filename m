Message-ID: <3FCC1DD5.22D9FBBD@in.ibm.com>
From: Sachin Sant <sachinp@in.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with lvchange command
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
Date: Tue Dec  2 07:51:14 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi , I posted this query , but did not get a reply. Sending it again
hoping will get a reply.

I have a VG with 3 pv and a lv created using command 

lvcreate -i3 -I32 -l98 -nmy_lv my_vg
lvdisplay shows 1024 as the value for Read Ahead Sectors.

When i use the command lvchange to change the value of read ahead
sector count with value more that or equal to 256 i get following
error..

linux# lvchange -r 340 /dev/my_vg/my_lv
lvchange -- ERROR "Invalid Argument" read ahead sector change
linux#
linux#

Is there a limitation that read ahead value cannot be greater 
than 255?

-- 
Thanks
-Sachin
