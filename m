From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Testing LVM2
Message-ID: <20030715174134.GA657@trip.muon.local>
References: <20030714002149.GA1041@trip.muon.local> <20030715012858.Q19265@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030715012858.Q19265@uk.sistina.com>
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
Date: Tue Jul 15 10:42:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 15.07.03, Alasdair G Kergon <agk@uk.sistina.com> wrote:
> On Mon, Jul 14, 2003 at 12:21:49AM +0000, Nils Juergens wrote:
> > configure --with-kernel-dir=/usr/src/linux-2.5.75
> 
> Does ./configure *without* the --with-kernel-dir bit work any better?

In fact, it does. But using lvm2 does not.

I created a vg with on pv and one lv named "test". Then i create ext3
filesystem on it and mount it. Then i try to create a snapshot of this lv:

root@guldukat:~# lvcreate -s -n snap /dev/vol/test  -L 50M
Rounding up size to full physical extent 52.00 MB
device-mapper ioctl cmd 2 failed: Invalid argument
Couldn't load device 'vol-snap'.
Problem reactivating origin test

dmesg says:

device-mapper: ioctl interface mismatch: kernel(1.0.6), user(4.0.0), cmd(0)
device-mapper: ioctl interface mismatch: kernel(1.0.6), user(4.0.0), cmd(0)
device-mapper: internal error adding target to table
device-mapper: ioctl interface mismatch: kernel(1.0.6), user(4.0.0), cmd(0)
device-mapper: ioctl interface mismatch: kernel(1.0.6), user(4.0.0), cmd(0)
kjournald starting.  Commit interval 5 seconds
EXT3 FS on dm-2, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
device-mapper: ioctl interface mismatch: kernel(1.0.6), user(4.0.0), cmd(0)
device-mapper: internal error adding target to table

so i guess i have to update the device-mapper in the kernel.

thanks,

Nils
	
-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).
