From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Implementation questions
Message-Id: <20011219033014.A2938@tiger.bigcats.invalid>
References: <25E4CA13D679FF48BC30769420220971467A2C@nd1-clusa.local.bunnings.com.au>
    <3C1F07D1.9020008@promofinarsa.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C1F07D1.9020008@promofinarsa.es>; from
    jesus_navarro@promofinarsa.es on Tue, Dec 18, 2001 at 10:09:37AM +0100
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
Date: Tue Dec 18 20:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Jesus!

Jesus Manuel NAVARRO LOPEZ (jesus_navarro@promofinarsa.es) wrote 73 lines:
> Colin Coe wrote:

> > As I have about 130 of these to do, I am toying with the idea of installing
> > a cut-down Linux system with XFS, LAM, md and ramdisk support and making a
> > bootable CD-ROM which I can then use to configure the system how I want it.

> As you're talking about a farly respectable number of boxes, the 
> automated idea seems reasonable.  I would have a look at the LUI project 
> from IBM and/or even a physical disk replicator: the first option will 

There is also the FAI project, which AFAIK has found it's way
into Debian by now.  You'll probably want network for it --
a networkcard with bootprom is a real boon there.

    http://www.informatik.uni-koeln.de/fai/

-Wolfgang
