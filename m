From: Marc MERLIN <marc@merlins.org>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <20020212070020.GN22416@merlins.org>
References: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
    <3C6187A0.3DFEA8BE@lmco.com> <3C6242D0.3090005@promofinarsa.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C6242D0.3090005@promofinarsa.es>
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
Date: Tue Feb 12 01:00:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 07, 2002 at 10:03:12AM +0100, Jesus Manuel NAVARRO LOPEZ wrote:
> That's plainly untrue: AMANDA for one is free and very good for small 
> systems.

We use amanda at VA Software, and  also for sourceforge.net, but while it is
nice as long  as your backup sets  are smaller than half your  tape size, it
starts to choke  a bit when you  have backups that start  reaching your tape
size, and it fails miserably if any backup takes more than your tape.

It is disapointing  that in the last 3 years,  that major shortcoming hasn't
effectively been fixed, but  eh, it's free software, I get to  fix it if I'm
not happy :-)

As for autoloaders  and tape libraries, you  can make it work  with mtx, but
expect to have  to write some glue  and to go through non  trivial trial and
error.

Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
