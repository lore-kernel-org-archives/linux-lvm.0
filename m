Date: Fri, 13 Oct 2017 09:41:11 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20171013144111.GA2570@redhat.com>
References: <DB6PR0902MB2213A3709365A8B5F151390C954B0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB6PR0902MB2213A3709365A8B5F151390C954B0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
Subject: Re: [linux-lvm] add_lockspace done -19
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Moshe Lazarov <Moshe.Lazarov@axxana.com>

On Thu, Oct 12, 2017 at 06:30:24PM +0000, Moshe Lazarov wrote:
> I am using the following script to create shared VGs using SANLOCK. However,
> I keep getting an error when trying to add the lock space.

The lvmlockd man page you mention lists the steps you should follow
under "Initial set up", but the commands you have shown are nothing
at all like that.  Please follow these steps.  I'm copying from the
man page and adding some of the commands you have used:


1. choose a lock manager

You have chosen sanlock.

2. configure hosts to use lvmlockd

You must edit /etc/lvm/lvm.conf on all of your nodes, setting
global {
 locking_type = 1
 use_lvmlockd = 1
 use_lvmetad = 1 (this is optional)

Then edit /etc/lvm/lvmlocal.conf on all of your nodes, setting
local {
 host_id = 1  (on the first host)
 or
 host_id = 2  (on the second host)
 etc

3. start lvmlockd

# lvmlockd

4. start lock manager

# systemctl start sanlock

5. create VG on shared devices

I get the impression that you would like to create a special, small VG on
sdb2 to hold the sanlock global lock, and then a general purpose VG on
sdc1.  To do that:

# vgcreate --shared global /dev/sdb2

# vgcreate --shared vg1 /dev/sdc1

(You are not required to create the special small VG for the global lock.
If you want to use a single general purpose VG, you could just leave out
the first vgcreate.)

6. start VG on all hosts

# vgchange --lock-start

(run that on all your hosts; they should all start "global" and "vg1")

7. create and activate LVs

lvcreate -n slowlv -L 150G vg1 /dev/sdc1

Once that works, please let me know what part of the man page was not
clear to you.  Thanks


> #Lock VG & LV
> 
> vgcreate --verbose --config global/use_lvmlockd=0 vglock /dev/sdb2
> 
> lvcreate --config global/use_lvmlockd=0 -n locklv -L 10MB vglock
> 
> sanlock direct init -s lsgl:1:/dev/vglock/locklv:0
> 
> sanlock client add_lockspace -s lsgl:1:/dev/vglock/locklv:0

I'm curious what led you to believe that you should use commands like
these?
