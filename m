Message-ID: <3D57FD4A.9773B28B@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] applications not working with lvm
References: <3D57F98C.9040408@jumpline.com>
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
Date: Mon Aug 12 13:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ben Snyder wrote:

> I've got an application that simply wont work (sorry, dont want to give
> too many details).  It creates very large quantities of hard links,
> binds a local directory to /proc, creates local files to represent block
> devices and FIFO files.  All of this is in order to create a virtual
> server for users.  I've tried to do many of these operations manually,
> with perfect success, although I'm not trying to perform them on the
> same scale at the same speed as the hosting software.

This sound like a linux vserver. I'm running my vserver on a LVM, though
i dont use hardlinks at all.



JonB
