From: pll+lvm@lanminds.com
Message-Id: <20020814165938.152D1F90D@tater>
Subject: [linux-lvm] How to best use LVM?
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
Date: Wed Aug 14 12:00:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I'm new to both this list and to LVM in general.  As such, I have 
some questions I'm hoping someone can help me answer.

I understand the benefits of LVM, but have never used LVM in any 
incarnation, on Linux or any other version of UNIX.  I am, however, 
pretty well versed in RAID.  So, I'm wondering how LVM can also 
provide the varied benefits of RAID. 

	- Can I use it to extend a RAID 5 set, 
	  or concatenate 2 RAID 5 sets together?

	- Can I use LVM to combine different types of RAID, such as 1 
	  and 0?

	- Can I easily "grow" a RAID set using LVM?

The other question I had more directly relates to the Linux 
implementation for LVM:

	- Which version do I use?

I'm currently using Debian/Sid w/ a non-modular, custom 2.4.18 kernel.
apt-cache shows 2 versions; lvm10 and lvm2.

Is lvm10 the 1.x series and lvm2 the 2.x? Or does lvm10 come after lvm2?

If the former, is 2.x stable enough to use, and is it better to 
compile lvm from source or use the pre-compiled debian packages?

I've tried both the lvm10 and lvm2 packages, but continually recieve 
errors when I do things like run lvdisplay (it complains about not 
being able to flush the device several times), and also something 
about not being able to open the device-mapper.

I'm very much looking forward to using LVM, and hope someone here can 
help me get started.  Thanks!
-- 

Seeya,
Paul
--
	It may look like I'm just sitting here doing nothing,
   but I'm really actively waiting for all my problems to go away.

	 If you're not having fun, you're not doing it right!
