Subject: Re: [linux-lvm] Problems after upgrading LVM
From: Klaus Agnoletti <ultra@mailme.dk>
In-Reply-To: <1007456242.666.2.camel@ultra>
References: <1007411943.2423.2.camel@ultra> 
	<20011203130616.E20168@auctionwatch.com>  <1007456242.666.2.camel@ultra>
Content-Transfer-Encoding: 7bit
Message-Id: <1007626843.693.0.camel@ultra>
Mime-Version: 1.0
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
Date: Thu Dec  6 00:18:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I got my problem solved.
It seems like I can't restore a vg created with an older version of LVM
than the one I am currently using.
This means that VGs in my stup created with LVM 0.9 can't be restored
after upgrading to 1.0.1.
Is this a bug ? (I would say yes) - if not, what is the correct
procedure to get your VG up and running after an update ?

I tried doing a 
vgcfgrestore -n vg_name /dev/hdXX (for each pertitions in the VG)
vgchange -ay

And after that just a regular mount.

After this discovery, my setup is debian linux with kernel 2.4.16 (which
has lvm 1.0.1rc4) and the tools for lvm 0.9 which I originally created
the vg with) - to me this sounds rather weird.

What did I miss ?


Thanks,

Klaus Pedersen
