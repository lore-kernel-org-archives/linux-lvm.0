From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Max storage size per system
Message-ID: <20030306101955.GB11324@gw.silicide.dk>
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030304144121.GB23975@hcsd.de>
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
Date: Thu Mar  6 04:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 04, 2003 at 03:41:21PM +0100, Stephan Austermuehle wrote:
> On Tue, Mar 04, 2003 at 03:30:29PM +0100, Jon Bendtsen wrote:
> 
> > So, this would mean 2TB pr. LV, but there can also be a number of LV's.
> 
> Okay, so the LVM can manage really large disk storage. Does anybody know
> whether the number of mounted filesystem per Linux system is limited?

i think you need to read up on how LVM works. In the bottom you have pv's.
physical volumes. They are divided into physical extends which can be from
4k to 16G. But you set this for the hole VolumenGroup. The VG has a name,
and can span several physical devices. Inside this VG, you make a LV,
LogicalVolumen. The LV can hold 64k PE, physical extends, which if you
make them 16G... means 1024T ? however, the LV is a blockdevice, and
thus an LV cant be bigger than 2T. So you would have to use many LV's
to store 100+T.


> > How much space do you need anyway ?
> 
> 100+ Terabytes

What do you need it for ?




JonB
