Message-ID: <3D57F98C.9040408@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] applications not working with lvm
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
Date: Mon Aug 12 13:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Has anyone had any problems with any applications working on a 
filesystem, where that filesystem was on a logical volume?

I've got an application that simply wont work (sorry, dont want to give 
too many details).  It creates very large quantities of hard links, 
binds a local directory to /proc, creates local files to represent block 
devices and FIFO files.  All of this is in order to create a virtual 
server for users.  I've tried to do many of these operations manually, 
with perfect success, although I'm not trying to perform them on the 
same scale at the same speed as the hosting software.

Is there anything unusual about LVM and it's interaction with these 
special files?

Thanks in advance for your replies/feedback.
