From: "Mitch Miller" <mitch@mdmiller.com>
Subject: RE: [linux-lvm] badiane:  Problem
Message-ID: <000201c162ef$9f2bacf0$0101a8c0@mdmiller.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <61741.64.34.222.41.1004630228.squirrel@webmail.tekmd.com>
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
Date: Thu Nov  1 10:08:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On my redhat system, I had to build LVM into the kernel ... but I had to fix
the Segmentation fault you talked about.  Search the archives for that one
... it's a compiler issue.

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of gdurand@tekmd.com
Sent: Thursday, November 01, 2001 9:57 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] badiane: Problem


I have created five volume groups (vg0 - vg4) to hold respectively /var,
/home, /home/music, /usr, /usr/local.

I started with a 500MB / partition then created the pv, vg and lv.  Now what
I wanted to know is how to have the system reboot and have the partitions
mounted properly since the lvm binary and library cannot be found properly.
The libraries are in /usr/lib/lvm and should be in /lib and the binary in
/sbin or /bin.

The install is from the debian binaries.  I can't compile on my system
without getting a seg fault (that's another story.)  So I'm thinking that I
would have to move the libraries to /lib and hope that the system will find
them upon boot and proceed without errors.

I would like to know the proper way to do this.

Oh!  I had mounted the lv's on temp mount points /var2/, /home2/ etc and
copied the original's data over and umounted so that upon remount they would
again be avail able.

Thanks in advance.

Badiane




_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
