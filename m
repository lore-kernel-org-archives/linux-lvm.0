From: Daniel Wittenberg <daniel-wittenberg@uiowa.edu>
Message-Id: <1042049056.1433.29.camel@tux.its.uiowa.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem
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
Date: Wed Jan  8 12:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I had 2 drives in my machine, with a VG across both of them.  The only
thing on the second drive was part of /tmp, so when the second drive
died I didn't really lose anything.  But I have problems now because I
can't activate the VG because part of it is missing, but I can't remove
tmp, so it's a catch-22.  Is there anyway to remove an LV without
activating the VG?  Or another way I can tell it to ignore missing LV's?

Thanks!
Dan

-- 
===========================
Daniel Wittenberg
Senior Unix Admin
University of Iowa - ITS
