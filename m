From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Message-ID: <20030827144240.GB4737@www.13thfloor.at>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] devmapper-ioctl 2.4.21 ...
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
Date: Wed Aug 27 10:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Joe Thornber <thornber@sistina.com>

Hi!

stumbled over the following code:

+	/* Don't update times for block devices using O_DIRECT */
+	if (!(file->f_flags & O_DIRECT) || !S_ISBLK(inode->i_mode)) {
+		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+		mark_inode_dirty_sync(inode);
+	}

but [A:] S_ISBLK() should be true if the inode is a block device
[B:] (file->f_flags & O_DIRECT) should be true if O_DIRECT is requested

!(A || !B)  ==  (!A && B) (De Morgan)

so the times will be updated if the device is a
block device and O_DIRECT is not specified, correct?
but the comment says otherwise ...

please correct me, if I'm wrong ...

best,
Herbert
