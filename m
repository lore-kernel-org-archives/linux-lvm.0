From: "Sean Oh" <benew666@hotmail.com>
Mime-Version: 1.0
Message-ID: <F59HdlQgdYXSVvR0Wss000091d0@hotmail.com>
Subject: [linux-lvm] syncing with snapshots takes forever?
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
Date: Fri Jan 24 07:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am having difficult with LVM snapshots and syncing.
I have tested LVM 1.0.6 and also LVM2. Both generate the same problem.

My testing environment is as follows:

VG vg01 Size 100GB
LV lv01 Size 50GB
LV lv01_snapshot1 size 10GB
LV lv01_snapshot2 size 10GB
LV lv01_snapshot3 size 10GB

as you can see above, there 4 LVs, one LV and 3 snapshots for the LV
and also the system has SCSI raid controller(Mylex) and 1024GB of RAM, 
though these does not seem to matter, since the problem happens to other 
systems, also.
The FS does not matter here, since Reiserfs and XFS both produce the same 
syncing problem.

For LVM 1.0.6, I have applied VFS lock patch and lvm-1.0.6 patch to the 
kernel 2.4.20. ---> same problem. Kernel 2.4.20 without any patches gives 
the same problem,too.

For LVM2 ---> I removed all the LVs and VG that made with LVM1 and remake 
them with LVM2. No diifference at all. BTW, LVM2 genereates a stragne error 
message to console 'invalidate: busy buffer'

After copying a file with 1GB size to lv01 and typing 'sync' takes more 30 
minitus or sometime forever. During these time period, access to lv01 is 
neary blocked, producing very slow performance(0 ~ 400B/s). If I remove the 
snapshots, sync returns normally. So it is the issue with LVM making the 
changes in LV to 3 snapshots while locking the LV.

Is there any way to make the snapshots syncing faster? Is that what LVM2 
promise? Is there any alternative to LVM for snapshoting?

Any help and comments are apperciated.


_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus
