From: "Jan H. van Gils" <JanVG@Knoware.NL>
Subject: RE: [linux-lvm] Unable to create a physical volume on a whole disk
Message-ID: <002d01c2fbba$7e0c7670$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3E8F471D.3030105@comedia.it>
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
Date: Sat Apr  5 15:30:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>Jan H. van Gils wrote:
>> 	Hi,
>> 
>> Thanks for reading this message.
>> 
>> The following is the case, I would like to create a pv on a 
>whole disk 
>> but pvcreate gives me the message that there is a "partition 
>table" on 
>> the disk.
>> 
>> I removed the partition table with "dd if=/dev/zero 
>of=/dev/hdb bs=512 
>> count=1" The fdisk command shows me that there is no partion 
>table but 
>> pvcreate tells me
>> different.
>

Luca Berra wrote :

>check if kernel has seen a partition during boot (cat 
>/proc/partition) in this case you either have to issue
>
>blockdev --rereadpt /dev/hdb
>or reboot

Luca, I alleady tried a reboot and that didn't solve the problem.

Any other suggestions ?


Jan

----
With regards Jan H. van Gils
Internet web-page http://www.Knoware.NL/users/janvg/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
