Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Wed, 25 Jul 2001 21:01:38 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010726010139.62B4917B2C@oscar.casa.dyndns.org>
Subject: [linux-lvm] [WARNING] when upgrading to beta8
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
To: linux-lvm@sistina.com

Hi,

I have sucessfully completed the upgrade to beta8.  The upgrade was not without 
problems.  On the first boot into 2.4.7 with beta8 I got:

LVM_snapshot_full_COW_page failed vgchange -- ERROR "Bad Address" activating volume group "lv"

The snapshot in question was full before the upgrade...  booting to a recovery kernel and
runing the pvversion -1 command worked fine with the pv(s) in version 2 format but the beta7
tools active.  Once the pv(s) were version 1 again I ran vgscan and vgchange -ay and was
able to lvremove the snapshot.  After this a pvversion -2 and reboot gave me an upgraded
kernel and LVM.

I strongly suggest that any snapshots be lvremoved before upgrading.  

Think this needs to be part of the readme.

I would be very nice if the tools could be compiled to support both formats - this would make
upgrading simpiler.  It would be ok if a wrapper was used to make this work.  Think its better
to have twice the number of executables with backwards compatibility.   What could be done is
in ./configure check the lvm version and if its not beta8 or later generate in compatibility
mode.

BTW I was using the LVM on root procedure from the readme.

Thanks
Ed Tomlinson
