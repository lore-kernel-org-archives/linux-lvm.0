From: Per Kristiansen <per@gathering.org>
Message-ID: <20021106142554.N30327@gathering.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Changing Controller and also device names
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
Date: Wed Nov  6 07:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Got a fun problem here.

I have a IDE controller that I have hooked up 7 disks to.

Now I've found that the controller is acting VERY strange, and want to exchange it with
another one.


Today I have:

PV Name (#)           /dev/hdk1 (5)
PV Status             available / allocatable
Total PE / Free PE    3680 / 0

PV Name (#)           /dev/hdl1 (7)
PV Status             available / allocatable
Total PE / Free PE    2980 / 0

PV Name (#)           /dev/hdi1 (1)
PV Status             available / allocatable
Total PE / Free PE    3680 / 0

PV Name (#)           /dev/hdj1 (2)
PV Status             available / allocatable
Total PE / Free PE    3680 / 0

PV Name (#)           /dev/hdg1 (4)
PV Status             available / allocatable
Total PE / Free PE    3576 / 0

PV Name (#)           /dev/hde1 (6)
PV Status             available / allocatable
Total PE / Free PE    3576 / 0

PV Name (#)           /dev/hdf1 (3)
PV Status             available / allocatable
Total PE / Free PE    3576 / 0


Do I need to take SPECIAL care to get the same device names  when I move the disks to the new controller
or can it find the data it needs using vgscan/pvscan ?

and no...
no raid or anything..it's not really a critical server as everything is backed up everyday.

-- 
Per Kristiansen
per@gathering.org
