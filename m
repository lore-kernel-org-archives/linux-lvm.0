Return-Path: <bkonosky@texas.net>
Message-ID: <3B5CD750.300@texas.net>
Date: Mon, 23 Jul 2001 21:02:56 -0500
From: Ben Konosky <bkonosky@texas.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help.
References: <3B5A585F.1070003@texas.net> <20010723095222.A10807@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

That didn't work :( Now that I look at it, that drive must have been the 
first one in the VG/LV :( At least I had most, but not all of the data 
on that LV backed up. Well, now I know better than to use a drive in a 
LV that used to be in a computer that was under adverse conditions(like 
my car), without keeping all the data backed up.

Thanks for all the help,
Ben Konosky



Heinz J. Mauelshagen wrote:

>On Sat, Jul 21, 2001 at 11:36:47PM -0500, Ben Konosky wrote:
>
>>I had a VG that had three PVs in it, one of the PVs failed, is there any 
>>way to trick the VG into thinking it only has two PVs in it so I can 
>>*try* to mount it and see what data I can pull off the remainder. The 
>>file system is reiserfs, and it was the third PV in the group that died.
>>
>
>Ben,
>
>you mention in our other e-mail, that you had an LV spanning all 3 disks
>containig a reiserfs.
>If your PV is lost *and* you don't have an actual backup, you'll loose fs
>data anyway :-(
>
>If you still want to get the LV *partially* back, you need a replacement
>disk/partition of the same size the gone PV had, vgcfgrestore(8) the LVM
>metadata to it and run "vgscan;vgchange -ay".
>
>>Thanks in advance,
>>Ben Konosky
>>bkonosky@texas.net
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
