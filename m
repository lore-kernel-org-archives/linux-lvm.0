Subject: Re: [linux-lvm] lvm and md
Mime-Version: 1.0 (Apple Message framework v551)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <001501c2ef4b$98bf6160$c70aa8c0@RD.proware.com.tw>
Message-Id: <3CE8FFA8-5BB5-11D7-A761-0003937830E4@mac.com>
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
Date: Fri Mar 21 09:54:17 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, March 20, 2003, at 08:45  PM, Rocky Lee wrote:
> I've set the
> "persistent_superbit  1"  in raidtab
> all disk partition type were also all " raid auto detect"
>
> then if I delete the original raidtab file and reboot.
> the system couldn't find the raid device, the LVM coundn't find the 
> volume
> either.
> does md have to depend on the raidtab file?
>
Did you change the persistent_superbit in raidtab before creating the 
RAID?  If not, it didn't get written to the RAID superblock stored 
inside the partitions
used for the RAID -- and that's where it must be for raid autodetect to 
work.
Autodetect doesn't use raidtab -- the only thing that uses raidtab are 
the
raidtools themselves.

You might want to consider using mdadm instead of raidtools.

Dale J. Stephenson
dalestephenson@mac.com
