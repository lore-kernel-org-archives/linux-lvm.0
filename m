From: Spam <spam@tnonline.net>
Message-ID: <97161025390.20031106132358@tnonline.net>
Subject: Re: [linux-lvm] Can I dd one disc of a lv
In-Reply-To: <20031106130748.A15981@wagener.nu>
References: <20031106130748.A15981@wagener.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Nov  6 06:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Tobias Wagener <linux-lvm@sistina.com>


> Hi,

> I have 3 discs, two 180 GB and one 200 GB drive, every drive is
> one Partion with a one PV which builds a 560 GB VG from that I 
> get a 500 GB LV.

> Now the 200 GB hdd is faulty. But I have no change to extend the 
> LV, because the Max LV Size is 512 GB. So pvmove isn't possible.
> But I have another 200 GB Drive in my system. 

> Now the question: Can I "dd" the faulty 200 GB drive to the new 200 GB
> drive? And if, how? Does "dd if=/dev/hde1 of=/dev/hdf1" the job, or what
> have I to do?


  Use dd_rescue instead. That tool is developed to be better than dd
  for copying data off bad drives. dd_rescue can also walk backwards.
  If your system freezes when reaching bad blocks then you can write
  down the block and tell dd_rescue to copy the disk backwards up to
  that block.

> Greetings Tobias



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
