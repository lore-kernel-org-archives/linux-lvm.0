Subject: Re: [linux-lvm] system crash caused by lvm's fault?
Message-ID: <20021019185354.GA4945@fib011235813.fsnet.co.uk>
References: <20021019150738.GA1434@fib011235813.fsnet.co.uk> <Pine.LNX.4.44.0210191901260.14709-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210191901260.14709-100000@server.piarista-kkt.sulinet.hu>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Sat Oct 19 13:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Oct 19, 2002 at 07:01:36PM +0200, NagyZ wrote:
> On Sat, 19 Oct 2002, Joe Thornber wrote:
> 
> > On Sat, Oct 19, 2002 at 12:08:44AM +0200, NagyZ wrote:
> > > hi!
> > > 
> > > i have 1 VG with 5-6 LV.
> > > when one of my disks dont get enough power and 'fell out', then my ftp 
> > > processes get to state 'detach', and even kill -9 cant kill them..
> > > load is starting to get higher, and higher, and then VM says not enought 
> > > memory.. and kernel crashes.
> > > it is on p4, with 512MB ram, with 906G VG..
> > > 
> > > can i avoid this crash?
> > > i mean, when one disk fell off, then how can i kill this processes, and 
> > > unmount the lvs? any idea?
> > 
> > What version of LVM are you running and whay kernel ?
> > 
> LVM 1.0.5 with kernel 2.4.19

This is not an LVM problem.  I think your memory is just filling up
with io destined for that vanished device.

- Joe
