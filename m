Return-Path: <mokatz@radio.PSCL.CWRU.Edu>
Date: Fri, 18 May 2001 10:33:25 -0400 (EDT)
From: Mo Katz <mokatz@radio.PSCL.CWRU.Edu>
Subject: Re: [linux-lvm] Problem with LVM root
In-Reply-To: <20010518072259.L1937@jadzia.josv.com>
Message-ID: <Pine.LNX.4.21.0105181029550.26869-100000@radio.PSCL.cwru.edu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Nope that's not it.  I have a normal /dev, no devfs, i'm not crazy enough
to muck about with that yet.  :-) Thanks for hte suggestion, tho'

-- 
Mo Katz  --  mokatz@radio.cwru.edu
Webcasting Director, WRUW-FM 91.1
Hear us on the web: http://radio.cwru.edu

On Fri, 18 May 2001, Jos Visser wrote:

> Hi,
> 
> Could it be that you are using the devfs /dev device file system? In
> that case /dev is not mounted after you changed the root file system
> (using the pivot_root() system call). When init starts, it communicates
> with others through the /dev/initctl file. When that file does not
> exist, it loops...
> 
> The solution? In your linuxrc, mount /dev after changing the root file
> system.
> 
> ++Jos
>
> P.S. It might of course well be something else, but I experienced the
> same behaviour and this turned out to be the solution....
> 
