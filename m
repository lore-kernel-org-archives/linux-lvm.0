Message-Id: <4186.200.184.103.3.1018972960.squirrel@www.dokbua.com>
Subject: RE: [linux-lvm] kernel: invalidate: busy buffer
From: "Rene @ Webscorpion.com" <rene.madsen@webscorpion.com>
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F124@cdserv.meridian-data.com>
References: <2D0AFEFEE711D611923E009027D39F2B02F124@cdserv.meridian-data.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Apr 16 11:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for the many replies. I was feeling a little lonely there for a
moment.

> I also don't know why your lvcreate dumps core.  How recent are your
> LVM tools?  Try using the -d option to lvcreate to see how far it gets,
> or run lvcreate from within gdb.


LVM tools are 1.0.3 - but as I said, I was unable to run the patch against
my kernel source -- and I need and -AC kernel to keep aquote happy.

I know there is a LVM 1.1-rc1 release available, however, call me chicken
but I don't dare installing software that comes with a note
like "Disclaimer: This release is not meant to be run on production
systems."

Will try -d option later (no access to server from where I am now).

How would I go about running lvcreate from within gdb? Sorry I'm not a
programmer :-)
