Message-Id: <51F1673834E2D211A9B400104B3FFD5A029C2C5C@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
Subject: RE: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
MIME-Version: 1.0
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
Date: Fri Jan 11 11:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Patrick Caulfield wrote:
> On Fri, Jan 11, 2002 at 11:47:37AM +0100, Thomas Ziegler wrote:
[snip]
> > - Is there a way to get the snapshot not destroyed if it is 
> getting full?
> 
> No. Once the snapshot is full then it can't be valid because 
> there may be
> blocks written to the original device that the snapshot can't 
> backup. The only
> way aoud this is to make your snapshots large enough to hold 
> all the data that
> is going to change on the original device during the backup.
> 
If it isn't full yet, is there any reason you couldn't just do an lvextend
on the snapshot volume?  (This assumes there is space available in the
volume group for the lvextend.)

Dale Stephenson
steph@snapserver.com
