Message-ID: <3F51BF42.6070403@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to migrate data from one Hard Drive to a new
 one
References: <1062272914.11039.103.camel@candido>
In-Reply-To: <1062272914.11039.103.camel@candido>
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
Date: Sun Aug 31 04:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Luca Da Col wrote:

[cut]

> I finally decided to upgrade my old 6.5G HD to a new 120G HD; is the procedure described in
> http://www.tldp.org/HOWTO/LVM-HOWTO/removeadisk.html  a safe way to migrate all my data 
> from the former to the 120G? I mean, my case is slightly different from the one described 
> because of /boot partition and LILO in the MBR...

yes, but if you are worried, you can do it like this:
mount the new "partition" (real or LV) to /mnt
cd /the_source, eg. /usr /var /home ...
find -xdev | cpio -pm /mnt
umount /mnt
repeat for the next source.

The process is described in the software raid howto.
Remember to edit the new /etc/fstab and new /etc/lilo.conf,
and run lilo with lilo -r /mnt



JonB
