Message-ID: <134904905.1002552431606.JavaMail.root@boots>
Date: 08 Oct 2001 10:46:56 -0000
From: "Karl" <rmvzj001@sneakemail.com>
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
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

> did you check the filesystem.
> Ages ago there was a couple of problems like this caused by filesystem
> corruptions being fixable by the checker.
>
> Please report, if this helped.

Since I see this problem while creating the filesystem with mke2fs -c, 
I don't think that is the problem. I first has the problem right after
creating the file system when coping files to it. That time, I did not do the 
bad block checking on the file system.


-----------------------------------------------------
Protect yourself from spam, use http://sneakemail.com
