Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1144644580.3783.35.camel@halifax>
References: <1144644580.3783.35.camel@halifax>
Message-Id: <a86187fc9ecdf80643a8bc47229f48d4@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lost volume group
Date: Tue, 11 Apr 2006 09:53:38 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: crap.central@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

I'll assume you had one disk (hdb4)  to start with, and you wanted to 
extend the VG by adding (hdb2).

When you did the mkfs, you destroyed the LVM label on the newly added 
disk. You are probably now getting something like:
Couldn't find device with uuid...
Couldn't find all physical volumes...

You need to do the vgcfgrestore, as you said, but doing:
prompt> vgcfgrestore swampvg
will give you:
Couldn't find device with uuid '<your uuid>'
...

You can easily recreate that uuid on that device and restore by doing:
prompt> pvcreate -u <your uuid> /dev/hdb4
prompt> vgcfgrestore swampvg

You should be good to go now.

  brassow

On Apr 9, 2006, at 11:49 PM, Petes Junk wrote:

> When i was extending a group to include another PV somehow the Group
> disappeared from the devices list after a reboot.
>
> The last entry in /dev/lvm/backup shows me executing
> /usr/sbin/vgextend swampvg /dev/hdb2
> to an already working /dev/swampvg/swamplv with a non striped /dev/hdb4
> in it.
>
> I then did a mkfs -t ext3 /dev/hdb2 (the new disk) which was probably
> how i got into trouble. I really need the image from /dev/hdb4 and im
> afraid to do anything with it without knowing exactly what im doing. Im
> thinking all i need is to recreate the VG and LV with only /dev/hdb4. I
> have several archives in the /dev/lvm/archive but docs are not clear 
> how
> to approach this. I backed up the partition to another with dd so i
> could try work on it safely, but the LVM tools didnt like the fact that
> it had two uuid labels the same and always picked /dev/hdb4 to work on.
>
> Since then Ive been reading what little there is on LVM. Cant even find
> a sysadmin book with more than 3 pages on the subject. Im very 
> surprised
> at the man page for vgcfgrestore where its options are not even
> explained.
>
> Any help is greatly appreciated.
>
> Pete
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
