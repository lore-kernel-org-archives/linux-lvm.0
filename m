Return-Path: <C.R.Ritson@ncl.ac.uk>
Message-Id: <4.3.1.1.20010817140622.00b1b200@popin.ncl.ac.uk>
Date: Fri, 17 Aug 2001 14:33:15 +0100
From: Chris Ritson <C.R.Ritson@ncl.ac.uk>
Mime-Version: 1.0
Subject: [linux-lvm] Duplicate device numbers -- my fault.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have now RRRTFM and have realised that when upgrading with 
pvversion(0.91-b8) I had the beta8 tools first in my path. Presumably this 
explains my corrupt logical volumes. I have recovered from backups.

Now the real reason for sending this. For people like me, could the upgrade 
instuctions be changed to include the following:-

2a) Check that the OLD pvm tools are first in your path:
     # pvdisplay -?
     The first line of output shows the version of pvdisplay this should be 
the OLD version 0.91_beta7 or earlier. Maybe the pvversion script could be 
updated to automate this, making it fail safe.


Another enhancement would have made my life easier, but this could be harder:-

Presumably when vgscan is run at boot time, it is reading metadata from the 
volume groups it finds, including their last used minor device numbers. If 
this tool finds duplicates (as I ended up with) would it make sense for it 
to stop and report the error. Maybe even "vgchange -ay" could be arranged 
not to activate the offending volume groups. This would have alerted me to 
my error far earlier, but could I suppose have cuased problems had I had 
root-on-LVM.

Chris Ritson
--
EMAIL:	C.R.Ritson@newcastle.ac.uk	POST:	Chris Ritson,
PHONE:	+44 191 222 8175			Department of Computing Science,
FAX :	+44 191 222 8232				University of Newcastle upon Tyne,
ROOM:	618 Claremont Bridge (the Mill)		United Kingdom NE1 7RU.
