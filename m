From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.4 available at
    www.sistina.com
Message-Id: <20020503091215.GD810@tykepenguin.com>
References: <20020502215808.GA492@antimony.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020502215808.GA492@antimony.sistina.com>
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
Date: Fri May  3 04:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Owning to user error (ie mine) the VFS lock patch in the 1.0.4 tarball is
incorrect.

If you need to to use snapshots with reiserfs or ext3 please get the VFS lock
patch from the 1.0.3 tarball or from

http://tech.sistina.com/cgi-bin/cvsweb.cgi/~checkout~/LVM/PATCHES/linux-2.4.18-VFS-lock.patch?rev=1.1

Sorry about that.

patrick
