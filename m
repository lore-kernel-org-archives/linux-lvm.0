From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: Re: [linux-lvm] system crash caused by lvm's fault?
In-Reply-To: <20021019150738.GA1434@fib011235813.fsnet.co.uk>
Message-ID: <Pine.LNX.4.44.0210191901260.14709-100000@server.piarista-kkt.sulinet.hu>
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
Date: Sat Oct 19 12:02:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 19 Oct 2002, Joe Thornber wrote:

> On Sat, Oct 19, 2002 at 12:08:44AM +0200, NagyZ wrote:
> > hi!
> > 
> > i have 1 VG with 5-6 LV.
> > when one of my disks dont get enough power and 'fell out', then my ftp 
> > processes get to state 'detach', and even kill -9 cant kill them..
> > load is starting to get higher, and higher, and then VM says not enought 
> > memory.. and kernel crashes.
> > it is on p4, with 512MB ram, with 906G VG..
> > 
> > can i avoid this crash?
> > i mean, when one disk fell off, then how can i kill this processes, and 
> > unmount the lvs? any idea?
> 
> What version of LVM are you running and whay kernel ?
> 
LVM 1.0.5 with kernel 2.4.19

NagyZ
