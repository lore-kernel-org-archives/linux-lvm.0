From: Nick Jennings <nick.jennings@mountainviewdata.com>
Message-Id: <1037820827.79579.13.camel@grenzik.us.mvd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM: logical -> physical mapping info (per file)
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
Date: Wed Nov 20 13:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 Hello I would like to determine which, of 3 RAIDs, a certain piece of 
data is stored. I am trying to determine if the reason I am having 
trouble with certain pieces of data on an 'lv' partition is because
of a RAID enclosure having trouble. I'd like to find out if it is the
one containing the file(s) I need.

 Perhaps there is a way to get an inode mapping of every bit of data on 
a device (lvm partition)? vgdisplay or lvdisplay seems to only show
which devices are used, but provides no info on the physical location of
each file.

 Please let me know if there is a way to do this, or another way to go 
about this problem. Thanks.

-- 
Nick Jennings <nick.jennings@mountainviewdata.com>
Mountain View Data, Inc.
