Subject: Re: [linux-lvm] FYI: Going back to LVM1 from LVM2
Mime-Version: 1.0 (Apple Message framework v552)
From: AJ Lewis <lewis@sistina.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <3F66DC9B.7050101@webhackande.se>
Message-Id: <0F72BC18-E849-11D7-B784-000393DC1896@sistina.com>
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
Date: Tue Sep 16 08:25:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

If device nodes are missing, vgmknodes should help in LVM1.

On Tuesday, Sep 16, 2003, at 04:49 US/Central, Rickard Olsson wrote:

> For various reasons (when I fix it, I'll Tell the Tale) I installed 
> LVM2 today. It didn't solve my immediate problems, so I tried to go 
> back to LVM1. However, the dev/vg_name/lv_name node had disappeared 
> and even though both vgchange -ay, vgscan, lvscan and pvscan all 
> reported seeing the lv fine, mount could not find it.
>
> A reboot did not help. Panic lurked.
>
> However, vgchange -an followed by vgchange -ay helped.
>
>    / Rickard Olsson,IT-Konsult/
>   / Telefon: +46 70 635 01 42/
>  / http://www.webhackande.se/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: 
lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint = D638 9C01 D08F 29A4 5D50  D064 F6A6 0ED6 E386 
E6EB
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...

Behind every good computer -- is a jumble of wires 'n stuff.
