Subject: Re: re[2]: [linux-lvm] A little Cluster/Newbie help pls!
From: Matt Schillinger <mschilli@vss.fsi.com>
In-Reply-To: <20030328151303.WDJJ21472.imf43bis.bellsouth.net@tiger2>
References: <20030328151303.WDJJ21472.imf43bis.bellsouth.net@tiger2>
Content-Transfer-Encoding: 7bit
Message-Id: <1048865525.7750.57.camel@mosix>
Mime-Version: 1.0
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
Date: Fri Mar 28 09:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, 2003-03-28 at 09:24, Greg Freemyer wrote:
> 
>  >>  As a side note, there is OpenGFS ( i don't know where it is in
>  >>  alpha/beta release, but it is open source).
> 
> Ignoring SPOF issues, I would say it is beta quality at best.
> 
> To handle the SPOFs:
>     You must use an external RAID controller.  ($$)
>     You have to setup a HA cluster to run the lockserver.  I don't know if transparent failover can be achieved.
> 

Trasparent.. good point.. I have active-active samba, and what I've
found is this...

Due to state issues, failover WILL cause any 'during failover' file
operations to fail. But on the other side of that, the way that samba
deals with file moves/copies ensures that no data will be lost.. simply,
restart the operation immediately after the error. In our system, the
error occurs the moment that the failover machine takes over. other than
having to redo any 'in failover' operations, the failover is completely
transparent to clients.. if no operations are occuring, then there will
be no sign to clients that a failover occured.

Matt Schillinger
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
