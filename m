Message-ID: <3E6C46F3.4050500@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and md
References: <3E6803F3.5060507@exavio.com.cn> <3E68BDA5.175E6C6C@silicide.dk> <3E6BEB8B.4040802@exavio.com.cn>
In-Reply-To: <3E6BEB8B.4040802@exavio.com.cn>
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
Date: Mon Mar 10 02:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Peter Yao wrote:
>> why would you need to hide the hardware details from md ?
> 
> I am using some hot-plugging disks and their device number may change 
> after reboot. For example, if i build md with /dev/sda and /dev/sdb, 
> after reboot md may cannot start because the two disks' device name 
> change to /dev/sdc and /dev/sdd. If i build md on top of lvm this 
> problem is avoided. Can you give me some advice for this issue?

it depends on what you use to start your md devices, using raidstart 
with an /etc/raidtab file shows this behaviour, using auto-detect does 
not but is only available at boot. best thing would be to use mdadm 
instead of raidstart

http://www.cse.unsw.edu.au/~neilb/source/mdadm

with this you can define your raid arrays based on UUID instead.

to create mdadm conf file use:

echo "DEVICE partitions" >> /etc/mdadm.conf
mdadm -E -s |grep ARRAY >>  /etc/mdadm.conf

-- 
Luca Berra -- bluca@comedia.it
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
