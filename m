From: qv7 <sundiatah1@comcast.net>
Message-Id: <1064318752.23712.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: vgcreate problem
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
Date: Tue Sep 23 08:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: bluca@comedia.it

On Tuesday 23 September 2003 02:40 am, Luca Berra wrote:
 
>
> you are using lvm 1 with a kernel compiled with devfs
> you have to use the long devfs names, check /proc/partitions
>
 

Thanks for the tip.
Tried this:

vgcreate genis /dev/ide/host0/bus0/target0/lun0/part6

vgcreate genis /dev/ide/host0/bus0/target1/lun0/disc

and got the same error message (vgcreate -- no valid physical volumes in
command line)

Any clues as to what is going on here?

Qv6
