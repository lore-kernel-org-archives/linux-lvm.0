From: Scott Mcdermott <smcdermott@questra.com>
Subject: Re: [linux-lvm] How long does PVmove take
Message-ID: <20030806143009.GG7336@questra.com>
References: <200308051754.13652.bjzolp@wisc.edu> <20030806085253.GC375@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030806085253.GC375@fib011235813.fsnet.co.uk>
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
Date: Wed Aug  6 09:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joe Thornber on Wed  6/08 09:52 +0100:
> > I have to remove 4 120GB IDE drives from a LVM on a P2
> > 450Mhz machine.  I have been pvmoving one of them for
> > about the last 5 days.  Is this a normal time frame?
> > How much longer can I expect?
> 
> I moved 30G in about 40 minutes yesterday. (LVM2)

that is an *huge* improvement over speed of LVM1 :)

although, you only got LVM2 pvmove working very
recently...is that something you would trust on production
machine?
