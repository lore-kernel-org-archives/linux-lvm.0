Message-ID: <3FE37C0B.2080609@alteeve.com>
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Ext3 -> ReiserFS on '/' convertion prob
References: <3FE2892B.8000506@alteeve.com>	 <1071846372.22613.2.camel@gecko.indygecko.com>	 <3FE32D1A.6040500@alteeve.com> <1071857908.22615.13.camel@gecko.indygecko.com> <3FE357AA.6090305@alteeve.com> <3FE36341.5070105@stercomm.com> <3FE36579.8090605@alteeve.com> <3FE36BAF.7030406@stercomm.com>
In-Reply-To: <3FE36BAF.7030406@stercomm.com>
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
Date: Fri Dec 19 16:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I will investigate that further... May I make one more comment that may 
help me solve this? Quick note, since the last post I wiped the test 
server and re-installed, just in case I had foobar'ed something along 
the way.

I have made a backup of '/' (from '/dev/vg0/root') to the backup drive 
(/dev/sdd1) and edited '/etc/fstab', '/etc/mtab' and deleted 
'/etc/blkid.tab' (which, if I understand is just a cache). I did this on 
both the '/' (/dev/vg0/root and /dev/sdd1) while under the Linux Rescue 
disk (Fedora Core 1 install in 'linux rescue') and finally I updated 
'/boot/grub/grub.conf' on both partitions as well to contain entries 
pointing '/' to '/dev/sdd1'. When I reboot (before converting the LVM LV 
to ReiserFS) and choose to boot into '/dev/sdd1' as root it -seems- to 
work. When I type:

# df

It shows '/' to be '/dev/sdd'. Now to verify this I did:

# cd /
# touch test.txt
# mkdir vg0
# mount /dev/vg0/root /vg0

I then checked to see if the 'test.txt' file was there, and it was. How 
the heck can the original settings for '/dev/vg0/root' be -SO- 
persistent that even 'df' thinks that the wrong partition is mounted?!? 
Where are these settings stored?

Side note: When I boot again off the rescue disk and run the same test 
(with '/dev/sdd1' mounted as '/') then it is fine, there '/' really is 
'/dev/sdd1'...)

Anyway, I am off to try converting again now that I know to try passing 
"init=reiserfs" in grub (will it work though?... Off to see!)

Thank you for being so helpful and patient while I pound my head through 
this!

Madison

Chris Cox wrote:
> Madison Kelly wrote:
> 
>> I am so sorry for asking but how would I check?
>>
> 
> I'm a SUSE user myself.  It's mkinitrd script
> makes it pretty easy to add modules to your
> initrd.  I'd check that lvm_mkinitrd script
> of yours... you may have to tweak it.
> In fact, SUSE's script detects (tries anyway) if
> your root filesystem is LVM's and automatically
> adds in the lvm_mod if it wasn't specified.
> 
> There's probably a way to find out easily if
> it's there already.. just not sure off the top of my head.
