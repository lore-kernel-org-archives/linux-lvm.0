From: Matt Schillinger <mschilli@vss.fsi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1041610095.19844.45.camel@mosix>
Mime-Version: 1.0
Subject: [linux-lvm] disk naming
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
Date: Fri Jan  3 10:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

this should be a simple question, but I can't find a direct discussion
in the lvm documentation. I believe that i have found that LVM will find
appropriate PV's regardless of their name (sda,sdb).. Is this true? Do i
need devfs to ensure that i always have the same disk naming, or will
LVM handle this for me?  I am currently using scsidev for naming
purposes, but have found that vgcreate will not work with scsidev device
names (/dev/scsi/sdh0-0c0i4l2p1)
/dev/scsi/sd(host=0,scsiid=4,LUN=2,partition #=1)

..


Thanks,

-- 
Matt Schillinger
mschilli@vss.fsi.com
