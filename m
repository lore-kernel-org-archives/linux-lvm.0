Message-ID: <3DD3AEF2.5040900@grc.nasa.gov>
From: Tad Kollar <tkollar@grc.nasa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LV's above 2TB, PV's above 1TB, LBD?
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
Date: Thu Nov 14 08:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Using LVM2 tools from CVS, and kernel 2.5.47 w/dm patches...

Seems to be a sign error someplace... 2+ TB requests are treated as 4+ TB:

lvm> lvextend -l 10980 /dev/vgtest2/lvtest2
   Extending logical volume lvtest2 to 2.68 TB
   logical volumes cannot be larger than 4.00 TB

Also, pvcreate treats 1+ TB devices as 2+ TB and rejects them.

Aside from this, now that the 2.5 kernel supports LBD's, can the limit on LV's 
be raised to 16 TB?

Thanks,
Tad
