From: Qv6 <sundiatah1@comcast.net>
Subject: Re: [linux-lvm] vgcreate problem
References: <200309230122.09869.sundiatah1@comcast.net> <20030923064024.GA28343@percy.comedia.it>
In-Reply-To: <20030923064024.GA28343@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200309230745.09785.sundiatah1@comcast.net>
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
Date: Sun Sep 28 09:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, bluca@comedia.it

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
