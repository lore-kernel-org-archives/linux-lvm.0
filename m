Message-ID: <135135307.1002326338570.JavaMail.root@boots>
Date: 05 Oct 2001 19:52:50 -0000
From: "Karl" <rmvzj001@sneakemail.com>
Subject: [linux-lvm] LVM seems to be causing SCSI errors.
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Well, if it is within the size of the drive, and you get a "bad noise"
> when trying to access it, then it may be that you have a bad drive.  If
> you are doing low-level formats of the drive, this may do bad block
> relocation, and hide the fact that there are bad spots.

That's what I thought at first, but as I explained earlier, the errors
ONLY occur when running under LVM and go away as soon as I use the raw
disk. I went back and forth several times. I'm pretty sure it is an LVM
thing, but no idea what it is.


-----------------------------------------------------
Protect yourself from spam, use http://sneakemail.com
