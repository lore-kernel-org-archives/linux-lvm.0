Message-ID: <1026674081.3d31cda16b6d1@lola.Pin.LU>
From: Christian Limpach <chris@Pin.LU>
Subject: Re: [linux-lvm] RAID extension and lvm
References: <Pine.LNX.4.44.0207142010160.29796-100000@poseidon.ihs.uni-stuttgart.de>
In-Reply-To: <Pine.LNX.4.44.0207142010160.29796-100000@poseidon.ihs.uni-stuttgart.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sun Jul 14 14:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Ralf Eisinger <rei@ihs.uni-stuttgart.de>

Quoting Ralf Eisinger <rei@ihs.uni-stuttgart.de>:

> Is it possible to handle that with lvm and when the answer is "yes", in
> which way? One point was a command named "pvresize" but I didn't find it
> in my distribution (SuSE 8.0) and I find nothing about that in the HOWTO.

You want to (find and) use the pvresize command, it is available at least in 
1.1-rc2: ftp://linux.msede.com:21/lvm/1.1/lvm_1.1-rc2.tar.gz
This should work well if your pv spans your raid5 device completely or at 
least your pv is at the end of your raid5 device.

If you don't want to try pvresize, you have two other options:
- if your raid5 device has a partition table, you can add the new space as a 
new partition and pvcreate a new pv on this partition and add the new pv to 
your volume group.
- you can use losetup with the -o option to create a loopback device covering 
the new space.  This is definitely not an ideal setup, but it should work and 
most of all it should work even if you couldn't use pvresize.

Then there's a few more options if you use device-mapper which lets you map 
multiple ranges of sectors into a device.

-- 
Christian Limpach <chris@Pin.LU>
