Return-Path: <bkonosky@texas.net>
Message-ID: <3B5A5DDC.60301@texas.net>
Date: Sun, 22 Jul 2001 00:00:12 -0500
From: Ben Konosky <bkonosky@texas.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help.
References: <3B5A585F.1070003@texas.net> <424370000.995776829@dizzy>
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

vgexport -a gives no volume groups found. vgexport myvg   gives volume 
group "myvg" doesn't exist.



And yes, I had one LV spanning across all three PVs.



Steven Lembark wrote:

>- Ben Konosky <bkonosky@texas.net> on 07/21/01 23:36:47 -0500:
>
>>I had a VG that had three PVs in it, one of the PVs failed, is there any 
>>way to trick the VG into thinking it only has two PVs in it so I can 
>>*try* to mount it and see what data I can pull off the remainder. The 
>>file system is reiserfs, and it was the third PV in the group that died.
>>
>
>vgexport and import it back with the valid PV's.  You'll loose whatever
>was on the missing PV.  If any of the LV's spanned PV's then you'll loose
>those LV's.
>
>sl
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
